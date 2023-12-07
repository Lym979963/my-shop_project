package dao;

import Utils.Dbutil;
import model.Order;
import model.OrderItem;
import model.Product;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class payDao {
    public void saveOrder(int userId, List<OrderItem> orderItems) {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = Dbutil.getConnection();
            // 执行插入订单记录的SQL语句
            String sql = "INSERT INTO orders (user_id,productId, product_name, price, quantity) VALUES (?,?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            for (OrderItem orderItem : orderItems) {
                stmt.setInt(1, userId);
                stmt.setInt(2,orderItem.getProductId());
                stmt.setString(3, orderItem.getProductName());
                stmt.setDouble(4, orderItem.getPrice());
                stmt.setInt(5, orderItem.getQuantity());
                stmt.addBatch();
            }
            stmt.executeBatch();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Dbutil.closeStatement(stmt);
            Dbutil.closeConnection(conn);
        }
    }

        public List<Order> searchOrder() throws SQLException {
            try (Connection conn = Dbutil.getConnection()) {
                QueryRunner runner = new QueryRunner();
                ResultSetHandler<List<Order>> handler = new BeanListHandler<>(Order.class);
                String sql = "SELECT * FROM orders";
                return runner.query(conn, sql, handler);
            }
        }
}

