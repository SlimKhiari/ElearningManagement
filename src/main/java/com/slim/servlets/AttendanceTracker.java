package com.slim.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.slim.beans.Course;
import com.slim.dao.DaoFactory;
import com.slim.dao.DaoUser;

public class AttendanceTracker extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DaoUser DaoUser;
    
    public void init() throws ServletException {
        DaoFactory daoFactory = DaoFactory.getInstance();
        this.DaoUser = daoFactory.getDaoUser();
    }
       
    public AttendanceTracker() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Course course = new Course();
		
		course.setSubject(request.getParameter("subject"));
		course.setSubject(request.getParameter("date"));
		course.setSubject(request.getParameter("time"));
		course.setSubject(request.getParameter("studentID"));
		
		String delete =request.getParameter("delete");
		String promoID=request.getParameter("promoID");
		
		if (promoID != null && course.getStudentID() != null && course.getDate() != null && course.getSubject() != null && course.getTime() != null)
		{
			if(delete.equals("0"))
			{
				DaoUser.attendanceTracker(course);
			}
			else if (delete.equals("1"))
			{
				DaoUser.attendanceTrackerCorrected(course);
			}
		}
		request.setAttribute("studentsByID",DaoUser.getStudentsByPromoID(promoID));
		request.setAttribute("promoID",promoID);
		request.setAttribute("subject",course.getSubject());
		request.setAttribute("time",course.getTime());
		request.setAttribute("date",course.getDate());
		request.getRequestDispatcher("/attendanceTrackerForm.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String promoID=request.getParameter("promoID");
		String subject=request.getParameter("subject");
		String time=request.getParameter("time");
		String date=request.getParameter("date");
		request.setAttribute("studentsByID",DaoUser.getStudentsByPromoID(promoID));
		request.setAttribute("promoID",promoID);
		request.setAttribute("subject",subject);
		request.setAttribute("time",time);
		request.setAttribute("date",date);
		request.getRequestDispatcher("/attendanceTrackerForm.jsp").forward(request, response);
	}
}
