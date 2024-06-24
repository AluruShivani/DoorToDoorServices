package com.example.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.Admin;

import dbutil.Cryptography;

@WebServlet("/AdminLoginValidation")
public class AdminLoginValidation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
 		
 		response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
     
       
        Admin admin =new Admin();
        admin.setUsername(username);
        admin.setPassword(password);
        

            boolean flag=admin.validateAdminLogin();
            if (flag == true) {
                HttpSession session=request.getSession();
                response.sendRedirect("/DoorToDoorServices/admin/adminhome.jsp");
            } else {
               
            	out.println("<script language='javascript'>alert('Invalid user');window.location='adminlogin.jsp?res=0';</script>");
                out.close();
            
            }
    }
	}


