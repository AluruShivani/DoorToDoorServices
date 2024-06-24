package com.example.controller.worker;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.Workers;

@WebServlet("/DeleteWorker")
public class DeleteWorker extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		response.setContentType("text/html");
        PrintWriter pw = response.getWriter();

        String workerId = request.getParameter("workerId");

        Workers worker = new Workers();
        worker.setWorkerId(Integer.parseInt(workerId));
        
        boolean flag = worker.deleteWorkerByCode(); // Corrected method name

        int n = 0;
        if (flag) {
            n = 1;
            response.sendRedirect("/DoorToDoorServices/admin/viewworker.jsp");

        } else {
            n = 0;
        }
    }
	}

	


