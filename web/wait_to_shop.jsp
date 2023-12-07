<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2023/11/29
  Time: 11:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background-image: url('image/back.png');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        form {

            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0,0.1);
            background-color: white;
        }
        .container {
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: white;
        }
        .form button {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            background-color: #3052e1;
            color: white;
            border: none;
            cursor: pointer;
        }

    </style>
</head>
<body>
<div class="container">
    <div class="form">
        <button onclick="location.href='shop.jsp'">进入使用</button>
        <button onclick="location.href='user_center.jsp'">修改收货信息</button>
        <button onclick="location.href='password.jsp'">修改密码</button>
        <button onclick="location.href='out.jsp'">注销</button>
        <button onclick="checkAndRedirect()">管理员选项</button>
    </div>
</div>
<% Integer orderId = (Integer) session.getAttribute("orderId");
    String userId = (orderId != null) ? orderId.toString() : null; %>

<script>
    function checkAndRedirect() {
        var allowedId = "1"; // 设置允许跳转的特定ID
        var userId = '<%= userId %>';
        if (userId === allowedId) {
            location.href = 'Administrators.jsp'; // 如果输入的ID符合要求，则跳转到 Administrator.jsp
        } else {
            alert("对不起，您没有权限访问管理员页面。"); // 如果输入的ID不符合要求，则弹出提示
        }
    }
</script>
</body>
</html>
