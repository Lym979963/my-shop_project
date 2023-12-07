<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>购物车页面</title>
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
            background-color: #757de2;
        }

        h1 {
            color: #333;
            text-align: center;
        }

        ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        li {
            background-color: #fff;
            border: 1px solid #ccc;
            padding: 10px;
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
<h1>购物车</h1>
<ul id="cart-list"></ul>
<button onclick="pay()">支付</button>
<button onclick="goBack()">返回</button>
<script>
    function pay() {
        var cart = getCartFromCookie();
        // 获取购物车数据
        $.ajax({
            url: "/payOrder", // 替换为你的servlet的URL
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify({ cart: cart }),
            success: function(response) {
                // 处理成功响应
                document.cookie = "cart=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
                alert('支付成功！');
                // 其他支付成功的操作
            },
            error: function() {
                // 处理错误响应
                alert('支付失败，请重试！');
                // 其他支付失败的操作
            }
        });
    }

    function displayCart() {
        var cartList = document.getElementById("cart-list");
        var cartJson = getCookie("cart");

        if (cartJson) {
            var cart = JSON.parse(cartJson);

            // 清空原有内容
            cartList.innerHTML = "";

            // 遍历购物车数据并添加到页面中
            for (var i = 0; i < cart.length; i++) {
                var item = cart[i];
                var listItem = document.createElement("li");
                listItem.textContent = item.productName + " - ￥" + item.price + " - Quantity: " + item.quantity;

                // 创建删除按钮
                var deleteButton = document.createElement("button");
                deleteButton.textContent = "删除";
                deleteButton.onclick = (function(index) {
                    return function() {
                        deleteCartItem(index);
                    };
                })(i);

                // 将删除按钮添加到列表项中
                listItem.appendChild(deleteButton);

                cartList.appendChild(listItem);
            }
        }
    }

    function deleteCartItem(index) {

        var cartJson = getCookie("cart");

        if (cartJson) {
            var cart = JSON.parse(cartJson);

            // 从购物车数组中删除指定索引的商品记录
            cart.splice(index, 1);


            // 更新cookie中的购物车数据
            document.cookie = "cart=" + JSON.stringify(cart) + "; path=/;";

            // 重新显示购物车数据
            displayCart();
        }
    }

    // 从 cookie 中获取指定名称的值
    function getCookie(name) {
        var cookies = document.cookie.split(';');

        for (var i = 0; i < cookies.length; i++) {
            var cookie = cookies[i].trim();
            if (cookie.indexOf(name + '=') === 0) {
                return cookie.substring(name.length + 1);
            }
        }

        return null;
    }
    function getCartFromCookie() {
        var cart = [];
        var cartStr = getCookie("cart");
        if (cartStr) {
            cart = JSON.parse(cartStr);
        }
        return cart;
    }
    // 在页面加载完成后调用 displayCart 函数来显示购物车数据
    window.onload = function() {
        displayCart();
    };


    function goBack() {
        history.back();
    }
</script>
</body>
</html>
