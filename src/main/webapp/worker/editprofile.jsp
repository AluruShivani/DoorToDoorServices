<%@page import="dbutil.Cryptography"%>
<%@page import="com.example.model.Workers"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../header.jsp"/>
<jsp:include page="title.jsp"/>
<jsp:include page="workermenu.jsp"/>
</head>
<body>
<%
String workerId = request.getParameter("workerId");
Workers worker = new Workers();
worker.setWorkerId(Integer.parseInt(workerId));

// Call getWorkerById() with the workerId parameter
worker = worker.getWorkerById(worker.getWorkerId());
%>

<body class="bg-light">


	<div class="container mt-4">
		<div class="card">
			<form class="card-body"
				action="/DoorToDoorServices/EditProfile" method="post">

				<h2 class="mb-4 text-center">Profile</h2>
				
				<input type="hidden" id="workerId" name="workerId" value="<%=worker.getWorkerId()%>">


				<div class="form-group">
					<label for="fullName">full Name:</label> <input type="text"
						class="form-control" id="fullName" name="fullName"
						value="<%=worker.getFullName()%>" required>
				</div>

				<div class="form-group">
					<label for="serviceName">Service Name:</label> <input type="text"
						class="form-control" id="serviceName" name="serviceName"
						value="<%=worker.getServiceName()%>" readonly required>
				</div>
				
				<div class="form-group">
					<label for="mobile">Mobile:</label> <input type="text"
						class="form-control" id="mobile" name="mobile"
						value="<%=Cryptography.decode(worker.getMobile())%>" required>
				</div>
				
				<div class="form-group">
					<label for="currentAddress">Current Address:</label> <input type="text"
						class="form-control" id="currentAddress" name="currentAddress"
						value="<%=worker.getCurrentAddress()%>" required>
				</div>
				
				<div class="form-group">
					<label for="cities">Cites:</label> <input type="text"
						class="form-control" id="cities" name="cities"
						value="<%=worker.getCities()%>" required>
				</div>
				
				<div class="form-group">
					<label for="password">Passowrd:</label> <input type="text"
						class="form-control" id="password" name="password"
						value="<%=Cryptography.decode(worker.getPassword())%>" required>
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