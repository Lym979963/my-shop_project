package servlet;


import dao.ProductDao;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.math.BigDecimal;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.List;

import static jdk.nashorn.internal.objects.NativeError.getFileName;

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
    private ProductDao productDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        productDAO = new ProductDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException{
        String action = request.getParameter("action");
        String table =request.getParameter("table");
        Enumeration<String> parameterNames = request.getParameterNames();

        if (action != null && !action.isEmpty()) {
            switch (action) {
                case "add":
                    String name = request.getParameter("name");
                    
                    BigDecimal price = new BigDecimal(request.getParameter("price"));
                    String description = request.getParameter("description");


                    String url=request.getParameter("url");



                    Product product = new Product(name, description, price,url);
                    productDAO.addProduct(table,product);

                    // 添加成功后的跳转或响应
                    break;

                case "delete":
                    int id = Integer.parseInt(request.getParameter("id"));

                    productDAO.deleteProduct(table,id);
                    // 删除成功后的跳转或响应
                    break;

                case "update":
                    int updateId = Integer.parseInt(request.getParameter("id"));
                    String updateName = request.getParameter("name");
                    BigDecimal updatePrice = new BigDecimal(request.getParameter("price"));

                    String decs = request.getParameter("description");

                    String imageUrl = request.getParameter("imageUrl");


                    // 更新产品信息
                    ProductDao productDAO = new ProductDao();
                    Product products = new Product(updateName,decs, updatePrice,  imageUrl);
                    productDAO.updateProduct(table,updateId,products);
                    // 更新成功后的跳转或响应
                    break;
            }
        }

        // 获取所有商品信息
        List<Product> products = null;
        try {
            products = productDAO.getAllProducts(table);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        // 将商品信息存储到request属性中，传递给admin.jsp页面
        request.setAttribute("products", products);
       request.setAttribute("table",table);
        // 转发到admin.jsp页面
        try {
            request.getRequestDispatcher("admit.jsp").forward(request, response);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length() - 1);
            }
        }
        return "";
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException {
    doGet(request,response);
    }
}
