package com.example.controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.Reviews;

@WebServlet("/EditReview")
public class EditReview extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        int reviewId = Integer.parseInt(request.getParameter("reviewId"));
        int rating = Integer.parseInt(request.getParameter("rating"));
        String comments = request.getParameter("comments");
       
        
        Reviews review = new Reviews();
        int n = review.updateReview(reviewId, rating, comments);

        if (n > 0) {
            response.sendRedirect("/DoorToDoorServices/worker/viewreview.jsp?res=" + n);
        }
	}

}
