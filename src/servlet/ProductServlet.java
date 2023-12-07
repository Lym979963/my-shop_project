package servlet;

import dao.ProductDao;
import model.Product;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/doll.jsp")
public class ProductServlet extends HttpServlet {
    private ProductDao productDao;

    @Override
    public void init() throws ServletException {
        super.init();
        productDao = new ProductDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pageNumber = 1; // 默认显示第一页
        int pageSize = 10; // 每页显示10个商品
        String thing="products";
        // 获取请求参数中的页码
        String pageParam = request.getParameter("page");
        if (pageParam != null && !pageParam.isEmpty()) {
            pageNumber = Integer.parseInt(pageParam);
        }

        // 调用ProductDao获取对应页码的商品数据
        List<Product> products = null;
        try {
            products = productDao.getProducts(thing,pageNumber, pageSize);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        // 将商品数据存储在请求属性中
        request.setAttribute("products", products);
        request.setAttribute("page", pageNumber);
        // 跳转到doll.jsp页面进行展示
        RequestDispatcher dispatcher = request.getRequestDispatcher("doll1.jsp");
        dispatcher.forward(request, response);
    }
}

