package dao;

import Utils.Dbutil;
import model.CartItem;
import model.Product;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {
    public List<Product> getAllProducts(String table) throws SQLException {
        try (Connection conn = Dbutil.getConnection()) {
            QueryRunner runner = new QueryRunner();
            ResultSetHandler<List<Product>> handler = new BeanListHandler<>(Product.class);
            String sql = "SELECT * FROM "+table;
            return runner.query(conn, sql, handler);
        }
    }
    public void addProduct(String table,Product product) {
        try (Connection conn = Dbutil.getConnection()) {
            QueryRunner runner = new QueryRunner();
            String sql = "INSERT INTO "+table+" ( name, description, price, imageurl) VALUES (?, ?, ?, ?)";
            Object[] params = { product.getName(), product.getDescription(), product.getPrice(), product.getImageurl()};
            runner.update(conn, sql, params);
        } catch (SQLException e) {
            e.printStackTrace();
            // 处理异常情况
        }
    }

    public void deleteProduct(String table, int productId) {
        try (Connection conn = Dbutil.getConnection()) {
            QueryRunner runner = new QueryRunner();
            String sql = "DELETE FROM " + table + " WHERE id = ?";
            runner.update(conn, sql, productId);
        } catch (SQLException e) {
            e.printStackTrace();
            // 处理异常情况
        }
    }

    public void updateProduct(String table,int id,Product product) {
        try (Connection conn = Dbutil.getConnection()) {
            QueryRunner runner = new QueryRunner();
            String sql = "UPDATE "+table+" SET name = ?, description = ?, price = ?, imageurl = ? WHERE id = ?";
            Object[] params = {product.getName(), product.getDescription(), product.getPrice(), product.getImageurl(), id};
            runner.update(conn, sql, params);
        } catch (SQLException e) {
            e.printStackTrace();
            // 处理异常情况
        }
    }
    public Product getProductById(String table, int id) {
        try (Connection conn = Dbutil.getConnection()) {
            QueryRunner runner = new QueryRunner();
            ResultSetHandler<Product> handler = new BeanHandler<>(Product.class);
            String sql = "SELECT * FROM " + table + " WHERE id = ?";
            return runner.query(conn, sql, handler, id);
        } catch (SQLException e) {
            e.printStackTrace();
            // 处理异常情况，比如记录日志或者抛出自定义异常
            return null;
        }
    }

    public void addToCart(int userId, CartItem cartItem) throws SQLException {
        String query = "INSERT INTO cart (user_id, product_id, product_name, price, quantity) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = Dbutil.getConnection()) {
            PreparedStatement statement = conn.prepareStatement(query);
            statement.setInt(1, userId);
            statement.setString(2, cartItem.getProductId());
            statement.setString(3, cartItem.getProductName());
            statement.setDouble(4, cartItem.getPrice());
            statement.setInt(5, cartItem.getQuantity());
            statement.executeUpdate();
        }
    }
    public List<Product> getProducts(String thing,int pageNumber, int pageSize) throws SQLException {
        List<Product> products = new ArrayList<>();

        try (Connection conn = Dbutil.getConnection()) {
            int offset = (pageNumber - 1) * pageSize;



            String sql = "SELECT * FROM " + thing + " LIMIT ? OFFSET ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, pageSize);
            statement.setInt(2, offset);


            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String imageUrl = resultSet.getString("imageurl");
                String dec=resultSet.getString("description");
                BigDecimal price = resultSet.getBigDecimal("price");

                Product product = new Product(id, name, dec, price,imageUrl);

                products.add(product);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return products;



    }

}

