package com.example.controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.Admin;
import com.example.model.User;

@WebServlet("/UserLoginValidation")
public class UserLoginValidation extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        //doGet(request, response);
        
        System.out.println("Entering doPost method...");
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String mobile = request.getParameter("mobile");
        String password = request.getParameter("password");
        
        System.out.println("Received mobile: " + mobile);
        System.out.println("Received password: " + password);
        
        User user = new User();
        user.setMobile(mobile);
        user.setPassword(password);
        
        System.out.println("User object created with mobile: " + user.getMobile() + " and password: " + user.getPassword());
        
        boolean flag = user.validateUserLogin();
        if (flag == true) {
            HttpSession session = request.getSession();
            session.setAttribute("userId", user.getUserId());
            
            System.out.println("User login validated. Redirecting to userhome.jsp..."+user.getUserId());
            
            response.sendRedirect("/DoorToDoorServices/user/userhome.jsp");
        } else {
            System.out.println("Invalid user. Redirecting to userlogin.jsp...");
            out.println("<script language='javascript'>alert('Invalid user');window.location='userlogin.jsp?res=0';</script>");
            out.close();
        }
    }
}