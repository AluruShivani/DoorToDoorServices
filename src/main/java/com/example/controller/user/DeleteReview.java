package com.example.controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.Reviews;

@WebServlet("/DeleteReview")
public class DeleteReview extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		response.setContentType("text/html");
        PrintWriter pw = response.getWriter();

        String reviewId=request.getParameter("reviewId");
        
        Reviews review=new Reviews();
        review.setReviewId(Integer.parseInt(reviewId));
        
        boolean flag=Reviews.deleteReview(Integer.parseInt(reviewId));
        int n=0;
        if(flag) {
        	n=1;
        	response.sendRedirect("/DoorToDoorServices/worker/viewreview.jsp");
        }else {
        	n=0;
        }
		
	}
	}



