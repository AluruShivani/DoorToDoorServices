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
import jakarta.servlet.ServletContext;

public class Workers implements Serializable{
	private int workerId;
	private String fullName;
	private String serviceName;
	private String mobile;
	private String currentAddress;
	private String cities;
	private String workerPic;
	private String aadhaarPic;
	private String registrationDate;
	private String password;
	private String status;
	
	public Workers() {
		super();
	}
	
	
	
	

	public Workers(int workerId, String fullName, String serviceName, String mobile, String currentAddress,
			String cities, String workerPic, String aadhaarPic, String registrationDate, String password,
			String status) {
		super();
		this.workerId = workerId;
		this.fullName = fullName;
		this.serviceName = serviceName;
		this.mobile = mobile;
		this.currentAddress = currentAddress;
		this.cities = cities;
		this.workerPic = workerPic;
		this.aadhaarPic = aadhaarPic;
		this.registrationDate = registrationDate;
		this.password = password;
		this.status = status;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getWorkerId() {
		return workerId;
	}
	
	public void setWorkerId(int workerId) {
		this.workerId = workerId;
	}
	
	public String getFullName() {
		return fullName;
	}
	
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	
	public String getServiceName() {
		return serviceName;
	}
	
	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}
	
	public String getMobile() {
		return mobile;
	}
	
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	public String getCurrentAddress() {
		return currentAddress;
	}
	
	public void setCurrentAddress(String currentAddress) {
		this.currentAddress = currentAddress;
	}
	
	public String getCities() {
		return cities;
	}
	
	public void setCities(String cities) {
		this.cities = cities;
	}
	
	public String getWorkerPic() {
		return workerPic;
	}
	
	public void setWorkerPic(String workerPic) {
		this.workerPic = workerPic;
	}
	
	public String getAadhaarPic() {
		return aadhaarPic;
	}
	
	public void setAadhaarPic(String aadhaarPic) {
		this.aadhaarPic = aadhaarPic;
	}
	
	public String getRegistrationDate() {
		return registrationDate;
	}


	public void setRegistrationDate(String registrationDate) {
		this.registrationDate = registrationDate;
	}

		public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int addWorkers() {
		int n = 0;
		DBConnection db = new DBConnection();
		Connection conn = db.getConnection();

		if (conn == null) {
			n = 0;
		} else {
			try {
				String qry = "insert into workers (fullName,registrationDate,serviceName,mobile,currentAddress,cities,workerPic,aadhaarPic,password,status)values(?,?,?,?,?,?,?,?,?,?)";
				PreparedStatement pst = conn.prepareStatement(qry);
				
				pst.setString(1, this.fullName);
				pst.setDate(2,Date.valueOf(LocalDate.now()));
				pst.setString(3, this.serviceName);
				pst.setString(4, this.mobile);
				pst.setString(5, this.currentAddress);
				pst.setString(6, this.cities);
				pst.setString(7, this.workerPic);
				pst.setString(8, this.aadhaarPic);
				pst.setString(9, this.password);
				pst.setString(10, this.status);
				
				System.out.println("worker qry:"+pst.toString());
				n = pst.executeUpdate(); 
				
			} catch (Exception e) {
				System.out.println("Error:" + e);
				n = 0;
			}

		}
		return n;
	}
	
