package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dbutil.Cryptography;
import dbutil.DBConnection;

public class Admin implements Serializable{
	private String username;
	private String password;
	
	
	public Admin() {
		super();
	}


	public Admin(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}
	
	
	
	public boolean validateAdminLogin() {
	    boolean flag = false;
	    DBConnection db = new DBConnection();
	    Connection conn = db.getConnection();

	    if (conn == null) {
	        flag = false;
	    } else {
	        try {
	            String qry = "select * from admin where username=? and password=? ";

	            PreparedStatement pst = conn.prepareStatement(qry);
	            
	            String usernameEncode=Cryptography.encode(this.username);
	            String passwordEncode=Cryptography.encode(this.password);
	            
	            pst.setString(1, usernameEncode);
	            pst.setString(2, passwordEncode);
	            ResultSet rs = pst.executeQuery();
	            
	            System.out.println("admin:"+pst.toString());
	            if (rs.next()) {
	            	
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
	
	

}
