package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import dbutil.Cryptography;
import dbutil.DBConnection;

public class User implements Serializable{
	private int userId;
	private String fullName;
	private String registrationDate;
	private String mobile;
	private String password;
	private String profilePic;
	
	public User() {
		super();
	}
	public User(int userId, String fullName, String registrationDate, String mobile, String password, String profilePic) {
		super();
		this.userId = userId;
		this.fullName = fullName;
		this.registrationDate = registrationDate;
		this.mobile = mobile;
		this.password = password;
		this.profilePic = profilePic;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getRegistrationDate() {
		return registrationDate;
	}
	public void setRegisterDate(String registrationDate) {
		this.registrationDate = registrationDate;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getProfilePic() {
		return profilePic;
	}
	public void setProfilePic(String profilePic) {
		this.profilePic = profilePic;
	}

	
	public boolean validateUserLogin() {
	    boolean flag = false;
	    DBConnection db = new DBConnection();
	    Connection conn = db.getConnection();

	    if (conn == null) {
	        flag = false;
	    } else {
	        try {
	            String qry = "select * from users where mobile=? and password=? ";
	            
	            
	            String mobileEncode=Cryptography.encode(this.mobile);
	            String passwordEncode=Cryptography.encode(this.password);
	            

	            PreparedStatement pst = conn.prepareStatement(qry);
	            pst.setString(1, mobileEncode);
	            pst.setString(2, passwordEncode);
	            ResultSet rs = pst.executeQuery();
	            
	            System.out.println("user:"+pst.toString());
	            if (rs.next()) {
	            	this.userId=rs.getInt("userId");
	                flag = true;
	                
	            } else {
	                flag = false;
	            }

	        } catch (Exception e) {
	            System.out.println("Error: " + e);
	           
	        }
	    }

	    return flag;
	}
	
	
	public int addUsers() {
		int n = 0;
		DBConnection db = new DBConnection();
		Connection conn = db.getConnection();

		if (conn == null) {
			n = 0;
		} else {
			try {
				String qry = "insert into users (fullName,registrationDate,mobile,password,profilePic)values(?,?,?,?,?)";
				PreparedStatement pst = conn.prepareStatement(qry);
				
				pst.setString(1, this.fullName);
				pst.setDate(2,Date.valueOf(LocalDate.now()));
				pst.setString(3, this.mobile);
				pst.setString(4, this.password);
				pst.setString(5, this.profilePic);
				
				System.out.println("user qry:"+pst.toString());
				n = pst.executeUpdate(); 
				
			} catch (Exception e) {
				System.out.println("Error:" + e);
				n = 0;
			}

		}
		return n;
	}
	
	
	public List<User> getAllUsers(){
		List<User> userList=new ArrayList<User>();
	
		try {
			DBConnection db = new DBConnection();
		    Connection conn = db.getConnection();
		    
		    String qry="select userId,fullName,registrationDate,mobile,profilePic from users order by userId";
		    Statement st=conn.createStatement();
		    
		    ResultSet rs=st.executeQuery(qry);
		    
		    System.out.println("list users:"+st.toString());
		   
		    while(rs.next()) {
		    	User user= new User();
		    	
		    	user.setUserId(rs.getInt("userId"));
		    	user.setFullName(rs.getString("fullName"));
		    	
		    	user.setMobile(rs.getString("mobile"));
		    	
		    	user.setProfilePic(rs.getString("profilePic"));
		    	
				
		    	userList.add(user);
		    }
		}catch(Exception e) {
			System.out.println("Error:getAllSWorkers..:" +e);
			
		}
		return userList;
	}
	
	public List<User> getUserById(int userId) {
		List<User> userList = new ArrayList<User>();

		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "select userId,fullName,mobile,password,profilePic from users where userId=?";

			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, userId);
			ResultSet rs = pst.executeQuery();
			System.out.println("qryy =" + pst.toString());

			while (rs.next()) {
				User user = new User();
				user.setUserId(rs.getInt("userId"));
				user.setFullName(rs.getString("fullName"));
				user.setMobile(rs.getString("mobile"));
				user.setPassword(rs.getString("password"));
				user.setProfilePic(rs.getString("profilePic"));
				
				userList.add(user);
			}

		} catch (Exception e) {
			System.out.println("Eroor at getmethod=" + e);

		}
		return userList;

	}
	
	public User getUserById() {
		User userRow =new User();
		try {
			DBConnection db=new DBConnection();
			Connection conn=db.getConnection();
			String qry="select userId,fullName,mobile,password from users where userId=?";
			PreparedStatement pst=conn.prepareStatement(qry);
			
			pst.setInt(1, this.userId);
			//System.out.println("qry111="+pst.toString());
			ResultSet rs=pst.executeQuery();
			
			if(rs.next()) {
				userRow.setUserId(rs.getInt("userId"));
				userRow.setFullName(rs.getString("fullName"));
			
				userRow.setMobile(rs.getString("mobile"));
				
				userRow.setPassword(rs.getString("password"));
				
			}else {
				userRow=null;
			}
			
		}catch(Exception e) {
			System.out.println("Error11: "+e);
		}
		return userRow;
		
	}
	
	
	
	public int UpdateUserById() {
	    int n = 0;
	    try {
	    DBConnection db = new DBConnection();
	    Connection conn = db.getConnection();

	       String qry = "update users set fullName=?,  mobile=?, password=? where userId=?";
	            PreparedStatement pst = conn.prepareStatement(qry);
	           
	            pst.setString(1, this.fullName);
	            
	            pst.setString(2, this.mobile);
	            
	            pst.setString(3, this.password);
	            pst.setInt(4, this.userId);
	            

	            n = pst.executeUpdate(); // Use executeUpdate for INSERT, UPDATE, DELETE

	        } catch (Exception e) {
	            n=0;
	        } 
	    return n; 
	}

	
}
