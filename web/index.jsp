<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
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
  </ul>
</div>

<div class="main">
  <div class="content">
    <h1>欢迎访问我们的网站</h1>
    <p>这是一个带有导航栏的网页设计示例。</p>
  </div>
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
