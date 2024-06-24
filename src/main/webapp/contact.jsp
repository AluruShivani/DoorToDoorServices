<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="header.jsp"/>
    <jsp:include page="title.jsp"/>
</head>
<body>
<jsp:include page="navbar.jsp"/>

<div class="container mt-5">
		
			<h1 class="h3 mb-3 text-center text-decoration-underline">Any Queries We Are Here For You&#128515;</h1>

			<div class="mb-3">
				<label for="email" class="form-label fw-bold">Email</label> <input
					type="email" class="form-control" id="email" name="emailId" placeholder="enter registerd email id"
					required>
			</div>

			<div class="mb-3">
				<label for="mobile" class="form-label fw-bold">Mobile</label> <input
					type="text" class="form-control" id="mobile" name="mobile" placeholder="enter mobile number"
					required>
			</div>
			
			<div class="mb-3">
    			<label for="query" class="form-label fw-bold">Query</label>
    				<textarea class="form-control" id="query" name="query" rows="4" placeholder="Type your query"  required></textarea>
			</div>

			
			<div class="mb-4 mt-4 d-flex justify-content-center">
				<button type="submit" class="btn btn-dark w-70">SUBMIT</a>
				</button>
			</div>
			
	</div>
<h5 class="text-dark text-center ">Customer Care:9121830541;Our Main Branch:Chennai:-SHIVANI COMPLEX,1st floor</h5><br/>
<h4 class="text-success text-center">THANK YOU..!&#128525;</h4>
</body>
</html>