<%@page import="com.example.model.Reviews"%>
<%@page import="com.example.model.Bookings"%>
<%@page import="com.example.model.Workers"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<title>View Bookings</title>
<jsp:include page="../header.jsp"></jsp:include>
<jsp:include page="title.jsp"></jsp:include>

<link rel="stylesheet" type="text/css" href="../Css/userHome.css">
 <script>
        function confirm_delete(bookigId) {
            let ans = confirm("Want to this cancel this booking?");
            if (ans) {
                window.location = "/DoorToDoorServices/UpdateUserOrderStatus?bookingId=" +bookigId +"&Status=cancelled";
            }
        }
        
        function redirectToRating(workerId) {
            let ans = confirm("Do you want to rate this service?");
            if (ans) {
                window.location = "/DoorToDoorServices/worker/review.jsp?workerId=" + workerId;
            }
        }

    </script>

</head>
<body>
<jsp:include page="usermenu.jsp"></jsp:include>

<%
    Bookings bookings = new Bookings();
    int userId=(int)session.getAttribute("userId");
    List<Bookings> bookingsList = bookings.getAllBookingsByUserId(userId);

    System.out.println("bookingsList size = " + bookingsList.size());
%>

 <%
		String res = request.getParameter("res");
		if(res!=null){
			if(res.equals("1")){
	%>
		<div class="alert alert-success alert-dismissible" id='success_id'>
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Success!</strong> Status Updated.
		</div>
		<%
			}else if(res.equals("0")){
				%>
				<div class="alert alert-danger alert-dismissible" id='success_id'>
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Failed!</strong> Status not Updated.
		</div>
		<%
			}
		}
		%>

<h2 class="text-center"><u>View User Bookings</u></h2><br/>
<div class="table-responsive">
    <table class="table table-striped table-warning table-hover" id="table_id">
        <thead class="table-dark">
             <tr class="text-center">
                    <th>Slno</th>
                    <th>Booking Id</th>
                    <th>Booking Date</th>
                    <th>Worker Pic</th>
                    <th>workerId</th>
                    <th>ServiceName</th>
                    <th>Status</th>
                    
                    <th>Operation</th>
                    <th>Operation</th>
                    
                </tr>
            </thead>
            <tbody>
                <%
                int slno = 0;
                Workers workers = new Workers();
                for (Bookings bookingOb : bookingsList ) {
                
                    slno++;
                %>
                <tr>
                    
                    <td class="text-center"><%=slno%></td>
                    <td class="text-center"><%=bookingOb.getBookigId()%></td>
                    <td class="text-center"><%=bookingOb.getBookingDate()%></td>
                     <% 
    int workerId = bookingOb.getWorkerId();
    
    // Set the worker ID for the workers object and retrieve worker details
    workers.setWorkerId(workerId);
    workers = workers.getWorkerById(workerId);
%>

					<td><img src='../uploads/<%=workers.getWorkerPic()%>'
                         class='img-centered mx-auto d-block' 
                         style='width: 100px; height: 100px; object-fit: contain;'></td>
                    <td class="text-center"><%=bookingOb.getWorkerId()%></td>
                   
                    <td class="text-center"><%=bookingOb.getServiceName()%></td>
                    <td class="text-center"><%=bookingOb.getStatus()%></td>
                     <td>
                        <%
                            if (bookingOb.getStatus().equalsIgnoreCase("active")) {
                        %>
                        
                    <input type="button" class="btn btn-sm btn-warning" name="cancel" value="Cancel" onclick="confirm_delete(<%=bookingOb.getBookigId()%>)" />
                   
    				
    				   
                        <%
                            }
                        %>
                    
                    <td><input type="button" class="btn btn-sm btn-success" value="Rating" onclick="redirectToRating('<%=bookingOb.getWorkerId()%>')"></td>
                   
    				
    				 
                    <%
						Reviews rating=new Reviews();
						boolean found=rating.isReviewGiven(userId, bookingOb.getWorkerId());
						if(found==false){
					%>

                        
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
 <script>
        $(document).ready(function() {
            $('#table_id').DataTable();
            $('#success_id').slideUp(3000);
        });
    </script>

</body>
</html>