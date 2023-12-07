package servlet;

import dao.UserDao;
import model.User;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "login",urlPatterns = "/login")
public class UserLoginServlet extends HttpServlet {
    private UserService uservice = new UserService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ue = request.getParameter("username");
        String password = request.getParameter("password");
        User user = uservice.login(ue, password);
        if(user==null) {
            request.setAttribute("failMsg", "用户名、邮箱或者密码错误，请重新登录！");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }else {
            UserDao userDao=new UserDao();
            HttpSession session = request.getSession();
            String userId = null; // 从数据库中获取用户ID
            try {
                user = userDao.selectByUsernamePassword(ue,password);
// 如果会话中已存在订单数据，则删除该数据
            if (session.getAttribute("orderId") != null) {
                session.removeAttribute("orderId");
            }

// 将当前用户的ID保存到会话中
            session.setAttribute("orderId", user.getId());
            request.getSession().setAttribute("user", user);
            request.getRequestDispatcher("/wait_to_shop.jsp").forward(request, response);
            } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
