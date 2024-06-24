<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout</title>

</head>
<body>
	
	<header class="bg-dark p-3">
		<div>
			<i class="fa fa-shopping-cart" href="#home" style="font-size: 48px;"></i>
		</div>
		
	</header>
	<%
	session.invalidate();
	%>

	<center>
		<h1 style="color: green;">You have been successfully logged out</h1>

		<button type="button" class="btn btn-outline-danger float-left"
			onclick="window.location.href='../index.jsp'">Back to Index
			page</button>
	</center>
</body>
</html>