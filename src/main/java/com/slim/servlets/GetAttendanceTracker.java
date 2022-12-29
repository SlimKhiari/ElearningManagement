package com.slim.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.slim.dao.DaoFactory;
import com.slim.dao.DaoUser;

public class GetAttendanceTracker extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DaoUser DaoUser;
    
    public void init() throws ServletException {
        DaoFactory daoFactory = DaoFactory.getInstance();
        this.DaoUser = daoFactory.getDaoUser();
    }
    
    public GetAttendanceTracker() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession( true ); 
 		String studentID = (String) session.getAttribute("login");
		request.setAttribute("studentAttendance", DaoUser.getAttendanceFromDBByStudentID(studentID));
		request.getRequestDispatcher("/getAttendanceTracker.jsp").forward(request, response);
	}
}
