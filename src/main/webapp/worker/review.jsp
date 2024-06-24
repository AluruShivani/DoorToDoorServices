<%@page import="com.example.model.Workers"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../header.jsp" />
    <jsp:include page="title.jsp"/>
    
 </head>
 
<body>
<%
    String workerId = request.getParameter("workerId");
    Workers worker = new Workers();
    worker.setWorkerId(Integer.parseInt(workerId));
    worker = worker.getWorkerById(Integer.parseInt(workerId)); // Pass the worker ID as an argument
%>

<div class="table-responsive">
<div class="container">
  <div class="d-flex justify-content-center">
    <div class="col-md-8 mt-3">
        <div class="card p-4 border-danger border-2" style="width: 100%">
            <h2 class="card-header text-center border-danger border-2" style="background-color:yellow;">RATINGS</h2>
            <div class="card-body">
                <form action="/DoorToDoorServices/ReviewServlet" method="post">
                    <div class="row">
                        <div class='col-sm-12'>
                            <div class='row mt-2'>
                                <div class='col-sm-12'>
                                    <label for='workerId' class="fw-bold text-success fs-4 text-decoration-underline text-decoration-overline">Worker Id:</label>
                                    <span class="fs-4"><%=worker.getWorkerId() %></span>
                                    <input type="hidden" class='form-control' name='workerId' value='<%=worker.getWorkerId()%>' >
                                </div>
                            </div>
                        </div>&nbsp;
                        
                         <div class='col-sm-12'>
                            <div class='row mt-2'>
                                <div class='col-sm-12'>
                                    <label for='serviceName' class="fw-bold text-success fs-4 text-decoration-underline text-decoration-overline">Service Name:</label>
                                    <span class="fs-4"><%=worker.getServiceName() %></span>
                                    <input type="hidden" class='form-control' name='serviceName' value='<%=worker.getServiceName()%>' >
                                </div>
                            </div>
                        </div>&nbsp;
                        
                        <div class='col-sm-12'>
                            <div class='row mt-2'>
                                <div class='col-sm-12'>
                                    <label for='workerPic' class="fw-bold text-success fs-4 text-decoration-underline text-decoration-overline">WorkerPic:</label><br/>
                                    <span><img src ='../uploads/<%=worker.getWorkerPic()%>' style='width:200px;height:150px'/></span>
                                    
                                </div>
                            </div>
                        </div>&nbsp;
                        
                        
                       <div class='col-sm-12'>
                            <div class='row mt-2'>
                                <div class='col-sm-12'>
                                    <label for='fullName' class="fw-bold text-success fs-4 text-decoration-underline text-decoration-overline">Full Name:</label>
                                    <span class="fs-4"><%=worker.getFullName() %></span>
                                    <input type="hidden" class='form-control' name='fullName' value='<%=worker.getFullName()%>' >
                                </div>
                            </div>
                        </div>&nbsp;

                        <div class="col-md-12">
                            <div class="form-group mb-2">
                                <label for="ratings" class="fw-bold text-success fs-4 text-decoration-underline text-decoration-overline">Ratings:</label>
                                <select class="form-control fs-4" id="ratings" name="rating">
                                    <option value="1">&#9733;</option>
                                    <option value="2">&#9733;&#9733;</option>
                                    <option value="3">&#9733;&#9733;&#9733;</option>
                                    <option value="4">&#9733;&#9733;&#9733;&#9733;</option>
                                    <option value="5">&#9733;&#9733;&#9733;&#9733;&#9733;</option>
                                </select>
                            </div>
                        </div>
                    </div>&nbsp;

                    <div class='row'>
                        <div class='col-sm-12'>
                            <label for='comments' class="fw-bold text-success fs-4 text-decoration-underline text-decoration-overline">Comments:</label>
                            <textarea class="form-control fs-4" rows="3" cols="10" name="comments"></textarea>
                        </div>
                    </div><br/>
                    
                    <center>
                        <button type="submit" class="btn btn-primary ">SUBMIT</button>
                    </center>
                </form>
            </div>
        </div>
    </div>
  </div>
</div>
</div>
</body>
</html>
