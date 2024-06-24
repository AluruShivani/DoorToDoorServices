package com.example.controller.worker;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.Workers;

import dbutil.Cryptography;

@WebServlet("/EditProfile")
public class EditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public EditProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		response.setContentType("text/html");
    	PrintWriter out=response.getWriter();
    	
    	String workerId = request.getParameter("workerId");
        String fullName = request.getParameter("fullName");
        String serviceName = request.getParameter("serviceName");
        String mobile=request.getParameter("mobile");
        String currentAddress=request.getParameter("currentAddress");
        String cities=request.getParameter("cities");
        String password=request.getParameter("password");
        
        String encodeMobile=Cryptography.encode(mobile);
        String encodePassword=Cryptography.encode(password);
       
        Workers worker = new Workers();
        worker.setWorkerId(Integer.parseInt(workerId));
        worker.setFullName(fullName);
        worker.setServiceName(serviceName);
        worker.setMobile(encodeMobile);
        worker.setPassword(encodePassword);
        worker.setCurrentAddress(currentAddress);
        worker.setCities(cities);
        
        int n=worker.UpdateWorkerById();
        response.sendRedirect("/DoorToDoorServices/worker/profile.jsp?res=" +n);
        out.close();
        
		
		
		
	}

}
