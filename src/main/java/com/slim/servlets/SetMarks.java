package com.slim.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

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
		String subject=request.getParameter("subject");
		request.setAttribute("subject",subject);
		String studentID=request.getParameter("studentID");
		request.setAttribute("studentID",studentID);
		String mark=request.getParameter("mark");
		request.setAttribute("mark",mark);
		
		System.out.println(mark);
		System.out.println(studentID);
		
		if(mark.equals("") && !studentID.equals("")){
			DaoUser.deleteMarkFromDB(subject,studentID);
		}
		else if (mark.equals("") && studentID.equals(""))
		{
			System.out.print(DaoUser.getMarksFromDB(subject));
			request.setAttribute("studentsMarks", DaoUser.getMarksFromDB(subject));
		}
		else
		{
			DaoUser.saveMarkInDB(subject,studentID,mark);
		}
		request.getRequestDispatcher("/setMarks.jsp").forward(request, response);
	}

}
