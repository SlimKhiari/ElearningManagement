package com.slim.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.slim.dao.DaoFactory;
import com.slim.dao.DaoUser;

public class ProfessorDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DaoUser DaoUser;
    
    public void init() throws ServletException {
        DaoFactory daoFactory = DaoFactory.getInstance();
        this.DaoUser = daoFactory.getDaoUser();
    }
    
    public ProfessorDelete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/professorDeleteForm.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String professorID = request.getParameter("professorID");
		request.setAttribute("id",professorID);
		DaoUser.deleteProfessor(professorID);
		request.getRequestDispatcher("/professorDeleteForm.jsp").forward(request, response);
	}

}
