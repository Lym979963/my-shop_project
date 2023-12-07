package servlet;


import dao.ProductDao;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/bianServlet")
public class bianServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        // 获取URL参数
        String action = request.getParameter("action");
        String table = request.getParameter("table");
        int id = Integer.parseInt(request.getParameter("id"));
ProductDao pD=new ProductDao();
        if (action.equals("update")) {
            // 根据商品ID查询商品信息
            Product product = pD.getProductById(table,id);

            // 将商品信息存入request中，供编辑页面使用
            request.setAttribute("product", product);
           request.setAttribute("table",table);
            // 转发到编辑页面
            try {
                request.getRequestDispatcher("/edit_product.jsp").forward(request, response);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }

    }
}
