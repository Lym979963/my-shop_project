<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
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
            margin: 0;
            display: grid;
            grid-template-areas:
        "left-top right-top"
        "left-bottom right-bottom";
            grid-template-columns: 1fr 1fr;
            grid-template-rows: 1fr 1fr;
            height: 100vh;
        }

        .button {
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 24px;
            cursor: pointer;
            background-repeat: no-repeat;
            margin: 30px; /* 设置外边距 */
            background-size: contain; /* 图片适应框内并保持比例 */

            background-position: center; /* 图片居中显示 */
        }

        .left-top {
            grid-area: left-top;
            background-image: url('/image/doll.jpg');
        }

        .right-top {
            grid-area: right-top;
            background-image: url('/image/OIP-C.jpg');
        }

        .left-bottom {
            grid-area: left-bottom;
            background-image: url('/image/wang.jpg');
        }

        .right-bottom {
            grid-area: right-bottom;
            background-image: url('/image/pay.png');
        }
    </style>
</head>
<body>
<div class="button left-top" onclick="goToPage('doll.jsp')">
    <div class="button-text">玩具</div>
</div>
<div class="button right-top" onclick="goToPage('clothes.jsp')">
    <div class="button-text">服装</div>
</div>
<div class="button left-bottom" onclick="goToPage('stationery.jsp')">
    <div class="button-text">文具</div>
</div>
<div class="button right-bottom" onclick="goToPage('pay.jsp')">
    <div class="button-text">支付</div>
</div>
<script>
    function goToPage(url) {
        window.location.href = url;
    }
</script>
</body>
</html>
