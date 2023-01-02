package com.slim.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.slim.beans.Course;
import com.slim.dao.DaoFactory;
import com.slim.dao.DaoUser;

public class AttendanceTrackerStudents extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DaoUser DaoUser;
    
    public void init() throws ServletException {
        DaoFactory daoFactory = DaoFactory.getInstance();
        this.DaoUser = daoFactory.getDaoUser();
    }
  
    public AttendanceTrackerStudents() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("studentsAttendance", DaoUser.getAttendanceFromDB());
		request.getRequestDispatcher("/attendanceTrackerStudents.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String studentID=request.getParameter("studentID");
		String time=request.getParameter("time");
		String date=request.getParameter("date");
		String subject=request.getParameter("subject");
		Course course = new Course();
		course.setDate(date); course.setStudentID(studentID); course.setSubject(subject); course.setTime(time);
		DaoUser.attendanceTrackerCorrected(course);
		request.setAttribute("studentsAttendance", DaoUser.getAttendanceFromDB());
		request.getRequestDispatcher("/attendanceTrackerStudents.jsp").forward(request, response);
	}
}

