<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../header.jsp"></jsp:include>
<jsp:include page="title.jsp"></jsp:include>

</head>
<body>
<jsp:include page="usermenu.jsp"></jsp:include>

<!-- "Edit Image" form below the navbar -->
<form action="/DoorToDoorServices/UploadUserProfilePicServlet"
		method="post" enctype="multipart/form-data">

		<div class="container mt-3 card " >
			<h1 class=" text-center"><u>Edit Image</u></h1>

			<input type='hidden' name='tableName' value='<%=request.getParameter("tableName")%>'> 
			<input type='hidden' name='setColName' value='<%=request.getParameter("setColName")%>'>
			 <input type='hidden' name='whereColName' value='<%=request.getParameter("whereColName")%>'>
			 <input type='hidden' name='conditionValue' value='<%=request.getParameter("conditionValue")%>'>


			<div class="row">
				<div class="col-sm-6">
					<label>Upload Image</label> <input type="file" class="form-control" name="workerPic">

				</div>
			</div>


			<div class="row mt-3">
				<div class="col-sm-12 text-center">
					<%-- <input type="submit" name="submit"  class="form-control btn btn-md btn-outline-danger p-3"  style="width:150px" value="Add Product"> --%>
					<input type="submit" name="submit"
						class="form-control btn btn-md btn-info" style="width: 150px"
						value="Submit">
				</div>
			</div>


		</div>
	</form>

</body>
</html>
