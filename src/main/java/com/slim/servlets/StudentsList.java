package com.slim.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.slim.db.Students;

public class StudentsList extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public StudentsList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Students studentsTable = new Students();
		request.setAttribute("students", studentsTable.getStudents());
		request.getRequestDispatcher("/StudentsList.jsp").forward(request, response);
	}

}
