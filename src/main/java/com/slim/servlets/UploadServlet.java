package com.slim.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.IOException;

@WebServlet(name = "UploadServlet", urlPatterns = { "/uploadServlet" })
@MultipartConfig(
  fileSizeThreshold = 1024 * 1024 * 1, // 1 Mb
  maxFileSize = 1024 * 1024 * 10,      // 10 Mb
  maxRequestSize = 1024 * 1024 * 100   // 100 Mb
)
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/uploadFiles.jsp").forward(request, response);
	}
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Part filePart = request.getPart("file");
        String fileName = filePart.getSubmittedFileName();
        for (Part part : request.getParts()) {
          part.write("C:\\uploads\\" + fileName);
        }
		request.getRequestDispatcher("/uploadFiles.jsp").forward(request, response);
    }
}
