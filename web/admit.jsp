<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2023/12/3
  Time: 21:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>管理员界面</title>
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
        <th>ID</th>
        <th>名称</th>
        <th>描述</th>
        <th>价格</th>
        <th>图片URL</th>
        <th>操作</th>
    </tr>

    <c:forEach var="product" items="${products}">
        <tr>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.description}</td>
            <td>${product.price}</td>
            <td>${product.imageurl}</td>
            <td>
                <a href="AdminServlet?action=delete&table=${table}&id=${product.id}">删除</a>
                <a href="bianServlet?action=update&table=${table}&id=${product.id}">修改</a>
            </td>
        </tr>
    </c:forEach>
</table>
<h2>添加商品</h2>
<table>
<form action="UploadServlet?table=${table}" method="post" enctype="multipart/form-data">
    <label for="file">选择图片：</label>
    <input type="file" id="file" name="file">
    <br/>
    <input type="submit" value="上传">

</form>
<p>${uploadMessage}</p>
<form action="AdminServlet?url=${url}&table=${table}&action=add" method="post" >
    <label for="name">商品名称：</label>
    <input type="text" id="name" name="name"><br><br>

    <label for="price">商品价格：</label>
    <input type="text" id="price" name="price"><br><br>

    <label for="description">商品描述：</label>
    <textarea id="description" name="description"></textarea><br><br>
    <input type="submit" value="添加">
</form>
</table>

</body>
</html>

