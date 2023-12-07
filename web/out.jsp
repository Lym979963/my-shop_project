<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2023/12/3
  Time: 14:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>注销</title>
    <style>
        button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<h2>点击按钮进行注销</h2>
<button id="logoutButton">注销</button>

<script>
    // 当注销按钮被点击时触发的函数
    function logout() {
        // 在这里执行注销操作，例如清除会话信息或重定向到登录页面

        // 请根据您的具体需求进行实现

        // 示例：清除本地存储的会话信息
        localStorage.removeItem('sessionToken');

        // 示例：重定向到登录页面
        window.location.href = 'login.jsp';
    }

    // 注销按钮的点击事件监听器
    document.getElementById('logoutButton').addEventListener('click', logout);
</script>
</body>
</html>
