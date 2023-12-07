<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2023/12/4
  Time: 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑页面</title>
</head>
<body>
<form action="AdminServlet" method="post">
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="table" value="${table}">
    商品id：<input type="text" name="id" value="${product.id}"><br>
    商品名称: <input type="text" name="name" value="${product.name}"><br>
    商品价格: <input type="text" name="price" value="${product.price}"><br>
    商品描述: <input type="text" name="description" value="${product.description}"><br>
    商品url: <input type="text" name="imageUrl" value="${product.imageurl}"><br>
    <!-- 其他表单字段 -->
    <input type="submit" value="Update">
</form>

</body>
</html>
