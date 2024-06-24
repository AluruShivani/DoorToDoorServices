package com.example.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.Services;

@WebServlet("/EditService")
public class EditService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		 response.setContentType("text/html");
	     PrintWriter out = response.getWriter();
	     
	     int serviceId = Integer.parseInt(request.getParameter("serviceId"));
	     String serviceName = request.getParameter("serviceName");
	     

	        Services service = new Services();
	        int n = service.updateService(serviceId,serviceName);

	        if (n > 0) {
	            response.sendRedirect("/DoorToDoorServices/admin/viewservice.jsp?res=" + n);
	        }
	}

}
