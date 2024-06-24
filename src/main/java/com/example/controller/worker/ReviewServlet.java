package com.example.controller.worker;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.Reviews;

@WebServlet("/ReviewServlet")
public class ReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		String workerId = request.getParameter("workerId");
		String rating=request.getParameter("rating");
		String comments=request.getParameter("comments");
		String serviceName=request.getParameter("serviceName");
		
		System.out.println("workerId="+workerId);
		System.out.println("rating="+rating);
		System.out.println("comments="+comments);
		
		HttpSession session=request.getSession();
		
		int userId= Integer.parseInt(session.getAttribute("userId").toString());
		System.out.println("userId="+userId);
		
		Reviews review=new Reviews();
		review.setWorkerId(Integer.parseInt(workerId));
		review.setRating(Integer.parseInt(rating));
		review.setComments(comments);
		review.setUserId(userId);
		review.setServiceName(serviceName);
		
		int n= review.addReviews();
		
		response.sendRedirect("/DoorToDoorServices/user/bookedworker.jsp?res="+n);
		pw.close();
		
	}

}
