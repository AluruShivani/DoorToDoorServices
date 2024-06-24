

<%@page import="com.example.model.Services"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="../header.jsp" />
<jsp:include page="title.jsp"/>
</head>
<body>
<jsp:include page="adminmenu.jsp" />
<%
    String serviceId = request.getParameter("serviceId");
    Services service = new Services();
    service.setServiceId(Integer.parseInt(serviceId));
    service = Services.getServiceById(service.getServiceId());
%>


<div class="container card border-success border-3 mt-5" style="background-color: #BFFC8B; height: 400px; width: 900px;">
        
            <form class="card-body"  action="http://localhost:8091/DoorToDoorServices/EditService"
		method="post">
                <h2 class="mb-4 text-center">Edit Service</h2>
				<div class="row">
                    <div class="col-sm-6">
                       
                            <label for="serviceId" class="fw-bold">Service ID:</label>
                            <input type="text" class="form-control" id="serviceId" name="serviceId" value="<%=service.getServiceId()%>">
                        </div>
                    
                    
                    
                
                <div class="row">
                    <div class="col-sm-6">
                        
                            <label for="serviceName" class="fw-bold">Service Name:</label>
                            <input type="text" class="form-control" id="serviceName" name="serviceName" value="<%=service.getServiceName()%>">
                        </div>
                    
                    
                    
                <div class="text-center mt-4">
                    <button type="submit" class="btn btn-info">Update Service</button>
                </div>
            </form>
        </div>
    </div>
<%
	String res = request.getParameter("res");
	if (res != null) {
		if (res.equals("0")) {
			out.println("<h4 style='color:red'>Service not updated</h4>");
		} else {
			out.println("<h4 style='color:green'>Service  updated</h4>");
		}
	}
	%>

</body>
</html>