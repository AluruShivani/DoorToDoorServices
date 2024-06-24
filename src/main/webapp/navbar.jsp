<style>
    .custom-navbar {
        background-color: #d7dbd8;
    }
    
    li a:hover,
    .dropdown:hover.dropbtn{
    background-color:yellow;
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
          <a class="nav-link" href="index.jsp">
            <i class="fas fa-home"></i> Home
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="about.jsp">
            <i class="fas  fa-info-circle"></i> About
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="contact.jsp">
            <i class="fas  fa-envelope"></i> Contact
          </a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"><i class="fas fa-sign-in-alt"></i> Login</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="adminlogin.jsp"><i class="fas fa-user-tie"></i>Admin</a></li>
            <li><a class="dropdown-item" href="workerlogin.jsp"><i class="fas fa-users"></i>Workers</a></li>
            <li><a class="dropdown-item" href="userlogin.jsp"><i class="fas fa-user"></i>Users</a></li>
          </ul>
        </li>
        
      </ul>
      
    </div>
    
  </div>
  
</nav>
