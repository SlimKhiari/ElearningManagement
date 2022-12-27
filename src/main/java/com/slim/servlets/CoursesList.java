package com.slim.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.slim.dao.DaoFactory;
import com.slim.dao.DaoUser;

public class CoursesList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DaoUser DaoUser;
    
    public void init() throws ServletException {
        DaoFactory daoFactory = DaoFactory.getInstance();
        this.DaoUser = daoFactory.getDaoUser();
    }
    
	public CoursesList() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String studentID=request.getParameter("studentID");
		String section = DaoUser.getSectionByStudentID(studentID);
		request.setAttribute("section",section);
		request.setAttribute("filesName", DaoUser.getFilesName(section));
    	request.getRequestDispatcher("/coursesList.jsp").forward(request, response); 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
