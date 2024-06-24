package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dbutil.DBConnection;

public class Bookings implements Serializable {
	private int bookigId;
	private String bookingDate;
	private int userId;
	private int workerId;
	private String serviceName;
	private String workerLatitude;
	private String workerLongitude;
	private String status;
	
	public Bookings() {
		super();
	}

	public Bookings(int bookigId, String bookingDate, int userId, int workerId, String serviceName,
			String workerLatitude, String workerLongitude, String status) {
		super();
		this.bookigId = bookigId;
		this.bookingDate = bookingDate;
		this.userId = userId;
		this.workerId = workerId;
		this.serviceName = serviceName;
		this.workerLatitude = workerLatitude;
		this.workerLongitude = workerLongitude;
		this.status = status;
	}

	public int getBookigId() {
		return bookigId;
	}

	public void setBookigId(int bookigId) {
		this.bookigId = bookigId;
	}

	public String getBookingDate() {
		return bookingDate;
	}

	public void setBookingDate(String bookingDate) {
		this.bookingDate = bookingDate;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getWorkerId() {
		return workerId;
	}

	public void setWorkerId(int workerId) {
		this.workerId = workerId;
	}

	public String getServiceName() {
		return serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	public String getWorkerLatitude() {
		return workerLatitude;
	}

	public void setWorkerLatitude(String workerLatitude) {
		this.workerLatitude = workerLatitude;
	}

	public String getWorkerLongitude() {
		return workerLongitude;
	}

	public void setWorkerLongitude(String workerLongitude) {
		this.workerLongitude = workerLongitude;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
	public int addUserBookings() {
		int n = 0;
		DBConnection db = new DBConnection();
		Connection conn = db.getConnection();

		if (conn == null) {
			n = 0;
		} else {
			try {
				String qry = "insert into bookings(bookingId,bookingDate,userId,workerId,serviceName,workerLatitude,workerLongitude,status) values(?,?,?,?,?,?,?,?) ";
				PreparedStatement pst = conn.prepareStatement(qry);

				pst.setInt(1, this.bookigId);
				pst.setString(2, this.bookingDate);
				pst.setInt(3, this.userId);
				pst.setInt(4, this.workerId);
				pst.setString(5, this.serviceName);
				pst.setString(6, this.workerLatitude);
				pst.setString(7, this.workerLongitude);
				pst.setString(8, this.status);
				
				System.out.println("qry="+pst.toString());//de-bugging method
				n = pst.executeUpdate(); // Use executeUpdate for INSERT, UPDATE, DELETE
			} catch (Exception e) {
				n = 0;
			}

		}
		return n;
	}
	
	
	public List<Bookings> getAllBookings(){
		List<Bookings> bookingsList=new ArrayList<>();
		
		try {
			DBConnection db = new DBConnection();
		    Connection conn = db.getConnection();
		    
		    String qry = "select bookingId,bookingDate,userId,workerId,serviceName,workerLatitude,workerLongitude,status from bookings ";
		   
		    Statement st=(Statement) conn.createStatement();
		   
		    
		    ResultSet rs=st.executeQuery(qry);
		    
		    while(rs.next()) {
		    	Bookings bookigs= new Bookings();
		    	bookigs.setBookigId(rs.getInt("bookingId"));
		    	bookigs.setBookingDate(rs.getString("bookingDate"));
		    	bookigs.setWorkerId(rs.getInt("workerId"));
		    	bookigs.setServiceName(rs.getString("serviceName"));
		    	bookigs.setWorkerLatitude(rs.getString("workerLatitude"));
		    	bookigs.setWorkerLongitude(rs.getString("workerLongitude"));
		    	bookigs.setStatus(rs.getString("status"));
		    	
			
		    	bookingsList.add(bookigs);
		    }
		}catch(Exception e) {
			System.out.println("Error:getAllBookings..:" +e);
			
		}
		return bookingsList;
	}

	public List<Bookings> getAllBookingsByUserId(int userId) {
	    List<Bookings> bookingsList = new ArrayList<>();

	    try {
	        DBConnection db = new DBConnection();
	        Connection conn = db.getConnection();

	        String qry = "SELECT bookingId, bookingDate, userId, workerId, serviceName, workerLatitude, workerLongitude, status FROM bookings where userId=?";
	        PreparedStatement pst = conn.prepareStatement(qry);
	        pst.setInt(1, userId); // Set the user ID parameter

	        ResultSet rs = pst.executeQuery();

	        while (rs.next()) {
	            Bookings bookings = new Bookings();
	            bookings.setBookigId(rs.getInt("bookingId"));
	            bookings.setBookingDate(rs.getString("bookingDate"));
	            bookings.setUserId(rs.getInt("userId"));
	            bookings.setWorkerId(rs.getInt("workerId"));
	            bookings.setServiceName(rs.getString("serviceName"));
	            bookings.setWorkerLatitude(rs.getString("workerLatitude"));
	            bookings.setWorkerLongitude(rs.getString("workerLongitude"));
	            bookings.setStatus(rs.getString("status"));

	            bookingsList.add(bookings);
	        }
	    } catch (Exception e) {
	        System.out.println("Error: " + e.getMessage());
	    }
	    return bookingsList;
	}

	public List<Bookings> getBookingsByWorkerId(int workerId) {
        List<Bookings> bookings = new ArrayList<>();
        try {
	        DBConnection db = new DBConnection();
	        Connection conn = db.getConnection();

           
            String query = "SELECT * FROM bookings WHERE workerId=?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setInt(1, workerId);
            ResultSet rs = pst.executeQuery();
            
            
            while (rs.next()) {
                Bookings booking = new Bookings();
                booking.setBookigId(rs.getInt("bookingId"));
                booking.setBookingDate(rs.getString("bookingDate"));
                booking.setUserId(rs.getInt("userId"));
                booking.setWorkerId(rs.getInt("workerId"));
                booking.setServiceName(rs.getString("serviceName"));
                booking.setWorkerLatitude(rs.getString("workerLatitude"));
                booking.setWorkerLongitude(rs.getString("workerLongitude"));
                booking.setStatus(rs.getString("status"));
                bookings.add(booking);
            }
            conn.close();
        } catch (Exception e) {
           System.out.println("Error:"+e);
            
        }
        return bookings;
    }

}