package com.example.controller.worker;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.example.model.Bookings;
import com.example.model.Workers;

@WebServlet("/BookNowServlet")
public class BookNowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();

        String workerId = request.getParameter("workerId");
        System.out.println("Worker ID: " + workerId);
        
       
        
        String lat=request.getParameter("latitude");
	    System.out.println("Latitude="+lat);
	    
	    String longi=request.getParameter("longitude");
	    System.out.println("Longitude="+longi);
        
        Calendar calendar = Calendar.getInstance();
        String bookingDate = calendar.get(Calendar.YEAR) + "/" + (calendar.get(Calendar.MONTH) + 1) + "/"
                + calendar.get(Calendar.DAY_OF_MONTH);
        
        
        
        

        // Retrieve service name and status from Workers object (assuming you have a method to retrieve Workers details by ID)
        Workers worker = new Workers(); // Assuming you have a Workers model class
        worker = worker.getWorkerById(Integer.parseInt(workerId)); // Assuming you have a method to get worker details by ID

        String serviceName = worker.getServiceName();
        String status = worker.getStatus();

        // Getting current date
       

        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("userId");
        System.out.println("User ID: " + userId);

        Bookings booking = new Bookings();
        booking.setBookingDate(bookingDate);
        booking.setUserId(userId);
        booking.setWorkerId(Integer.parseInt(workerId));
        booking.setServiceName(serviceName);
        booking.setWorkerLatitude(lat);
        booking.setWorkerLongitude(longi);
        booking.setStatus(status);

        int n = booking.addUserBookings();

        // Redirecting to user home page with result
        response.sendRedirect("/DoorToDoorServices/user/userhome.jsp?res=" + n);
        pw.close();
    }

   

}