	public boolean validateWorkerLogin() {
	    boolean flag = false;
	    DBConnection db = new DBConnection();
	    Connection conn = db.getConnection();

	    if (conn == null) {
	        flag = false;
	    } else {
	        try {
	            String qry = "select * from workers where mobile=? and password=? ";

	            //encript
	            String mobileEncode=Cryptography.encode(this.mobile);
	            String passwordEncode=Cryptography.encode(this.password);
	            
	            PreparedStatement pst = conn.prepareStatement(qry);
	            pst.setString(1, mobileEncode);
	            pst.setString(2, passwordEncode);
	            ResultSet rs = pst.executeQuery();
	            
	            System.out.println("worker:"+pst.toString());
	            if (rs.next()) {
	            	this.workerId=rs.getInt("workerId");

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

	
	public List<Workers> getAllWorkers(String search){
		List<Workers> workerList=new ArrayList<Workers>();
	
		try {
			DBConnection db = new DBConnection();
		    Connection conn = db.getConnection();
		    String qry = "";
	        if (search == null) {

		    qry="select workerId,fullName,serviceName,mobile,currentAddress,cities,workerPic,aadhaarPic,status from workers order by workerId";
	        } else {
	            search = search.toLowerCase();
	            String words[]= search.split(" ");
	            String columnNames[]= {"fullName", "serviceName", "mobile", "cities"};
	            qry = "select workerId, fullName,  serviceName, mobile, currentAddress,cities, workerPic, aadhaarPic,status  from workers where ";
	            
	            for(String word: words) {
	            	for(String colName: columnNames) {
	            		qry+="lower("+colName+")like '%" + word + "%' or ";
	            	}
	            }
	            qry=qry.substring(0,qry.length()-3);
	            qry+="order by serviceName, cities";
	            System.out.println("qry="+qry);
	        }
	        

		     
		    Statement st=conn.createStatement();
		    
		    ResultSet rs=st.executeQuery(qry);
		    
		    System.out.println("worker:"+st.toString());
		   
		    while(rs.next()) {
		    	String status=rs.getString("status");
		    	if(status.equalsIgnoreCase("active")) {
		    	Workers worker= new Workers();
		    	
		    	worker.setWorkerId(rs.getInt("workerId"));
		    	worker.setFullName(rs.getString("fullName"));
		    	worker.setServiceName(rs.getString("serviceName"));
		    	worker.setMobile(rs.getString("mobile"));
		    	worker.setCurrentAddress(rs.getString("currentAddress"));
		    	worker.setCities(rs.getString("cities"));
		    	worker.setWorkerPic(rs.getString("workerPic"));
		    	worker.setAadhaarPic(rs.getString("aadhaarPic"));
		    	worker.setStatus(rs.getString("status"));

				
		    	workerList.add(worker);
		    	}
		    }
		}catch(Exception e) {
			System.out.println("Error:getAllWorkers..:" +e);
			
		}
		return workerList;
	}
	
	public boolean deleteWorkerByCode() {
		boolean flag=false;
		try {
			DBConnection db = new DBConnection();
		    Connection conn = db.getConnection();
			
		    String qry="delete from workers where workerId=?";
		    PreparedStatement pst=conn.prepareStatement(qry);
		    pst.setInt(1,  this.workerId);
		    
		    int n=pst.executeUpdate();
		    
		    System.out.println("delete worker:"+pst.toString());
		    if(n==0) {
		    	flag=false;
		    }else {
		    	flag=true;
		    }
		}catch(Exception e){
			flag=false;
			
		}
		return flag;
	}

	

	
	
	public Workers getWorkerById(int workerId) {
	    Workers worker = null;
	    try {
	        DBConnection db = new DBConnection();
	        Connection conn = db.getConnection();
	        String qry = "SELECT * FROM workers WHERE workerId = ?";
	        PreparedStatement pst = conn.prepareStatement(qry);
	        pst.setInt(1, workerId);
	        ResultSet rs = pst.executeQuery();
	        if (rs.next()) {
	            worker = new Workers();
	            worker.setWorkerId(rs.getInt("workerId"));
	            worker.setFullName(rs.getString("fullName"));
	            worker.setServiceName(rs.getString("serviceName"));
	            worker.setMobile(rs.getString("mobile"));
	            worker.setCurrentAddress(rs.getString("currentAddress"));
	            worker.setCities(rs.getString("cities"));
	            worker.setWorkerPic(rs.getString("workerPic"));
	            worker.setAadhaarPic(rs.getString("aadhaarPic"));
	            worker.setRegistrationDate(rs.getString("registrationDate"));
	            worker.setPassword(rs.getString("password"));
	            worker.setStatus(rs.getString("status"));
	        }
	        conn.close();
	    } catch (Exception e) {
	        System.out.println("Error in getWorkerById: " + e);
	    }
	    return worker;
	}

	
	
	
	
	public int UpdateWorkerById() {
	    int n = 0;
	    try {
	    DBConnection db = new DBConnection();
	    Connection conn = db.getConnection();

	       String qry = "update workers set fullName=?, serviceName=?, mobile=?, currentAddress=?,cities=?,password=? where workerId=?";
	            PreparedStatement pst = conn.prepareStatement(qry);
	           
	            pst.setString(1, this.fullName);
	            pst.setString(2, this.serviceName);
	            pst.setString(3, this.mobile);
	            pst.setString(4, this.currentAddress);
	            pst.setString(5, this.cities);
	            pst.setString(6, this.password);
	            pst.setInt(7, this.workerId);
	            

	            n = pst.executeUpdate(); // Use executeUpdate for INSERT, UPDATE, DELETE

	        } catch (Exception e) {
	            n=0;
	        } 
	    return n; 
	}

	
	public Workers getWorkerByServiceName(String serviceName) {
	    Workers workerRow = new Workers();
	    try {
	        DBConnection db = new DBConnection();
	        Connection conn = db.getConnection();
	        String qry = "SELECT workerId, fullName, serviceName, mobile, cities,status FROM workers WHERE serviceName=?";
	        PreparedStatement pst = conn.prepareStatement(qry);

	        pst.setString(1, serviceName);
	        ResultSet rs = pst.executeQuery();

	        if (rs.next()) {
	            workerRow.setWorkerId(rs.getInt("workerId"));
	            workerRow.setFullName(rs.getString("fullName"));
	            workerRow.setServiceName(rs.getString("serviceName"));
	            workerRow.setMobile(rs.getString("mobile"));
	            workerRow.setCities(rs.getString("cities"));
	            workerRow.setStatus(rs.getString("status"));
	           

	        } else {
	            workerRow = null;
	        }

	    } catch (Exception e) {
	        System.out.println("Error: " + e);
	    }
	    return workerRow;
	}

	public int statusUpdate() {
		int n = 0;
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "update workers set status=? where workerId=?";
			PreparedStatement pst = conn.prepareStatement(qry);

			pst.setString(1, status);
			pst.setInt(2, workerId);

			n = pst.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error: " + e);
		}
		return n;
 
    		
    	}
	
	public List<Workers> getWorkersById(int workerId) {
	    List<Workers> workerList = new ArrayList<>();
	    try {
	        DBConnection db = new DBConnection();
	        Connection conn = db.getConnection();
	        String qry = "SELECT * FROM workers WHERE workerId = ?";
	        PreparedStatement pst = conn.prepareStatement(qry);
	        pst.setInt(1, workerId);
	        ResultSet rs = pst.executeQuery();
	        while (rs.next()) {
	            Workers worker = new Workers();
	            worker.setWorkerId(rs.getInt("workerId"));
	            worker.setFullName(rs.getString("fullName"));
	            worker.setServiceName(rs.getString("serviceName"));
	            worker.setMobile(rs.getString("mobile"));
	            worker.setCurrentAddress(rs.getString("currentAddress"));
	            worker.setCities(rs.getString("cities"));
	            worker.setWorkerPic(rs.getString("workerPic"));
	            worker.setAadhaarPic(rs.getString("aadhaarPic"));
	            worker.setRegistrationDate(rs.getString("registrationDate"));
	            worker.setPassword(rs.getString("password"));
	            worker.setStatus(rs.getString("status"));
	            workerList.add(worker);
	        }
	        conn.close();
	    } catch (Exception e) {
	        System.out.println("Error in getWorkersById: " + e);
	    }
	    return workerList;
	}

	



	

	
}