package com.slim.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.slim.beans.Student;
import com.slim.dao.DaoFactory;
import com.slim.dao.DaoUser;

public class MyAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DaoUser DaoUser;
    
    public void init() throws ServletException {
        DaoFactory daoFactory = DaoFactory.getInstance();
        this.DaoUser = daoFactory.getDaoUser();
    }
       
    public MyAccount() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession( true ); 
		String studentID = request.getParameter("studentID");
		Student student = DaoUser.getStudentBystudentID(studentID);
		session.setAttribute("name", student.getName());
		session.setAttribute("lastname", student.getLastname());
		session.setAttribute("birthday", student.getBirthday());
		session.setAttribute("contact", student.getContact());
		session.setAttribute("section", student.getSection());
		session.setAttribute("id", student.getId());
		session.setAttribute("student", student);
		request.getRequestDispatcher("/myAccount.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String oldpassword = request.getParameter("oldpassword");
		String newpassword = request.getParameter("newpassword");
		HttpSession session = request.getSession( true ); 
		Student student = (Student) session.getAttribute("student");
		if(oldpassword.equals(student.getPassword()))
		{
			DaoUser.updateStudentPassword(newpassword, student.getId());

		}
		request.getRequestDispatcher("/myAccount.jsp").forward(request, response);
	}

}
