<%@page import="dbutil.Cryptography"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../header.jsp"/>
<jsp:include page="title.jsp"/>
</head>
<body>
<jsp:include page="adminmenu.jsp"/>
<%
	 //System.out.println("EmployeeId: " + request.getParameter("EmployeeId"));
    User user= new User();
    List<User> userList = user.getAllUsers();
    System.out.println("userList=" + userList.size());
    %>

<div class="container mt-2">
	<%
		String res= request.getParameter("res");
		if(res!=null){
				if(res.equals("1")){
			%>

		<div class="alert alert-success alert-dismissible fade show">
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Success!</strong>Success Updated.
		</div>
		<%
				}else if(res.equals("0")){
					%>
		<div class="alert alert-success alert-dismissible fade show">
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Yup!</strong> Success not updated.
		</div>
		<%
				}
		}
		%>

	
		<div class=" mx-auto border-success" style="max-width: 1300px;">

			<h3 class=" text-center mb-4"><u>VIEW CUMSTOMERS</u></h3>
			
			<div class="table-responsive">
			<table class="table table-striped table-dark table-hover" id="table_id">
				<thead class="table-success">
					<tr>
						
						<th>Slno</th>
						<th>User ID</th>
						<th>Full Name</th>
						<th>Mobile</th>
						<th>ProfilePic</th>
						
					</tr>
				</thead>
				<tbody>
					<%
                        int slno = 0;
                        for (User userOb : userList) {
                            slno++;
                        %>
                        
                        <tr>
                        	
						<td><%=slno%></td>
						<td><%=userOb.getUserId()%></td>
						<td><%=userOb.getFullName()%></td>
						<td><%= Cryptography.decode(userOb.getMobile()) %></td>
						<td><a href='editservicepic.jsp?tableName=users&setColName=profilePic&whereColName=userId&conditionValue=<%=userOb.getUserId() %>&colName=profilePic'><img src='<%=request.getContextPath()%>/uploads/<%=userOb.getProfilePic()%>' style='width: 100px; height: 100px' /> </a></td>
						
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
	</div>
	</div>

	<script>
		$(document).ready(function() {
			$('#table_id').DataTable();
			
			$('#success_id').slideUp(3000);
		});
	</script>
 

</body>
</html>