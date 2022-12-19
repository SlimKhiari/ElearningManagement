package com.slim.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.slim.beans.Student;

public class StudentCreation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public StudentCreation() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/StudentCreationForm.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Student new_student_to_add = new Student();
		new_student_to_add.name = request.getParameter("name");
		request.setAttribute("name", new_student_to_add.name);
		new_student_to_add.lastname = request.getParameter("lastname");
		request.setAttribute("lastname", new_student_to_add.lastname);
		new_student_to_add.birthday = request.getParameter("birthday");
		request.setAttribute("birthday", new_student_to_add.birthday);
		new_student_to_add.contact = request.getParameter("contact");
		request.setAttribute("contact",new_student_to_add.contact);
		new_student_to_add.section = request.getParameter("section");
		request.setAttribute("section",new_student_to_add.section);
		new_student_to_add.id = request.getParameter("id");
		request.setAttribute("id",new_student_to_add.id);
		request.getRequestDispatcher("/StudentCreationForm.jsp").forward(request, response);
	}

}
