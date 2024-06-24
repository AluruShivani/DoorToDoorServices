<%@page import="com.example.model.User"%>
<%@page import="dbutil.Cryptography"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.Workers"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    
    
    <style>
        /* Global reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Body styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            line-height: 1.6;
        }

        /* Container styles */
        .container {
            max-width: 960px;
            margin: 20px auto;
            padding: 0 20px;
        }

        /* Card styles */
        .card {
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            margin-bottom: 20px;
            padding: 20px;
            animation: fadeIn 0.5s ease;
        }

        /* Fade-in animation */
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 10;
            }
        }

        /* Title styles */
        .card-title {
            font-size: 32px;
            color: #007bff;
            margin-bottom: 20px;
            text-align: center;
            text-transform: uppercase;
        }

        /* Profile image styles */
        .profile-image {
            display: block;
            margin: 0 auto;
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Profile info styles */
        .profile-info {
            padding-left: 20px;
        }

        /* Profile info item styles */
        .profile-info p {
            margin-bottom: 10px;
            font-size: 18px;
            font-weight: bold;
        }

        .profile-info p span {
            font-weight: normal;
        }
    </style>
</head>
<body>
    <div class="container">
        <% 
            User user = new User();
            List<User> userList = user.getUserById((int) session.getAttribute("userId"));
            for (User userOb : userList) {
        %>

        <div class="card">
            <h2 class="card-title">Profile</h2>
            <div class="row">
                <div class="col-md-4 text-center">
                     <a href='edituserprofile.jsp?tableName=users&setColName=profilePic&whereColName=userId&conditionValue=<%=userOb.getUserId() %>'> 
                        <img class="profile-image" src='../uploads/<%=userOb.getProfilePic()%>' alt="Profile Image" />
                    </a>
                </div>
                <div class="col-md-8 profile-info">
                    <p>User ID: <span><%= userOb.getUserId() %></span></p>
                    <p>Full Name: <span><%= userOb.getFullName() %></span></p>
                   
                    <p>Mobile: <span><%= Cryptography.decode(userOb.getMobile()) %></span></p>
                    <p>Password: <span><%= Cryptography.decode(userOb.getPassword()) %></span></p>
                  <div><a href="/DoorToDoorServices/user/editProfile.jsp?userId=<%=userOb.getUserId()%>" class='btn btn-sm btn-info'>Edit</a></div>
                    
                </div>
            </div>
        </div>
        <% } %>
    </div>
</body>
</html>
