package com.slim.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.time.LocalDate; // import the LocalDate class

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;


@WebServlet(name = "UploadServlet", urlPatterns = { "/uploadServlet" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
maxFileSize = 1024 * 1024 * 1000, // 1 GB
maxRequestSize = 1024 * 1024 * 1000)   	// 1 GB

public class AbscenceJustification extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PrintWriter out = null;
	HttpSession session = null;

    public AbscenceJustification() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/abscenceJustification.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/plain;charset=UTF-8");
		try 
		{
		    out = response.getWriter();
		    String folderName = null;
	    	folderName="justificatif";
		    String uploadPath = request.getServletContext().getRealPath("") + folderName;
		    System.out.println(uploadPath);
		    File dir = new File(uploadPath);
		    if (!dir.exists()) {
		        dir.mkdirs();
		    }
		    Part filePart = request.getPart("file");
		    LocalDate date = LocalDate.now(); 
		    session = request.getSession( true );
		    String fileName = session.getAttribute("login").toString()+"_"+date.toString()+"_"+filePart.getSubmittedFileName();
		    InputStream is = filePart.getInputStream();
		    Files.copy(is, Paths.get(uploadPath + File.separator + fileName), StandardCopyOption.REPLACE_EXISTING);
			request.getRequestDispatcher("/abscenceJustification.jsp").forward(request, response);
		} catch (IOException | ServletException e)
		{
		    out.println("Exception: " + e);
			System.out.println("Exception2: " + e);
		}	
		request.getRequestDispatcher("/abscenceJustification.jsp").forward(request, response);
	}

}
