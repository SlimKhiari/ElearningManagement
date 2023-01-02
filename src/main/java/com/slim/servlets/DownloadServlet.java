package com.slim.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

@WebServlet(name = "DownloadServlet", urlPatterns = {"/downloadServlet"})
public class DownloadServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public static int BUFFER_SIZE = 1024 * 100;
    public static String UPLOAD_DIR = null;
    public static String fileName = null;
    public static String section = null;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        /**
         * *** Get The Absolute Path Of The File To Be Downloaded ****
         */
        fileName = request.getParameter("fileName");
        section = request.getParameter("section");
        if(section.equals("iatic 3"))
	    {
        	UPLOAD_DIR="iatic_3";
	    }
	    else if(section.equals("iatic 4"))
	    {
	    	UPLOAD_DIR="iatic_4";
	    }
	    else if(section.equals("iatic 5"))
	    {
	    	UPLOAD_DIR="iatic_5";
	    }
	    else
	    {
	    	UPLOAD_DIR="justificatif";
	    }

        if (fileName == null || fileName.equals("")) {
        	/**
             * *** Set Response Content Type ****
             */
            response.setContentType("text/html");

            /**
             * *** Print The Response ****
             */
            response.getWriter().println("<h3>File " + fileName + " Is Not Present .....!</h3>");
        } else {
            String applicationPath = getServletContext().getRealPath("");
            String downloadPath = applicationPath + File.separator + UPLOAD_DIR;
            System.out.println(downloadPath);
            String filePath = downloadPath + File.separator + fileName;
            System.out.println(fileName);
            System.out.println(filePath);
            System.out.println("fileName:" + fileName);
            System.out.println("filePath :" + filePath);
            File file = new File(filePath);
            OutputStream outStream = null;
            FileInputStream inputStream = null;

            if (file.exists()) {

                /**
                 * ** Setting The Content Attributes For The Response Object
                 * ***
                 */
                String mimeType = "application/octet-stream";
                response.setContentType(mimeType);

                /**
                 * ** Setting The Headers For The Response Object ***
                 */
                String headerKey = "Content-Disposition";
                String headerValue = String.format("attachment; filename=\"%s\"", file.getName());
                response.setHeader(headerKey, headerValue);

                try {

                    /**
                     * ** Get The Output Stream Of The Response ***
                     */
                    outStream = response.getOutputStream();
                    inputStream = new FileInputStream(file);
                    byte[] buffer = new byte[BUFFER_SIZE];
                    int bytesRead = -1;

                    /**
                     * ** Write Each Byte Of Data Read From The Input Stream
                     * Write Each Byte Of Data Read From The Input Stream Into
                     * The Output Stream ***
                     */
                    while ((bytesRead = inputStream.read(buffer)) != -1) {
                        outStream.write(buffer, 0, bytesRead);
                    }
                } catch (IOException ioExObj) {
                    System.out.println("Exception While Performing The I/O Operation?= " + ioExObj.getMessage());
                } finally {
                    if (inputStream != null) {
                        inputStream.close();
                    }

                    outStream.flush();
                    if (outStream != null) {
                        outStream.close();
                    }
                }
            } else {

                /**
                 * *** Set Response Content Type ****
                 */
                response.setContentType("text/html");

                /**
                 * *** Print The Response ****
                 */
                response.getWriter().println("<h3>File " + fileName + " Is Not Present .....!</h3>");
            }

        }
    }

}
