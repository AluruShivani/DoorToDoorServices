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

<form class="card-body " action="/DoorToDoorServices/AddService"
        method="post" enctype="multipart/form-data">

        <div class="container card mt-4 border-trasparent" style="border-width: 4px;">
            <h3 class=" mt-3 mb-3 text-center">
        <span class=" text-success font-italic" style><i><u>ADD SERVICES</u></i></span>
    </h3>

            <div class="row">
                <div class="col-md-6 fw-bold">
                    <label for="servicename">Service Name:</label>
                    <input type="text" class="form-control" id="servicename" name="serviceName" required>
                </div>
                
                
                <div class="col-md-6 fw-bold">
                    <label>Service Pic:</label>
                   <input type="file" class="form-control" name="servicePic">
                </div>
            </div><br/>

            

            <div class="text-center mt-2 mb-2">
                <button type="submit" class="btn btn-success">Add Service</button>
            </div>

            <%-- Display result message --%>
            <%
            String res = request.getParameter("res");
            if (res != null) {
                if (res.equals("1")) {
                    out.println("<h4 style='color:green'>Service  added</h4>");
                } else {
                    out.println("<h4 style='color:red'>Service not added</h4>");
                }
            }
            %>
        </div>
    </form>

</body>
</html>
