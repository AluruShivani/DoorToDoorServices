package com.example.controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.User;
import com.example.model.Workers;

import dbutil.Cryptography;

@WebServlet("/EditProfileServlet")
public class EditProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public EditProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		response.setContentType("text/html");
    	PrintWriter out=response.getWriter();
    	String userId = request.getParameter("userId");
        String fullName = request.getParameter("fullName");
        String mobile=request.getParameter("mobile");
        String password=request.getParameter("password");
        
        String encodeMobile=Cryptography.encode(mobile);
        String encodePassword=Cryptography.encode(password);
        
        User user = new User();
        user.setUserId(Integer.parseInt(userId));
        user.setFullName(fullName);
       
        user.setMobile(encodeMobile);
        user.setPassword(encodePassword);
       
        int n=user.UpdateUserById();
        response.sendRedirect("/DoorToDoorServices/user/userprofile.jsp?res=" +n);
        out.close();
        
	}

}
