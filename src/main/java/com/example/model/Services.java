package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dbutil.DBConnection;

public class Services implements Serializable{
	private String serviceName;
	private int serviceId;
	private String servicePic;
	public Services() {
		super();
	}
	public Services(String serviceName, int serviceId, String servicePic) {
		super();
		this.serviceName = serviceName;
		this.serviceId = serviceId;
		this.servicePic = servicePic;
	}
	public String getServiceName() {
		return serviceName;
	}
	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}
	public int getServiceId() {
		return serviceId;
	}
	public void setServiceId(int serviceId) {
		this.serviceId = serviceId;
	}
	public String getServicePic() {
		return servicePic;
	}
	public void setServicePic(String servicePic) {
		this.servicePic = servicePic;
	}
	
	
	
	public int addServices() {
		int n = 0;
		DBConnection db = new DBConnection();
		Connection conn = db.getConnection();

		if (conn == null) {
			n = 0;
		} else {
			try {
				String qry = "insert into services (serviceName,servicePic)values(?,?)";
				PreparedStatement pst = conn.prepareStatement(qry);
				
				pst.setString(1, this.serviceName);
				pst.setString(2, this.servicePic);
				System.out.println("emp qry:"+pst.toString());
				n = pst.executeUpdate(); 
				System.out.println("add service qry:"+pst.toString());
			} catch (Exception e) {
				System.out.println("Error11111:" + e);
				n = 0;
			}

		}
		return n;
	}
	
	public Services getSerivceById() {
		Services service =new Services();
		try {
			DBConnection db=new DBConnection();
			Connection conn=db.getConnection();
			String qry="select serviceName,servicePic from services where serviceId=?";
			
			//System.out.println("Updating employeeId: " + this.employeeId);
			//System.out.println("New first name: " + this.firstName);
			//System.out.println("New last name: " + this.lastName);

			PreparedStatement pst=conn.prepareStatement(qry);
			System.out.println("qry="+qry);
			pst.setInt(1, this.serviceId);
			ResultSet rs=pst.executeQuery();
			
			if(rs.next()) {
				service.setServiceId(rs.getInt("serviceId"));
				service.setServiceName(rs.getString("servicName"));
				service.setServicePic(rs.getString("servicePic"));
				
			}else {
				service=null;
			}
			
		}catch(Exception e) {
			System.out.println("Error: "+e);
		}
		return service;
	}

	
	public List<Services> getAllService(){
		List<Services> serviceList=new ArrayList<Services>();
	
		try {
			DBConnection db = new DBConnection();
		    Connection conn = db.getConnection();
		    
		    String qry="select serviceId,serviceName,servicePic from services order by serviceId";
		    Statement st=conn.createStatement();
		    
		    ResultSet rs=st.executeQuery(qry);
		    
		    System.out.println("view service:"+st.toString());
		   
		    while(rs.next()) {
		    	Services service= new Services();
		    	
		    	service.setServiceId(rs.getInt("serviceId"));
		    	service.setServiceName(rs.getString("serviceName"));
		    	service.setServicePic(rs.getString("servicePic"));
				

				
		    	serviceList.add(service);
		    }
		}catch(Exception e) {
			System.out.println("Error:getAllEmployees..:" +e);
			
		}
		return serviceList;
	}
	
	public List<String> getAllServicesByName() {
		List<String> serviceList = new ArrayList<String>();
		int n = 0;

		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "SELECT  serviceName FROM services ORDER BY serviceName";
			Statement st = conn.createStatement();

			ResultSet rs = st.executeQuery(qry);

			// You might want to process the ResultSet here
			while (rs.next()) {
				
				serviceList.add(rs.getString("serviceName"));
				
			}

		} catch (Exception e) {
			e.printStackTrace(); // Handle the exception properly, e.g., log it
		}

		return serviceList;
	}
	
	 public static boolean deleteService(int serviceId) {
	        boolean deleted = false;
	        try {
	            DBConnection db = new DBConnection();
	            Connection conn = db.getConnection();

	            String query = "DELETE FROM services WHERE serviceId=?";
	            PreparedStatement pst = conn.prepareStatement(query);
	            
	            System.out.println("qry="+pst.toString());
	            pst.setInt(1, serviceId);

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
	 
	 
	 public static Services getServiceById(int serviceId) {
	        Services service = null;
	        try {
	            DBConnection db = new DBConnection();
	            Connection conn = db.getConnection();

	            String query = "SELECT * FROM services WHERE serviceId=?";
	            PreparedStatement pst = conn.prepareStatement(query);
	            pst.setInt(1, serviceId);
	            ResultSet rs = pst.executeQuery();

	            if (rs.next()) {
	                service = new Services();
	                service.setServiceId(rs.getInt("serviceId"));
	                service.setServiceName(rs.getString("serviceName"));
	                // Set other attributes if needed
	            }
	            conn.close();
	        } catch (Exception e) {
	            System.out.println("Error: " + e);
	        }
	        return service;
	    }
	
	 public int updateService(int serviceId, String serviceName) {
	        int rowsAffected = 0;
	        try {
	            DBConnection db = new DBConnection();
	            Connection conn = db.getConnection();

	            String query = "UPDATE services SET  serviceName=? WHERE serviceId=?";
	            PreparedStatement pst = conn.prepareStatement(query);
	            pst.setString(1, serviceName);
	            pst.setInt(2, serviceId);

	            rowsAffected = pst.executeUpdate();
	            conn.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	            // Handle the exception appropriately
	        }
	        return rowsAffected;
	    }
	

}
