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

    </style>
</head>
<body>
<div class="navbar">
    <ul>
        <li><a href="doll.jsp">玩具区</a></li>
        <li><a href="stationery.jsp">文具区</a></li>
        <li><a href="clothes.jsp">衣物区</a></li>
        <li><a href="pay.jsp">支付</a></li>
        <li><a href="wait_to_shop.jsp">返回主界面</a></li>
    </ul>
</div>
<table>

    <c:forEach var="product" items="${products}" varStatus="status">
        <c:if test="${status.index % 5 == 0}">
            <tr>
        </c:if>

        <td>
            <div style="width: 200px; text-align: center;">
                <a href="clothes2.jsp?id=${product.id}&name=${product.name}&description=${product.description}&price=${product.price}&dec=${product.imageurl}">
                    <img src="${product.imageurl}" alt="商品图片" style="max-width: 150px; max-height: 150px;">
                    <p>${product.price}</p>
                </a>
            </div>
        </td>

        <c:if test="${(status.index + 1) % 5 == 0 || status.last}">
            </tr>
        </c:if>
    </c:forEach>
</table>


<div>
    <a href="stationery.jsp?page=${page - 1}">上一页</a>
    <span>${page}</span>
    <a href="stationery.jsp?page=${page + 1}">下一页</a>
</div>
<script>
    // 获取导航栏中的链接元素
    const links = document.querySelectorAll('.navbar a');

    // 为每个链接绑定点击事件
    links.forEach(link => {
        link.addEventListener('click', e => {
            e.preventDefault(); // 阻止默认跳转行为

            // 获取链接的 href 属性值，并跳转到对应页面
            const href = link.getAttribute('href');
            window.location.href = href;
        });
    });
</script>
</body>
</html>
