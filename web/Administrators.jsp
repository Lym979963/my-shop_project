<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2023/11/29
  Time: 15:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>带导航栏的网页</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background-image: url('image/he.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }

        .main {
            display: flex;
            justify-content: center;
            align-items: center;
            height: calc(100vh - 50px); /* 减去导航栏的高度 */
        }

        .content {
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0,0.1);
            background-color: white;
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
        .info-box {
            background-color: #f5f5f5;
            border: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 20px;
        }

        .info-box p {
            margin: 0;
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
<div class="info-box">
    <p>管理员说明</p>
    <p>您可以通过页面上方的导航栏进行相应的操作，可以对文具库，玩具库和衣服库进行增删改的操作。</p>
    <p>注意：在进行增加操作时要先上传图片再进行其他内容的增加，为避免出错，尽量少进行刷新操作避免出现不必要的错误。</p>
</div>

</body>
</html>
