<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2023/11/27
  Time: 21:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
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
        input[type="username"],
        input[type="password"],
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #3052e1;
            color: white;
            border: none;
            cursor: pointer;
        }

    </style>
</head>
<body>
<form action="/login" method="post">
    <h2>用户登录</h2>
    <input type="username" id="username" name="username" placeholder="请输入用户名或邮箱" required>
    <input type="password" id="password" name="password" placeholder="请输入密码" required>
    <input type="submit" value="Login">
</form>
</body>
</html>

