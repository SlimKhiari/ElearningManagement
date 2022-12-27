package com.slim.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import com.slim.dao.DaoFactory;
import com.slim.dao.DaoUser;

@WebServlet(name = "UploadServlet", urlPatterns = { "/uploadServlet" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
maxFileSize = 1024 * 1024 * 1000, // 1 GB
maxRequestSize = 1024 * 1024 * 1000)   	// 1 GB

public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PrintWriter out = null;
	HttpSession session = null;
	private DaoUser DaoUser;
    
    public void init() throws ServletException {
        DaoFactory daoFactory = DaoFactory.getInstance();
        this.DaoUser = daoFactory.getDaoUser();
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.getRequestDispatcher("/uploadFiles.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/plain;charset=UTF-8");
		try 
		{
		    out = response.getWriter();
		    String section = request.getParameter("section");
			String subject = request.getParameter("subject");
		    String folderName = null;
		    if(section.equals("iatic 3"))
		    {
		    	folderName="iatic_3";
		    }
		    else if(section.equals("iatic 4"))
		    {
		    	folderName="iatic_4";
		    }
		    else if(section.equals("iatic 5"))
		    {
		    	folderName="iatic_5";
		    }
		    String uploadPath = request.getServletContext().getRealPath("") + folderName;
		    System.out.println(uploadPath);
		    File dir = new File(uploadPath);
		    if (!dir.exists()) {
		        dir.mkdirs();
		    }
		    Part filePart = request.getPart("file");
		    String fileName = filePart.getSubmittedFileName();
		    InputStream is = filePart.getInputStream();
		    Files.copy(is, Paths.get(uploadPath + File.separator + fileName), StandardCopyOption.REPLACE_EXISTING);
		    session = request.getSession( true );
		    session.setAttribute("fileName", fileName);
		    session.setAttribute("section", section);
		    DaoUser.saveFilesName(fileName, section);
			request.setAttribute("filesName", DaoUser.getFilesName(section));
			request.getRequestDispatcher("/uploadFiles.jsp").forward(request, response); 
		} catch (IOException | ServletException e)
		{
		    out.println("Exception: " + e);
			System.out.println("Exception2: " + e);
		}
	}
}
