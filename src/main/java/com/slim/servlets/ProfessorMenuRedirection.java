package com.slim.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ProfessorMenuRedirection extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ProfessorMenuRedirection() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/menuProfessor.jsp").forward(request, response);
	}
}

