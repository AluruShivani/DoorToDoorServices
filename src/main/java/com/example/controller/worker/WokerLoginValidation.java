package com.example.controller.worker;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.User;
import com.example.model.Workers;

@WebServlet("/WokerLoginValidation")
public class WokerLoginValidation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String mobile = request.getParameter("mobile");
        String password = request.getParameter("password");
        
       
        Workers worker =new Workers();
        worker.setMobile(mobile);
        worker.setPassword(password);
        

            boolean flag=worker.validateWorkerLogin();
            if (flag == true) {
                HttpSession session=request.getSession();
                session.setAttribute("workerId", worker.getWorkerId());

                response.sendRedirect("/DoorToDoorServices/worker/workerhome.jsp");
            } else {
               
            	out.println("<script language='javascript'>alert('Invalid user');window.location='workerlogin.jsp?res=0';</script>");
                out.close();
            
            }
    }
	
		
	

}
