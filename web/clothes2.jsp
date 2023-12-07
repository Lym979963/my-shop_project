<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>商品详情</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      background-image: url('image/he.jpg');
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
    }
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      margin: 0;
      padding: 0;
    }
    .container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 20px;
    }
    .product-info {
      display: flex;
      align-items: center;
      border: 1px solid #ddd;
      border-radius: 5px;
      background-color: #fff;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      margin-bottom: 20px;
    }
    .product-image {
      flex: 1;
      padding: 20px;
    }
    .product-image img {
      max-width: 100%;
      height: auto;
      border-radius: 5px;
    }
    .product-details {
      flex: 2;
      padding: 20px;
    }
    .product-details h2 {
      margin-top: 0;
    }
    .product-details p {
      margin-bottom: 10px;
    }
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
<%
  String id = request.getParameter("id");
  String name = request.getParameter("name");
  String description = request.getParameter("description");
  String price = request.getParameter("price");
  String dec = request.getParameter("dec");

  pageContext.setAttribute("id", id);
  pageContext.setAttribute("name", name);
  pageContext.setAttribute("description", description);
  pageContext.setAttribute("price", price);
  pageContext.setAttribute("dec", dec);
%>

<div class="container">
  <div class="product-info">
    <div class="product-image">
      <img src="${dec}" alt="商品图片">
    </div>
    <div class="product-details">
      <h2>${name}</h2>
      <p>${description}</p>
      <p>价格: ${price}</p>
      <input type="number" id="quantityInput" min="1" value="1">
      <button onclick="addToCart(${id},'${name}',${price})">加入购物车</button>
      <button onclick="goBack()">返回</button>
    </div>
  </div>
  <!-- 其他商品信息展示 -->
</div>

<script>
  function addToCart(productId, productName, price) {
    var quantity = document.getElementById("quantityInput").value;
    var cart = getCartFromCookie();
    var item = {
      productId: productId,
      productName: productName,
      price: price,
      quantity: quantity
    };
    cart.push(item);
    setCartToCookie(cart);
  }
  function setCookie(name, value, days) {
    var expires = "";
    if (days) {

      date.setTime(date.getTime() + (60 * 1000));
      expires = "; expires=" + date.toUTCString();
    }
    document.cookie = name + "=" + value + expires + "; path=/";
  }

  function getCartFromCookie() {
    var cart = [];
    var cartStr = getCookie("cart");
    if (cartStr) {
      cart = JSON.parse(cartStr);
    }
    return cart;
  }
  function setCartToCookie(cart) {
    var cartStr = JSON.stringify(cart);
    setCookie("cart", cartStr);
  }
  function getCookie(name) {
    var cookieName = name + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var cookieArray = decodedCookie.split(';');
    for (var i = 0; i < cookieArray.length; i++) {
      var cookie = cookieArray[i];
      while (cookie.charAt(0) == ' ') {
        cookie = cookie.substring(1);
      }
      if (cookie.indexOf(cookieName) == 0) {
        return cookie.substring(cookieName.length, cookie.length);
      }
    }
    return "";
  }

  function goBack() {
    history.back();
  }
</script>
</body>
</html>
