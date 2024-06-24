<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<jsp:include page="header.jsp" />
<jsp:include page="title.jsp" />

</head>
<body>
	<div class="modal fade" id="adminLoginModal" tabindex="-1"
		aria-labelledby="adminLoginModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title text-success text-center fs-4"
						id="adminLoginModalLabel">
						<u>Admin Login&#128378;</u>
					</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close" onclick="redirectToPreviousPage()"></button>
				</div>

				<div class="modal-body">
					<form action="/DoorToDoorServices/AdminLoginValidation"
						method="post" class="p-4 shadow bg-white rounded"
						style="max-width: 500px;">
						<div class="mb-3">
							<label for="Username" class="form-label fw-bold">Username:</label>
							<input type="text" class="form-control" id="Username"
								name="username" required>
						</div>
						<div class="mb-3">
							<label for="Password" class="form-label fw-bold">Password:</label>
							<input type="password" class="form-control" id="Password"
								name="password" required>
						</div>
						
						<div class="mb-4 mt-4 d-flex justify-content-center">
							<button type="submit" class="btn btn-success w-70">LOGIN</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- JavaScript to redirect back when modal is dismissed -->
	<script>
		function redirectToPreviousPage() {
			window.history.back();
		}
	</script>


	<script>
		$(document).ready(function() {
			$('#adminLoginModal').modal('show');
		});
	</script>


</body>
</html>
