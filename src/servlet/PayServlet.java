package servlet;
import dao.payDao;
import model.OrderItem;
import java.util.Map;
import java.io.BufferedReader;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.core.type.TypeReference;
@WebServlet("/payOrder")
public class PayServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 从 session 中获取用户 id
        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("orderId");



        BufferedReader reader = request.getReader();
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        String cartJson = sb.toString();

        List<OrderItem> cart = null;
        ObjectMapper objectMapper = new ObjectMapper();

        try {
            Map<String, List<OrderItem>> cartMap = objectMapper.readValue(cartJson, new TypeReference<Map<String, List<OrderItem>>>() {});
            cart = cartMap.get("cart");
        } catch (IOException e) {
            // 解析错误的处理
            e.printStackTrace();
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        payDao orderDao = new payDao();
        orderDao.saveOrder(userId, cart);

            // 清空购物车
            cart.clear();

            // 其他支付操作，比如跳转到支付页面等
            // ...

            // 返回响应
            response.getWriter().write("支付成功");
        }

}