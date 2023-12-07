package servlet;


import dao.ProductDao;
import dao.payDao;
import model.Order;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/orderServlet")
public class orderServlet extends HttpServlet {
    private payDao payDAO;

    @Override
    public void init() throws ServletException {
        super.init();
       payDAO = new payDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException {



        List<Order> orders = null;


        try {
            orders = payDAO.searchOrder();
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }



        request.setAttribute("orders", orders);


        try {
            request.getRequestDispatcher("show.jsp").forward(request, response);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }


    }
}
