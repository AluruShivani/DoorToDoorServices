package com.example.controller.worker;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.util.Calendar;

import com.example.model.Workers;

import dbutil.Cryptography;

@WebServlet("/AddWorker")
@MultipartConfig
public class AddWorker extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		Calendar c = Calendar.getInstance();
		// Assuming 'c' is a Calendar instance
		String registrationDate = c.get(Calendar.YEAR) + "/" + (c.get(Calendar.MONTH) + 1) + "/"
			+ c.get(Calendar.DAY_OF_MONTH);
		
		String fullName = request.getParameter("fullName");
		String serviceName = request.getParameter("serviceName");
		String mobile = request.getParameter("mobile");
		String currentAddress = request.getParameter("currentAddress");
		String cities = request.getParameter("cities");
		Part workerPic = request.getPart("workerPic");
		Part aadhaarPic = request.getPart("aadhaarPic");
		String password = request.getParameter("password");
		
		ServletContext sc = getServletContext();
		String path = sc.getRealPath("/");
		System.out.println("path = " + path);

		/*String str = path.substring(0, path.indexOf(".metadata") - 1);
		System.out.println("str = " + str);

// get application name
		String appName = path.substring(path.lastIndexOf("\\", path.length() - 2));
		System.out.println("appName = " + appName);

// Concatenate root directory with application name
		String uploadDirectory = str + appName + "\\src\\main\\webapp\\uploads";*/
		String uploadDirectory = path +"/uploads";
		System.out.println("uploadDirectory :" + uploadDirectory);

		Path uploadPath = Path.of(uploadDirectory);
		
		// Create the directory if it doesnt't exist
		if (!Files.exists(uploadPath)) {
			Files.createDirectories(uploadPath);
			System.out.println("directory Created");
		} else {
			System.out.println("directory not Created");
		}

	/////// upload Image1////////////////////
					//////////////////////////////

					// Get the input stream of the uploaded file
					InputStream inputStream1 = workerPic.getInputStream();

					// Generate the unique filename or use the original file name
					String fileName1 = System.currentTimeMillis() + "_" + workerPic.getSubmittedFileName();

					// Save file to the server
					Path filePath1 = uploadPath.resolve(fileName1);
					Files.copy(inputStream1, filePath1, StandardCopyOption.REPLACE_EXISTING);

					
					
					
				/////// upload Image2////////////////////
								//////////////////////////////

								// Get the input stream of the uploaded file
								InputStream inputStream2 = aadhaarPic.getInputStream();

								// Generate the unique filename or use the original file name
								String fileName2 = System.currentTimeMillis() + "_" + aadhaarPic.getSubmittedFileName();

								// Save file to the server
								Path filePath2 = uploadPath.resolve(fileName1);
								Files.copy(inputStream2, filePath2, StandardCopyOption.REPLACE_EXISTING);

								
			String encodedMobile = Cryptography.encode(mobile);
			String encodedPassword = Cryptography.encode(password);

		// use model to insert
		Workers worker = new Workers();// creating the object
		worker.setFullName(fullName);// setting the parameters
		worker.setServiceName (serviceName);
		worker.setMobile(encodedMobile);
		worker.setCurrentAddress(currentAddress); // Set the description parameter
		worker.setCities(cities);
		worker.setPassword(encodedPassword);
		//customer.setRegisterDate(today);
		worker.setWorkerPic(fileName1);
		worker.setAadhaarPic(fileName1);
		//customer


		int n = worker.addWorkers();

		if (n == 1) {
			//response.sendRedirect("/EcommereceProject/admin/CustomerLogin.jsp?res=0"); // OR
			response.sendRedirect("workerlogin.jsp?res="+n);
			out.close();																			// response.sendRedirect("/Admin/addcategory.jsp?res="+n);
		} else {
			// response.sendRedirect("/EcommereceProject/admin/AddCategory.jsp?res=1");
			
			out.println(
					"<script language='javascript'>alert('Fill all the required feilds properly');window.location='/DoorToDoorServices/worker/newregistration.jsp?res=0';</script>");

		}
		out.close();
	}
		
	}


