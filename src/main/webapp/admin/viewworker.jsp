<%@page import="dbutil.Cryptography"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.Workers"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../header.jsp"/>
<jsp:include page="title.jsp"/>

<script>
    function confirm_delete(workerId) {
        let ans = confirm("Want to delete this record?");
        if (ans) {
            window.location = "/DoorToDoorServices/DeleteWorker?workerId=" + workerId;
        }
    }
</script>
</head>
<body>
<jsp:include page="adminmenu.jsp"/>

<%
	 //System.out.println("EmployeeId: " + request.getParameter("EmployeeId"));
    Workers worker= new Workers();
    List<Workers> workerList = worker.getAllWorkers(null);
    System.out.println("workerList=" + workerList.size());
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
				}else if(res.equals("0")){
					%>
		<div class="alert alert-success alert-dismissible fade show">
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Yup!</strong> Success not updated.
		</div>
		<%
				}
		}
		%>
		
		<script>
		
		function status(workerId){
	    	let ans=confirm("Want to activate?");
	    	if(ans){
	    		window.location="/DoorToDoorServices/WorkerStatus?workerId=" + workerId +"&status=Active";
	    	}
	    }
        
        function status1(workerId){
    		let ans =confirm("Want to deactivate?");
    		if (ans) {
                window.location = "/DoorToDoorServices/WorkerStatus?workerId="+ workerId +"&status=Inactive";
            }
    	}
    </script>

	
		<div class=" mx-auto border-success" style="max-width: 1300px;">

			<h3 class=" text-center mb-4"><u>VIEW WORKERS</u></h3>
			
			<div class="table-responsive">
			<table class="table table-striped table-dark table-hover" id="table_id">
				<thead class="table-success">
					<tr>
						
						<th>Slno</th>
						<th>Worker ID</th>
						<th>Full Name</th>
						<th>Service Name</th>
						<th>Mobile</th>
						<th>Current Address</th>
						<th>Cities</th>
						<th>WorkerPic</th>
						<th>AadhaarPic</th>
						<th>Status</th>
						
					</tr>
				</thead>
				<tbody>
					<%
                        int slno = 0;
                        for (Workers workerOb : workerList) {
                            slno++;
                        %>
                        
                        <tr>
                        	
						<td><%=slno%></td>
						<td><%=workerOb.getWorkerId()%></td>
						<td><%=workerOb.getFullName()%></td>
						<td><%=workerOb.getServiceName()%></td>
						<td><%= Cryptography.decode(workerOb.getMobile()) %></td>
						<td><%=workerOb.getCurrentAddress()%></td>
						<td><%=workerOb.getCities()%></td>
						
						<td><a href='editworkerpic.jsp?tableName=workers&setColName=workerPic&whereColName=workerId&conditionValue=<%=workerOb.getWorkerId() %>&colName=workerPic'><img src='<%=request.getContextPath()%>/uploads/<%=workerOb.getWorkerPic()%>' style='width: 100px; height: 100px' /> </a></td>
						<td><a href='editworkerpic.jsp?tableName=workers&setColName=aadhaarPic&whereColName=workerId&conditionValue=<%=workerOb.getWorkerId() %>&colName=aadhaarPic'><img src='<%=request.getContextPath()%>/uploads/<%=workerOb.getAadhaarPic()%>' style='width: 100px; height: 100px' /> </a></td>
						
						
						<td>
								<% if(workerOb.getStatus().toString().equalsIgnoreCase("inactive")){%>
								<input type="button" class="btn btn-sm btn-outline-primary"
								value="Active" onclick="status(<%=workerOb.getWorkerId()%>)" />
						<%
							}
						%>
						
						<% if(workerOb.getStatus().toString().equalsIgnoreCase("active")){%>
								<input type="button" class="btn btn-sm btn-outline-primary"
								value="Inactive" onclick="status1(<%=workerOb.getWorkerId()%>)" />
						<%
						}
						%>
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
			
			$('#success_id').slideUp(3000);
		});
	</script>
 
</body>
</html>