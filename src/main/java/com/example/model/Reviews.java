package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import dbutil.DBConnection;

public class Reviews implements Serializable {
	private int reviewId;
	private int userId;
	private int workerId;
	private String reviewDate;
	private String serviceName;
	private int rating;
	private String comments;
	
	public Reviews() {
		super();
	}
	
	public Reviews(int reviewId, int userId, int workerId, String reviewDate, String serviceName, int rating,
			String comments) {
		super();
		this.reviewId = reviewId;
		this.userId = userId;
		this.workerId = workerId;
		this.reviewDate = reviewDate;
		this.serviceName = serviceName;
		this.rating = rating;
		this.comments = comments;
	}
	public int getReviewId() {
		return reviewId;
	}
	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
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
	public String getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}
	public String getServiceName() {
		return serviceName;
	}
	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}

	public int addReviews() {
		int n=0;
		try{
			DBConnection db=new DBConnection();
			Connection conn=db.getConnection();
			
			

			String qry = "insert into reviews (userId,workerId,reviewDate,serviceName,rating,comments) values(?,?,?,?,?,?)";
			
			PreparedStatement pst = conn.prepareStatement(qry);
			
			pst.setInt(1, this.userId);
			pst.setInt(2, this.workerId);
			pst.setString(3, reviewDate.valueOf(LocalDate.now()));
			pst.setString(4, this.serviceName);
			pst.setInt(5, this.rating);
			pst.setString(6, this.comments);
			
			

			n = pst.executeUpdate();

		
		}catch(Exception e) {
			System.out.println("error: "+e);
		}
		return n;
	}
	
	
	public boolean isReviewGiven(int userId,int workerId) {
		boolean flag=false;
		
		try{
			DBConnection db=new DBConnection();
			Connection conn=db.getConnection();
		
		String qry="select reviewId from reviews where userId=? and workerId=?";
		PreparedStatement pst = conn.prepareStatement(qry);
		pst.setInt(1, userId);
		pst.setInt(2, workerId);
		System.out.println("rating qry="+pst.toString());
		ResultSet rs=pst.executeQuery();
		if(rs.next()) {
			flag=true;
		}
		
		}catch(Exception e){
			System.out.println("error:"+e);
		}
		return flag;
		
	}
	
	public List<Reviews> getAllReviews() {
        List<Reviews> reviewList = new ArrayList<>();
        try {
            DBConnection db = new DBConnection();
            Connection conn = db.getConnection();

            String query = "SELECT * FROM reviews";
            PreparedStatement pst = conn.prepareStatement(query);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                Reviews review = new Reviews();
                review.setReviewId(rs.getInt("reviewId"));
                review.setWorkerId(rs.getInt("workerId"));
                review.setServiceName(rs.getString("serviceName"));
                review.setRating(rs.getInt("rating"));
                review.setComments(rs.getString("comments"));
                review.setUserId(rs.getInt("userId"));
                reviewList.add(review);
            }
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reviewList;
	}
	
	 public static boolean deleteReview(int reviewId) {
	        boolean deleted = false;
	        try {
	            DBConnection db = new DBConnection();
	            Connection conn = db.getConnection();

	            String query = "DELETE FROM rviews WHERE reviewsId=?";
	            PreparedStatement pst = conn.prepareStatement(query);
	            
	            System.out.println("qry="+pst.toString());
	            pst.setInt(1, reviewId);

	            int rowsAffected = pst.executeUpdate();
	            if (rowsAffected > 0) {
	                deleted = true;
	            }
	            conn.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return deleted;
	    }
	 
	 public static Reviews getReviewById(int reviewId) {
		 Reviews review = null;
	        try {
	            DBConnection db = new DBConnection();
	            Connection conn = db.getConnection();

	            String query = "SELECT * FROM reviews WHERE reviewId=?";
	            PreparedStatement pst = conn.prepareStatement(query);
	            pst.setInt(1, reviewId);
	            ResultSet rs = pst.executeQuery();
	            System.out.println("rating:"+pst.toString());

	            if (rs.next()) {
	            	review = new Reviews();
	            	review.setReviewId(rs.getInt("reviewId"));
	            	review.setWorkerId(rs.getInt("workerId"));
	            	review.setServiceName(rs.getString("serviceName"));
	            	review.setRating(rs.getInt("rating"));
	            	review.setComments(rs.getString("comments"));
	            	review.setUserId(rs.getInt("userId"));
	            }
	            conn.close();
	        } catch (Exception e) {
	            System.out.println("Error: "+e);
	        }
	        return review;
	    }
	
	 public int updateReview(int reviewId, int rating, String comments) {
	        int rowsAffected = 0;
	        try {
	            DBConnection db = new DBConnection();
	            Connection conn = db.getConnection();

	            String query = "UPDATE reviews SET rating=?, comments=? WHERE reviewId=?";
	            PreparedStatement pst = conn.prepareStatement(query);
	            pst.setInt(1, rating);
	            pst.setString(2, comments);
	            pst.setInt(3, reviewId);

	            rowsAffected = pst.executeUpdate();
	            conn.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	            // Handle the exception appropriately
	        }
	        return rowsAffected;
	    }
	
	 public List<Reviews> getReviewsByWorkerId(int workerId) {
		    List<Reviews> reviewsList = new ArrayList<>();
		    try {
		        DBConnection db = new DBConnection();
		        Connection conn = db.getConnection();

		        String query = "SELECT * FROM reviews WHERE workerId=?";
		        PreparedStatement pst = conn.prepareStatement(query);
		        pst.setInt(1, workerId);

		        System.out.println("ratingbyworkerId=" + pst.toString());
		        ResultSet rs = pst.executeQuery();

		        while (rs.next()) {
		            Reviews review = new Reviews();
		            review.setReviewId(rs.getInt("reviewId"));
		            review.setUserId(rs.getInt("userId"));
		            review.setWorkerId(rs.getInt("workerId"));
		            review.setRating(rs.getInt("rating"));
		            review.setReviewDate(rs.getString("reviewDate"));
		            review.setServiceName(rs.getString("serviceName"));
		            review.setComments(rs.getString("comments"));
		            reviewsList.add(review);
		        }
		        conn.close();
		    } catch (Exception e) {
		        System.out.println("Error: " + e);
		    }
		    return reviewsList;
		}
}

