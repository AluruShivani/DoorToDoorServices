<%@page import="java.util.List"%>
<%@page import="com.example.model.Reviews"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<title>Worker reviews</title>
<jsp:include page="../header.jsp"></jsp:include>
    <jsp:include page="title.jsp"></jsp:include>
<jsp:include page="workermenu.jsp"></jsp:include> 
</head>
<body>

<div class="container-fluid">

<%
Reviews review = new Reviews();
int workerId = (int) session.getAttribute("workerId");
List<Reviews> reviews = review. getReviewsByWorkerId(workerId);
System.out.println("reviews size = " + reviews.size());
%>

<h2 class="text-center text-danger">
    <u>Reviews</u>
</h2>
<div class="table-responsive">
    <table class="table table-bordered table-secondary table-hover" id="table_id">

        <thead class="table-dark">
            <tr class="text-center">
                <th>SINo</th>
                <th>ReviewId</th>
                <th>WorkerId</th>
                <th>UserId</th>
                <th>ServiceName</th>
                <th>Comments</th>
                <th>Rating</th>
                <th>Date</th>
            </tr>
        </thead>
        
        <tbody class="table table-primary">
         <% 
            int slno=0;
            for (Reviews reviewOb : reviews) {
                slno++;
        %>
         
            <tr>
                <td><%=slno%></td>
                <td><%=reviewOb.getReviewId()%></td>
                <td><%=reviewOb.getWorkerId()%></td>
                <td><%=reviewOb.getUserId()%></td>
                <td><%=reviewOb.getServiceName()%></td>
                <td><%=reviewOb.getComments()%></td>
                <td><%=reviewOb.getRating()%></td>
                <td><%=reviewOb.getReviewDate()%></td>
            </tr>
        <% } %>
        </tbody>
    </table>
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