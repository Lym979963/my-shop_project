<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2023/11/29
  Time: 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>change_password</title>
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
    input[type="text"],
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
<div class="container">
<form action="/user_changepwd" method="post">
  <h4>安全信息</h4>
  <div class="input">
    <span>原密码</span>
    <input type="text" name="password" placeholder="请输入原密码">
  </div>
  <div class="input">
    <span>新密码</span>
    <input type="text" name="newPassword" placeholder="请输入新密码">
  </div>
  <div class="clearfix"> </div>
  <div class="register-but text-center">
    <input type="submit" value="确认">
  </div>

</form>
</div>
</body>
</html>
