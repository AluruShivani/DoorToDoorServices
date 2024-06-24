
<%@page import="com.example.model.Reviews"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="../header.jsp" />
<jsp:include page="title.jsp" />
<script>
function confirm_delete(ratingId) { 
let ans = confirm("Want to delete this?"); 
if (ans) { 
window.location ="/DoorToDoorServices/DeleteReview?reviewId=" + reviewId; 
}
}
</script>
</head>
<body>
	<jsp:include page="/user/usermenu.jsp" />
	<%
	Reviews reviwes = new Reviews();
	List<Reviews> reviewList = reviwes.getAllReviews();
	%>

	<div class="container mt-2">
		<div class=" mx-auto border-success" style="max-width: 1000px;">

			<h2 class=" text-center mb-4">
				<u>View Reviews</u>
			</h2>

			<table
				class="table table-striped table-success table-hover table-responsive"
				id="table_id">
				<thead class="table-dark">
					<tr>
						<th>Slno</th>
						<th>ReviewId</th>
						<th>UserId</th>
						<th>WorkerId</th>
						<!--  <th>Date</th> -->
						<th>ServiceName</th>
						<th>Ratings</th>
						<th>Comments</th>
						<th>Opeation</th>
					</tr>
				</thead>
				<tbody>
					<%
					int slno = 0;
					for (Reviews reviewOb : reviewList) {
						slno++;
					%>
					<tr>
						<td><%=slno%></td>
						<td><%=reviewOb.getReviewId()%></td>
						<td><%=reviewOb.getUserId()%></td>
						<td><%=reviewOb.getWorkerId()%></td>
						<td><%=reviewOb.getServiceName()%></td>
						<td><%=reviewOb.getRating()%></td>
						<td><%=reviewOb.getComments()%></td>

						<td>
							<input type="button" class="btn btn-sm btn-outline-danger" name="cancel" value="Delete" onclick="confirm_delete(<%=reviewOb.getReviewId()%>)" />
							<a
							href="/DoorToDoorServices/user/editreview.jsp?reviewId=<%=reviewOb.getReviewId()%>"
							class="btn btn-sm btn-outline-success">Edit</a>

						</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
	</div>
	</div>

	<!-- <div class="footer mt-5 bg-dark text-white text-center fixed-bottom">
        <div class="container">
            <p>&lt;&lt; &lt;&copy; 2023 EMMADI Group of Companies. All rights reserved &gt;&gt;&gt;</p>
            <p>
                <a href="index.jsp">Back to Home</a>
            </p>
        </div>
    </div> -->

	<script>
		$(document).ready(function() {
			$('#table_id').DataTable();
			
			$('#success_id').slideUp(3000);
		});
	</script>
</body>
</html>