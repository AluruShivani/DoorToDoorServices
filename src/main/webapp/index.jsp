<%@page import="dbutil.Cryptography" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <jsp:include page="header.jsp"/>
    <jsp:include page="title.jsp"/>
    
    <style>
        body, html {
            height: 85%;
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
        }

        * {
            box-sizing: border-box;
        }

        .bg-image {
            /* The image used */
            background-image: url("./images/home6.jpg");
            /* Add the blur effect */
            filter: blur(2px);
            -webkit-filter: blur(3px);
            /* Full height */
            height: 100%; 
            /* Center and scale the image nicely */
            background-position: center;
            background-size: cover;
        }

        /* Position text in the middle of the page/image */
        .bg-text {
            background-color: rgba(0,0,0, 0.5); /* Black w/opacity/see-through */
            color: white;
            font-weight: bold;
            border: 3px solid ;
            position: absolute;
            top: 80%;
            left: 50%;
            transform: translate(-50%, -50%);
            z-index: 5;
            width: 80%; /* Decreased width */
            padding: 9px; /* Decreased padding */
            text-align: center;
        }

        .container {
            display: inline-block; /* Display containers side by side */
            position: relative;
            width: 30%;
            margin: 10px; /* Added margin for spacing between containers */
        }

        .image {
            opacity: 1;
            display: block;
            height: auto;
            transition: .5s ease;
            backface-visibility: hidden;
        }

        .middle {
            transition: .5s ease;
            opacity: 0;
            position: absolute;
            top: 70%;
            left: 50%;
            transform: translate(-50%, -50%);
            -ms-transform: translate(-50%, -50%);
            text-align: center;
        }

        .container:hover .image {
            opacity: 0.3;
        }

        .container:hover .middle {
            opacity: 1;
        }

        .text {
            background-color: #04AA6D;
            color: white;
            font-size: 16px;
            padding: 5px 32px;
        }

    </style>

</head>
<body>
<%String text="12345";
String encode=Cryptography.encode(text);
System.out.println("encode="+encode);
String decode=Cryptography.decode(encode);
System.out.println("decode="+decode);
%>
<jsp:include page="navbar.jsp"/>

<div class="bg-image"></div>

<div class="bg-text">
    <h1 class="text-white">
        <span class="stroke-text" style="font-size:35px">&#128736;WELCOME TO DOOR-TO-DOOR-SERVICES&#128736;</span>
    </h1>
</div>

<h2 class="text-center mt-3 text-success"><u>THE SERVICES WE PROVIDE</u></h2>
<div class="container">
    <img src="./images/cleaning.jpg" alt="clean" class="image" style="width:100%">
    <div class="middle"><div class="text">CLEANING</div></div>
</div>

<!-- Second container for the second cleaning image -->
<div class="container">
    <img src="./images/plumber.jpg" alt="plumb" class="image" style="width:100%">
    <div class="middle">
        <div class="text">PLUMBING</div>
    </div>
</div>

<div class="container">
    <img src="./images/painting.jpg" alt="paint" class="image" style="width:100%">
    <div class="middle"><div class="text">PAINTING</div></div>
</div>

<div class="container">
    <img src="./images/electrical.jpg" alt="paint" class="image" style="width:100%">
    <div class="middle"><div class="text">ELECTRICAL</div></div>
</div>

<div class="container">
    <img src="./images/pest.jpg" alt="paint" class="image" style="width:100%">
    <div class="middle"><div class="text">PEST CONTROL</div></div>
</div>

<div class="container">
    <img src="./images/furniture.jpg" alt="paint" class="image" style="width:100%">
    <div class="middle"><div class="text">FURNITURE ASSEMBL</div></div>
</div>

<h3 class="text-center text-success" style="font-style: italic;">Enjoy our Services with a call&#128222;</h3>

<jsp:include page="footer.jsp"/>

</body>
</html>
