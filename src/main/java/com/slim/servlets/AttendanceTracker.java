package com.slim.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

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
		String delete =request.getParameter("delete");
		String promoID=request.getParameter("promoID");
		String subject=request.getParameter("subject");
		String time=request.getParameter("time");
		String date=request.getParameter("date");
		String studentID=request.getParameter("studentID");
		if (promoID != null && studentID != null && date != null && subject != null && time != null)
		{
			if(delete.equals("0"))
			{
				DaoUser.attendanceTracker(studentID, date, subject, time);
			}
			else if (delete.equals("1"))
			{
				DaoUser.attendanceTrackerCorrected(studentID, date, subject, time);
			}
		}
		request.setAttribute("studentsByID",DaoUser.getStudentsByPromoID(promoID));
		request.setAttribute("promoID",promoID);
		request.setAttribute("subject",subject);
		request.setAttribute("time",time);
		request.setAttribute("date",date);
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
