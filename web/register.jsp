<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2023/11/26
  Time: 18:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>注册页面</title>
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
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        form {
            width: 450px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0,0.1);
            background-color: white;
        }
        input[type="text"],
        input[type="password"]
        {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            box-sizing: border-box;
        }
        input[type="submit"] {
            width: 100%;
            background-color: #3053e3;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<form action="/register" method="post">
    <h3 style="font-size: 24px;">新用户注册</h3>
    <div class="input">
        <span>用户名 <label style="color:red;">*</label></span>
        <input type="text" name="username" placeholder="请输入用户名" required="required">
    </div>
    <div class="input">
        <span>邮箱 <label style="color:red;">*</label></span>
        <input type="text" name="email" placeholder="请输入邮箱" required="required">
    </div>
    <div class="input">
        <span>密码 <label style="color:red;">*</label></span>
        <input type="password" name="password" placeholder="请输入密码" required="required">
    </div>
    <div class="input">
        <span>收货人<label></label></span>
        <input type="text" name="name" placeholder="请输入收货人">
    </div>
    <div class="input">
        <span>收货电话<label></label></span>
        <input type="text" name="phone" placeholder="请输入收货电话">
    </div>
    <div class="input">
        <span>收货地址<label></label></span>
        <input type="text" name="address" placeholder="请输入收货地址">
    </div>
    <div>
        <input type="submit" value="注册">
    </div>
</form>
</body>
</html>
