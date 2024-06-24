<%@page import="java.util.List"%>
<%@page import="com.example.model.Services"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../header.jsp"/>
<jsp:include page="title.jsp"/>
<script>
function confirm_delete(serviceId) { 
    let ans = confirm("Want to delete this?"); 
    if (ans) { 
        window.location = "/DoorToDoorServices/DeleteService?serviceId=" + serviceId; 
    } 
}

function edit_service(serviceId) {
    window.location = "/DoorToDoorServices/admin/editservice.jsp?serviceId=" + serviceId;
}
</script>
</head>
<body>
<jsp:include page="adminmenu.jsp"/>

<%
    Services service= new Services();
    List<Services> serviceList = service.getAllService();
%>
    
<div class="container mt-2">
<%
    String res= request.getParameter("res");
    if(res!=null){
        if(res.equals("1")){
    %>

    <div class="alert alert-success alert-dismissible fade show">
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        <strong>Success!</strong>Success Updated.
    </div>
    <%
            } else if(res.equals("0")){
                %>
    <div class="alert alert-success alert-dismissible fade show">
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        <strong>Yup!</strong> Success not updated.
    </div>
    <%
            }
    }
%>

<div class="mx-auto border-success" style="max-width: 1300px;">
    <h3 class="text-center mb-4"><u>VIEW SERVICES</u></h3>
    <div class="table-responsive">
        <table class="table table-striped table-dark table-hover" id="table_id">
            <thead class="table-success">
                <tr>
                    <th>Slno</th>
                    <th>Service ID</th>
                    <th>Service Name</th>
                    <th>Service Pic</th>
                    <th>Operation</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int slno = 0;
                    for (Services serviceOb : serviceList) {
                        slno++;
                %>
                <tr>
                    <td><%=slno%></td>
                    <td><%=serviceOb.getServiceId()%></td>
                    <td><%=serviceOb.getServiceName()%></td>
                   <td><a href='editservicepic.jsp?tableName=services&setColName=servicePic&whereColName=serviceId&conditionValue=<%=serviceOb.getServiceId() %>&colName=servicePic'><img src='<%=request.getContextPath()%>/uploads/<%=serviceOb.getServicePic()%>' style='width: 100px; height: 100px' /> </a></td>
                    <td>
                        <button class='btn btn-sm btn-outline-danger' onclick="confirm_delete(<%=serviceOb.getServiceId()%>)">Delete</button>
                        <button class='btn btn-sm btn-outline-success' onclick="edit_service(<%=serviceOb.getServiceId()%>)">Edit</button>
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

<script>
    $(document).ready(function() {
        $('#table_id').DataTable();
    });
</script>
 
</body>
</html>
