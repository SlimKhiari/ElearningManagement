package com.slim.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.slim.beans.Exam;
import com.slim.dao.DaoFactory;
import com.slim.dao.DaoUser;

public class SetMarks extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DaoUser DaoUser;
    
    public void init() throws ServletException {
        DaoFactory daoFactory = DaoFactory.getInstance();
        this.DaoUser = daoFactory.getDaoUser();
    }
       
	public SetMarks() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String subject=request.getParameter("subject");
		request.setAttribute("subject",subject);
		request.getRequestDispatcher("/setMarks.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Exam exam = new Exam();
		
		exam.setSubject(request.getParameter("subject"));
		request.setAttribute("mark",exam.getSubject());
		exam.setStudentID(request.getParameter("studentID"));
		request.setAttribute("mark",exam.getStudentID());
		exam.setMark(request.getParameter("mark"));
		request.setAttribute("mark",exam.getMark());
		
		if(exam.getMark().equals("") && !exam.getStudentID().equals("")){
			DaoUser.deleteMarkFromDB(exam.getSubject(),exam.getStudentID());
		}
		else if (exam.getMark().equals("") && exam.getStudentID().equals(""))
		{
			request.setAttribute("studentsMarks", DaoUser.getMarksFromDBBySubject(exam.getSubject()));
		}
		else
		{
	 		HttpSession session = request.getSession( true ); 
	 		session.setAttribute("subject", exam.getSubject());
			DaoUser.saveMarkInDB(exam);
		}
		request.getRequestDispatcher("/setMarks.jsp").forward(request, response);
	}

}
