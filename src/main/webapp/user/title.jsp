<style>
    /* CSS for hover effect */
    .social-icon {
        transition: transform 0.3s ease-in-out;
    }

    .social-icon:hover {
        transform: scale(1.1);
        background-color: rgba(255, 255, 255, 0.2); /* Changed background color on hover */
    }
    
    .a {
        background-color:blue;
        padding: 10px; /* Adding padding for better visual appearance */
        border-radius: 5px; /* Adding border radius for rounded corners */
    }
    
    /* Adjust search form layout */
    .search-form {
        display: flex;
        align-items: center;
    }

    .search-input {
        flex: 1;
        margin-right: 10px; /* Add margin between search input and button */
    }

    @media (max-width: 576px) {
        /* Adjust layout for small screens */
        .search-form {
            flex-direction: column;
            align-items: stretch;
        }

        .search-input {
            margin-right: 0; /* Remove margin for small screens */
            margin-bottom: 10px; /* Add margin bottom for better spacing */
        }
    }
</style>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark ">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">
            <img src="../images/home3.jpg" alt="Logo" style="width:50px;" class="rounded-pill" >&nbsp;<b class="navbar-brand-text"><span class="a">DoorToDoorServices&#127968;</span></b>
        </a>
       
          <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <!-- Updated search form -->
            <form class="form-inline mx-auto search-form">
                <input class="form-control mr-sm-2 search-input" type="text" placeholder="Search" style="width: 300px;">
                <button class="btn btn-warning" type="submit">Search</button>
            </form>
        </div>
        
        <div class="navbar-collapse justify-content-end">
            <a class="navbar-brand">
                <!-- Font Awesome Icons with hover effect -->
                <i class="fas fa-envelope social-icon" style="font-size: 40px; color: #D44638;"></i>&nbsp;
                <i class="fab fa-twitter social-icon" style="font-size: 40px; color: #1DA1F2;"></i>
                <i class="fab fa-facebook social-icon" style="font-size: 40px; color: #1877f2;"></i>
            </a>
        </div>
    </div>
</nav>
