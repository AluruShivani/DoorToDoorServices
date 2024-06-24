<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../header.jsp"/>
<jsp:include page="title.jsp"/>
<jsp:include page="adminmenu.jsp"/>
</head>
<body>
<form action="/DoorToDoorServices/UploadWorkerPicServlet"
		method="post" enctype="multipart/form-data">

		<div class="container mt-3 card " >
			<h1 class=" text-center"><u>Edit Image</u></h1>

			<input type='hidden' name='tableName' value='<%=request.getParameter("tableName")%>'> 
			<input type='hidden' name='setColName' value='<%=request.getParameter("setColName")%>'>
			 <input type='hidden' name='whereColName' value='<%=request.getParameter("whereColName")%>'>
			 <input type='hidden' name='conditionValue' value='<%=request.getParameter("conditionValue")%>'>

			<div class="row">
                <div class="col-md-6">
                    <label><strong>Image</strong></label>
                    <input type="file" class="form-control" name="workerPic">
                </div>
             </div>

				
			 <div class="text-center mt-2">
                <button type="submit" class="btn btn-success">Update Image</button>
            </div>

			<%
            String res = request.getParameter("res");
            if (res != null) {
                if (res.equals("0")) {
                    out.println("<h4 style='color:red'>Image not updated</h4>");
                } else {
                    out.println("<h4 style='color:green'>Image updated</h4>");
                }
            }
            %>


		</div>
	</form>


</body>
</html>