package com.slim.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class MessageToStudents extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MessageToStudents() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mail=request.getParameter("mail");
		request.setAttribute("mail",mail);
		request.getRequestDispatcher("/messageToStudents.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mail = request.getParameter("mail");
		request.setAttribute("id",mail);
		HttpSession session = request.getSession( true ); 
		session.setAttribute( "mail", mail);
		request.getRequestDispatcher("/messageToStudents.jsp").forward(request, response);
	}

}
