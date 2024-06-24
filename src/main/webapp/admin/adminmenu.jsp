<style>
    .custom-navbar {
        background-color: #d7dbd8;
    }
    .full-height {
        height: 100vh; /* Sets height to 100% of viewport height */
    }
    h2 {
        margin: 0 auto; /* Center the navbar brand */
        display: block; /* Ensure it takes full width */
        text-align: center; /* Align text in the center */
       Courier New: font-family: 'Courier New', Courier, monospace; /* Change font style */
        font-size: 50px;
    }
   body {
            font-family: Arial, sans-serif; /* Choose a professional font */
            background-color: #f0f0f0; /* Set a background color */
        }

        h2 {
            color: #333; /* Set text color */
            text-align: center; /* Center align text */
            margin-top: 50px; /* Add some top margin for spacing */
        }

        h2 i {
            font-style: normal; /* Remove italic style from icon */
        }

        h2 u {
            text-decoration: none; /* Remove underline from link */
        }

        
    

</style>


<nav class="navbar bg-light">
    <div class="container-fluid">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="#"><i class="fas fa-home"></i> Home</a>
            </li>

            <li class="nav-item">
                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"><i class="fas fa-sign-in-alt"></i> Services</a>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="addservices.jsp"><i class="fas fa-user-tie"></i> Add</a></li>
                    <li><a class="dropdown-item" href="viewservice.jsp"><i class="fas fa-users"></i> View</a></li>
                </ul>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="viewworker.jsp"><i class="fas fa-hard-hat"></i> Worker</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="adminreviews.jsp"><i class="fas fa-star"></i> Reviews</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="viewuser.jsp"><i class="fas fa-users"></i> Customers</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
            </li>

        </ul>
         <h2 class="text-warning"><i>&#128736;<u>DoorToDoorService</u>&#128736;</i></h2>
    </div>
</nav>
