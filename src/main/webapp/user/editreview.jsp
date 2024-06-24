
<%@page import="com.example.model.Reviews"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="../header.jsp" />
<jsp:include page="title.jsp"/>
</head>
<body>
<jsp:include page="usermenu.jsp" />
<%
	String reviewId=request.getParameter("reviewId");
	Reviews review=new Reviews();
	review.setReviewId(Integer.parseInt(reviewId));
	review=Reviews.getReviewById(review.getReviewId());
%>

<div class="container card border-success border-3 mt-5" style="background-color: #BFFC8B; height: 400px; width: 900px;">
        
            <form class="card-body"  action="http://localhost:8091/DoorToDoorServices/EditReview"
		method="post">
                <h2 class="mb-4 text-center">Edit Review</h2>
				<div class="row">
                    <div class="col-sm-6">
                       
                            <label for="reviewId" class="fw-bold">Review ID:</label>
                            <input type="text" class="form-control" id="reviewId" name="reviewId" value="<%=review.getReviewId()%>" readonly>
                        </div>
                    
                    
                    <div class="col-sm-6">
                        
                            <label for="WorkerId" class="fw-bold">Worker Id:</label>
                            <input type="text" class="form-control" id="WorkerId" name="WorkerId" value="<%=review.getWorkerId()%>" readonly>
                        </div>
                    </div>
                <br/>
                
                <div class="row">
                    <div class="col-sm-6">
                        
                            <label for="rating" class="fw-bold">Rating:</label>
                            <input type="number" class="form-control" id="rating" name="rating" value="<%=review.getRating()%>">
                        </div>
                        
                  <div class="row">
                    <div class="col-sm-6">
                        
                            <label for="serviceName" class="fw-bold">Service Name:</label>
                            <input type="text" class="form-control" id="serviceName" name="serviceName" value="<%=review.getServiceName()%>">
                        </div>
                    
                    
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="comments" class="fw-bold">Comments:</label>
                            <textarea class="form-control" id="comments" name="comments" rows="3"><%=review.getComments()%></textarea>
                        </div>
                    </div>
                </div>

                <div class="text-center mt-4">
                    <button type="submit" class="btn btn-info">Update</button>
                </div>
            </form>
        </div>
    </div>
<%
	String res = request.getParameter("res");
	if (res != null) {
		if (res.equals("0")) {
			out.println("<h4 style='color:red'>Rating not updated</h4>");
		} else {
			out.println("<h4 style='color:green'>Rating  updated</h4>");
		}
	}
	%>

</body>
</html>