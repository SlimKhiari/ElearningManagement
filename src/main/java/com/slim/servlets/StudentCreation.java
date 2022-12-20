package com.slim.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.slim.beans.Student;
import com.slim.db.Students;

public class StudentCreation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public StudentCreation() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Students studentsTable = new Students();
		request.setAttribute("students", studentsTable.getStudents());
		request.getRequestDispatcher("/StudentCreationForm.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Students studentsTable = new Students();
		
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
		
		studentsTable.addStudent(new_student_to_add);
		request.setAttribute("students", studentsTable.getStudents());

		request.getRequestDispatcher("/StudentCreationForm.jsp").forward(request, response);
	}

}
