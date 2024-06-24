<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<jsp:include page="../header.jsp" />
<jsp:include page="title.jsp" />
<style>
#password-strength {
	margin-top: 10px;
	font-weight: bold;
}
</style>
</head>
<body>
	<div class="container mt-2">
		<form action="/DoorToDoorServices/NewUser" method="post"
			enctype="multipart/form-data" class="p-4 shadow bg-white rounded">
			<div class="card mx-auto border-danger" style="max-width: 1200px; max-height: 500;">
				<div class="card-body">
					<h2 class="card-title text-center mb-4">New User
						Registration</h2>

					<div class="mb-3">
						<label for="fullName" class="form-label fw-bold">Full
							Name:</label> <input type="text" class="form-control" id="fullName"
							name="fullName" placeholder="Enter your full name" required>
					</div>

					<div class="mb-3">
						<label for="registrationDate" class="form-label fw-bold">Registration
							Date: </label> <input type="date" class="form-control"
							id="registrationDate" name="registrationDate" required>
					</div>

				

					<div class="mb-3">
						<label for="mobile" class="form-label fw-bold">Mobile:</label> <input
							type="text" class="form-control" id="mobile" name="mobile"
							placeholder="Enter your mobile" required>
					</div>

					

					
					
					
					<div class="mb-3">
						<label for="profilePic" class="form-label fw-bold">Profile
							Picture:</label> <input type="file" class="form-control" id="profilePic"
							name="profilePic" >
					</div>

					<div class="mb-3">
						<label for="password">Password:</label> <input type="password"
							id="password" name="password" oninput="checkPasswordStrength(this.value)">
						<div id="password-strength" required></div>
					</div>

					<div class="mb-3">
						<label for="password">Confirm-Password:</label> <input
							type="password" id="cpassword"
							oninput="validatePasswords(this.value)">
						<div id="cpwdLabel" required></div>
					</div>

					

					<script>
						function checkPasswordStrength(password) {
							// Define your password strength criteria and calculations here
							// This is a simple example, you can modify it based on your requirements

							var strength = 0;

							// Check the length of the password
							if (password.length >= 8) {
								strength += 1;
							}

							// Check if the password contains both uppercase and lowercase characters
							if (/[a-z]/.test(password)
									&& /[A-Z]/.test(password)) {
								strength += 1;
							}

							// Check if the password contains at least one number
							if (/\d/.test(password)) {
								strength += 1;
							}

							// Check if the password contains at least one special character
							if (/[$&+,:;=?@#|'<>.^*()%!-]/.test(password)) {
								strength += 1;
							}

							var strengthText = "";
							switch (strength) {
							case 0:
							case 1:
								strengthText = "Weak";
								break;
							case 2:
								strengthText = "Moderate";
								break;
							case 3:
							case 4:
								strengthText = "Strong";
								break;
							}

							document.getElementById("password-strength").innerHTML = "Password Strength: "
									+ strengthText;
							if (strengthText == "Weak") {
								document.getElementById("password-strength").style.color = 'red';
							} else if (strengthText == "Moderate") {
								document.getElementById("password-strength").style.color = 'blue';
							} else if (strengthText == "Strong") {
								document.getElementById("password-strength").style.color = 'green';
							}
						}
						function validatePasswords(cpassword) {
							var cpwd = document.getElementById("password").value;
							if (cpassword == cpwd) {
								document.getElementById("cpwdLabel").innerHTML = "Passwords match";
								document.getElementById("cpwdLabel").style.color = "green";
							} else {
								document.getElementById("cpwdLabel").innerHTML = "Passwords not match";
								document.getElementById("cpwdLabel").style.color = "red";
							}

						}
					</script>

					<div class="text-center">
						<button type="submit" class="btn btn-sucess">Register</button>
					</div>	

				</div>
			</div>
		</form>
	</div>
	
</body>
</html>