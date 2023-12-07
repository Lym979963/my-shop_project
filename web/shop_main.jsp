<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2023/11/27
  Time: 21:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Online Store</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      background-image: url('image/background.jpg');
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
    }
    .container {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
    .form {
      background-color: rgba(255, 255, 255,0.3);
      padding: 20px;
      border-radius: 5px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
      text-align: center;
      margin-top: 500px;
    }
    h2 {
      margin-top: 0;
    }
    button {
      padding: 10px 20px;
      font-size: 16px;
      margin: 10px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      background-color: #3052e1;
      color: white;
    }
    button:hover {
      background-color: #3053e3;
    }
  </style>
</head>
<body>
<div class="container">
  <div class="form">
    <button onclick="location.href='login.jsp'">Login</button>
    <button onclick="location.href='register.jsp'">Register</button>
  </div>
</div>
</body>
</html>

