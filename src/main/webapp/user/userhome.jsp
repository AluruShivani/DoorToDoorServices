<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.Workers"%>
<%@page import="dbutil.Cryptography"%>
<html>
<head>
<jsp:include page="../header.jsp"/>
<jsp:include page="title.jsp"/>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
        }

        .main {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            grid-gap: 20px;
            justify-content: center;
        }

        .search-container {
            text-align: center;
            margin-bottom: 20px;
        }

        .search-container input[type=text] {
            width: 50%;
            padding: 12px;
            margin: 0 auto;
            box-sizing: border-box;
            border: 2px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            background-color: white;
            transition: width 0.4s ease-in-out;
        }

        .flip-card {
            background-color: transparent;
            width: 100%;
            height: 300px;
            perspective: 1000px; 
        }

        .flip-card-inner {
            position: relative;
            width: 100%;
            height: 100%;
            text-align: center;
            transition: transform 0.6s;
            transform-style: preserve-3d;
            box-shadow: 0 2px 2px 0 rgba(255, 0, 0, 0.5); 
        }

        .flip-card:hover .flip-card-inner {
            transform: rotateY(180deg);
        }

        .flip-card-front, .flip-card-back {
            position: absolute;
            width: 100%;
            height: 100%;
            -webkit-backface-visibility: hidden;
            backface-visibility: hidden;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .flip-card-front {
            background-color: #e0d619;
            color: black;
            font-family: 'Times New Roman', Times, serif;
        }

        .flip-card-back {
            background-color:#9566b3;
            color: white;
            transform: rotateY(180deg);
        }
        
        .icon-green {
            color: green;
        }
        
        .img {
            max-width: 100%;
            max-height: 100%;
            width: auto;
            height: auto;
            margin: auto;
        }
        
    </style>
    <script>
    function confirmBooking(workerId) {
        // Assuming you want a simple confirmation box
        var confirmed = confirm("Are you sure you want to confirm booking for workerID: " + workerId + "?");
        if (confirmed) {
            // Redirect to the confirm_booking URL with workerId
            window.location.href = "/DoorToDoorServices/BookNowServlet?workerId=" + workerId+"&";
        } else {
            // If user cancels, do nothing
            return false;
        }
    }
</script>
<script>
function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else {
        alert("Geolocation is not supported by this browser.");
    }
}

function showPosition(position) {
    var latitude = position.coords.latitude;
    var longitude = position.coords.longitude;
    document.getElementById("latitude").value = latitude;
    document.getElementById("longitude").value = longitude;
}

function bookService(workerId, serviceName) {
    var latitude = document.getElementById("latitude").value;
    var longitude = document.getElementById("longitude").value;
    window.location="/DoorToDoorServices/BookNowServlet?workerId="+workerId+"&serviceName="+serviceName+"&latitude="+latitude+"&longitude="+longitude;
    console.log(latitude);
    console.log(longitude);
}

// Call getLocation() when the page loads
window.onload = function() {
    alert("The website wants to allow your location to book the services and get work done!!.");
    getLocation();
};
</script>
</head>
<body>
<jsp:include page="usermenu.jsp"/>

<div>
    <label for="latitude" class="fw-bold"></label>
    <input type="text" id="latitude" name="latitude" style="width: 100px;" readonly>
</div>&nbsp;&nbsp;
<div>
    <label for="longitude" class="fw-bold"></label>
    <input type="text" id="longitude" name="longitude" style="width: 100px;" readonly>
</div>
    <div class="main">
       
        <% 
            Workers worker = new Workers();
            List<Workers> workerList = new ArrayList<Workers>();// Assuming getAllWorkers() retrieves all workers from the database
            
            String search=request.getParameter("search");
            if(search==null){//without search
            	workerList=worker.getAllWorkers(null);
            System.out.println("workerList");
            }else{//with search
            	
            System.out.print("search:"+search);
            workerList=worker.getAllWorkers(search);
            }
            for (Workers workerOb : workerList) {
        %>

        <div class="flip-card mt-4" data-service-name="<%= workerOb.getServiceName() %>">
            <div class="flip-card-inner">
                <div class="flip-card-front">
                    <img src="../uploads/<%= workerOb.getWorkerPic() %>" class="img" alt="Worker Image">
                    <h3 class="card-title text-primary" ><%= workerOb.getServiceName() %></h3>
                    <h3 class="card-title bg-warning " ><%= workerOb.getCities() %></h3>
                </div>
                <div class="flip-card-back">
                    <p class='card-text' ><strong>Worker ID:</strong> <%= workerOb.getWorkerId() %></p>
                    <p class='card-text'><strong>Name:</strong> <%= workerOb.getFullName() %></p>
                    <p class='card-text'><strong>Mobile:</strong> <%= Cryptography.decode(workerOb.getMobile()) %></p>
                    <p class='card-text'><strong>Status:</strong> <%= workerOb.getStatus() %></p>
                   <div class="text-center mt-auto"> 
   					 <a href="#" onclick="bookService('<%=workerOb.getWorkerId() %>', '<%=workerOb.getServiceName() %>')">
       				 	<i class="fas fa-calendar-plus fa-2x icon-green"></i>
  					  </a>
				</div>
                </div>
            </div>
        </div>

        <% } %>
    </div>

  
</body>
</html>
