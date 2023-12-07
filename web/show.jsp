<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2023/12/4
  Time: 19:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>订单显示</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background-image: url('image/he.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }
        table{
            background-color: #f4f4f4;
        }
        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }

        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 10% auto; /* 10% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 80%; /* Could be more or less, depending on screen size */
        }

        .navbar {
            background-color: #3052e1;
            color: white;
            padding: 10px;
        }

        .navbar ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            display: flex;
        }

        .navbar li {
            margin-right: 10px;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            padding: 5px;
        }

        .navbar a:hover {
            background-color: #fff;
            color: #3052e1;
        }

    </style>
</head>
<body>
<div class="navbar">
    <ul>
        <li> <a href="editServlet?table=products">玩具区设置</a></li>
        <li> <a href="editServlet?table=stationery">文具区设置</a></li>
        <li> <a href="editServlet?table=clothes">衣物区设置</a></li>
        <li> <a href="orderServlet">订单展示</a></li>
        <li><a href="wait_to_shop.jsp">返回主界面</a></li>
    </ul>
</div>
<h1>商品目录管理</h1>

<table>
    <tr>
        <th>订单ID</th>
        <th>商品ID</th>
        <th>用户ID</th>
        <th>商品名称</th>
        <th>商品价格</th>
        <th>商品数量</th>
    </tr>

    <c:forEach var="order" items="${orders}">
        <tr>
            <td>${order.id}</td>
            <td>${order.productid}</td>
            <td>${order.user_id}</td>
            <td>${order.product_name}</td>
            <td>${order.price}</td>
            <td>${order.quantity}</td>

        </tr>
    </c:forEach>
</table>

</body>
</html>
