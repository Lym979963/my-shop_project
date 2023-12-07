package servlet;

import dao.ProductDao;
import model.Product;

import java.io.*;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@MultipartConfig
@WebServlet("/UploadServlet")
public class uploadServlet extends HttpServlet {
        private ProductDao productDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        productDAO = new ProductDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Part filePart = request.getPart("file");
        String fileName = getFileName(filePart);
        String table = request.getParameter("table");
        // 将上传的文件保存到服务器上的指定路径下

        String basePath = getServletContext().getRealPath("/images/"+table+"/");
        
        File file = new File(basePath + File.separator + fileName);
        try (InputStream is = filePart.getInputStream();
             FileOutputStream fos = new FileOutputStream(file)) {
            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = is.read(buffer)) != -1) {
                fos.write(buffer, 0, bytesRead);
            }
        }

        List<Product> products = null;

        try {
            products = productDAO.getAllProducts(table);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        request.setAttribute("products", products);
        String url = "/images/" +table+"/"+ fileName;
        request.setAttribute("url", url);
        request.setAttribute("table", table);
        String uploadMessage = "文件上传成功！";
        request.setAttribute("uploadMessage", uploadMessage);
        // 转发到admin.jsp页面
        try {

            request.getRequestDispatcher("admit.jsp").forward(request, response);
        } catch (IOException e) {

            throw new RuntimeException(e);

        }
    }
        private String getFileName (Part part){
            String contentDisp = part.getHeader("content-disposition");
            String[] tokens = contentDisp.split(";");
            for (String token : tokens) {
                if (token.trim().startsWith("filename")) {
                    return token.substring(token.indexOf('=') + 2, token.length() - 1);
                }
            }
            return "";
        }
    }


// 添加成功后的跳转或响应