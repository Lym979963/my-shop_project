package model;

import java.math.BigDecimal;

public class Order {
    int id;
    int productid;
    int user_id;
    String product_name;
    BigDecimal price;
    int quantity;

    public Order() {
    }

    public Order(int id, int productid, int user_id, String product_name, BigDecimal price, int quantity) {
        this.id = id;
        this.productid = productid;
        this.user_id = user_id;
        this.product_name = product_name;
        this.price = price;
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", prodectid=" + productid +
                ", user_id=" + user_id +
                ", product_name='" + product_name + '\'' +
                ", price=" + price +
                ", quantity=" + quantity +
                '}';
    }

    public int getProductid() {
        return productid;
    }

    public void setProductid(int productid) {
        this.productid = productid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
