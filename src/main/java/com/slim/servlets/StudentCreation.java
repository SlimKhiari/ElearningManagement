package com.slim.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.slim.beans.Student;
import com.slim.dao.DaoFactory;
import com.slim.dao.DaoUser;

public class StudentCreation extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DaoUser DaoUser;
    
    public void init() throws ServletException {
        DaoFactory daoFactory = DaoFactory.getInstance();
        this.DaoUser = daoFactory.getDaoUser();
    }

	public StudentCreation() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/studentCreationForm.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Student new_student_to_add = new Student();
		new_student_to_add.setName(request.getParameter("name")); 
		request.setAttribute("name", new_student_to_add.getName());
		new_student_to_add.setLastname(request.getParameter("lastname"));
		request.setAttribute("lastname", new_student_to_add.getLastname());
		new_student_to_add.setBirthday(request.getParameter("birthday"));
		request.setAttribute("birthday", new_student_to_add.getBirthday());
		new_student_to_add.setContact(request.getParameter("contact"));
		request.setAttribute("contact",new_student_to_add.getContact());
		new_student_to_add.setSection(request.getParameter("section"));
		request.setAttribute("section",new_student_to_add.getSection());
		new_student_to_add.setId(request.getParameter("id"));
		request.setAttribute("id",new_student_to_add.getId());
		
		DaoUser.addStudent(new_student_to_add);
		
		request.getRequestDispatcher("/studentCreationForm.jsp").forward(request, response);
	}

}
