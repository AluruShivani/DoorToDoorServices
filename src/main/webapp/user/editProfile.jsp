<%@page import="dbutil.Cryptography"%>
<%@page import="com.example.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../header.jsp"/>
<jsp:include page="title.jsp"/>
<jsp:include page="usermenu.jsp"></jsp:include>
</head>
<body>
<%
String userId = request.getParameter("userId");
User user = new User();
user.setUserId(Integer.parseInt(userId));

user = user.getUserById();
%>

<body class="bg-light">


	<div class="container mt-4">
		<div class="card">
			<form class="card-body"
				action="/DoorToDoorServices/EditProfileServlet" method="post">

				<h2 class="mb-4 text-center"> User Profile</h2>
				
				<input type="hidden" id="userId" name="userId" value="<%=user.getUserId()%>">


				<div class="form-group">
					<label for="fullName">full Name:</label> <input type="text"
						class="form-control" id="fullName" name="fullName"
						value="<%=user.getFullName()%>" required>
				</div>

			
				
				<div class="form-group">
					<label for="mobile">Mobile:</label> <input type="text"
						class="form-control" id="mobile" name="mobile"
						value="<%=Cryptography.decode(user.getMobile())%>" required>
				</div>
				
				<div class="form-group">
					<label for="password">Passowrd:</label> <input type="text"
						class="form-control" id="password" name="password"
						value="<%=Cryptography.decode(user.getPassword())%>" required>
				</div>
				
				
				<div class="text-center">
					<button type="submit" class="btn btn-success">Update
						Profile</button>
				</div>
			</form>
		</div>
	</div>
	<%
	String res = request.getParameter("res");
	if (res != null) {
		if (res.equals("0")) {
			out.println("<h4 style='color:red'>Profile not updated</h4>");
		} else {
			out.println("<h4 style='color:green'>Profile  updated</h4>");
		}
	}
	%>



</body>
</html>