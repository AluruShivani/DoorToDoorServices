package com.example.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.Services;

@WebServlet("/DeleteService")
public class DeleteService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		response.setContentType("text/html");
        PrintWriter pw = response.getWriter();

        String serviceId=request.getParameter("serviceId");
        
        Services service=new Services();
        service.setServiceId(Integer.parseInt(serviceId));
        
        boolean flag=Services.deleteService(Integer.parseInt(serviceId));
        int n=0;
        if(flag) {
        	n=1;
        	response.sendRedirect("/DoorToDoorServices/admin/viewservice.jsp");
        }else {
        	n=0;
        }
		
	}
	}

	


