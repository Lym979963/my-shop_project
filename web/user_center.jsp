<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
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
		.register-but button {
			width: 100%;
			padding: 10px;
			margin: 5px 0;
			display: inline-block;
			border: 1px solid #ccc;
			border-radius: 4px;
			box-sizing: border-box;
			background-color: #3052e1;
			color: white;
			border: none;
			cursor: pointer;
		}

	</style>
</head>
<body>


	<!--account-->
	<div class="account">
		<div class="container">
			<div class="register">
				<c:if test="${!empty msg }">
					<div class="alert alert-success">${msg }</div>
				</c:if>
				<c:if test="${!empty failMsg }">
					<div class="alert alert-danger">${failMsg }</div>
				</c:if>
				
					<div class="register-top-grid">
						<h3>个人中心</h3>
						<form action="/user_changeaddress" method="post">
						<!-- 收货信息 start -->
						<h4>收货信息</h4>
						<div class="input">
							<span>收货人<label></label></span>
							<input type="text" name="name" value="${user.name }" placeholder="请输入收货"> 
						</div>
						<div class="input">
							<span>收货电话</span>
							<input type="text" name="phone" value="${user.phone }" placeholder="请输入收货电话"> 
						</div>
						<div class="input">
							<span>收货地址</span>
							<input type="text" name="address" value="${user.address }" placeholder="请输入收货地址"> 
						</div>
						<div class="register-but text-center">
						   <input type="submit" value="确认">

						</div>
						</form>
					</div>

				
				<div class="clearfix"> </div>
			</div>
	    </div>
	</div>
	<!--//account-->



	
</body>
</html>