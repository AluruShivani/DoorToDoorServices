<style>
    .custom-navbar {
        background-color: #d7dbd8;
    }
    
    li a:hover,
    .dropdown:hover.dropbtn{
    background-color:white;
    color:white;
    }
</style>

<nav class="navbar navbar-expand-lg navbar-light custom-navbar sticky-top">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="userhome.jsp">
            <i class="fas fa-home"></i> Home
          </a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" href="userprofile.jsp">
            <i class="fas  fa-info-circle"></i> Profile
          </a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" href="bookedworker.jsp">
            <i class="fas  fa-envelope"></i>Bookings
          </a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" href="/DoorToDoorServices/worker/viewreview.jsp">
            <i class="fas  fa-star"></i>Reviews
          </a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" href="logout.jsp">
            <i class="fas  fa-sign-out-alt"></i>Logout
          </a>
        </li>
        
      </ul>
      
    </div>
    
  </div>
  
</nav>
