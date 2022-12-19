package com.slim.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class StudentCreation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public StudentCreation() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/StudentCreationForm.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		request.setAttribute("name", name);
		String lastname = request.getParameter("lastname");
		request.setAttribute("lastname", lastname);
		request.getRequestDispatcher("/StudentCreationForm.jsp").forward(request, response);
	}

}
