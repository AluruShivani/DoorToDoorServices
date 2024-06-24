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
<div class="modal fade" id="WorkerLoginModal" tabindex="-1"
		aria-labelledby="workerloginModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title text-success text-center fs-4"
						id="workerLoginModalLabel">
						<u>Worker Login&#128119;</u>
					</h5>
					<!-- redirecting to the prevoius page when the close button is clicked -->
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close" onclick="redirectToPreviousPage()"></button>
				</div>

				<div class="modal-body">
					<form action="/DoorToDoorServices/WokerLoginValidation"
						method="post" class="p-4 shadow bg-white rounded"
						style="max-width: 500px;">
						<div class="mb-3">
							<label for="Mobile" class="form-label fw-bold">Mobile:</label>
							<input type="text" class="form-control" id="Mobile"
								name="mobile" placeholder="Enter Your registered MobileNumber" required>
						</div>
						<div class="mb-3">
							<label for="Password" class="form-label fw-bold">Password:</label>
							<input type="password" class="form-control" id="Password"
								name="password" placeholder="Enter Password" required>
						</div>
						
						<div class="mb-4 mt-4 d-flex justify-content-center">
							<button type="submit" class="btn btn-success w-70">LOGIN</button>
						</div>
						<a href="/DoorToDoorServices/worker/newregistration.jsp">New Registration??</a>
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
			$('#WorkerLoginModal').modal('show');
		});
	</script>

</body>
</html>