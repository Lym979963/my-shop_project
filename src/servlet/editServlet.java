package servlet;


import dao.ProductDao;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/editServlet")
public class editServlet extends HttpServlet {
    private ProductDao productDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        productDAO = new ProductDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        String table = request.getParameter("table");


        List<Product> products = null;

        try {
            products = productDAO.getAllProducts(table);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        request.setAttribute("products", products);
        request.setAttribute("table",table);

        try {
            request.getRequestDispatcher("admit.jsp").forward(request, response);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }


    }
}
