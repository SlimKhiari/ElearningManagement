package com.slim.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.slim.beans.Professor;
import com.slim.dao.DaoFactory;
import com.slim.dao.DaoUser;

public class ProfessorCreation extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DaoUser DaoUser;
    
    public void init() throws ServletException {
        DaoFactory daoFactory = DaoFactory.getInstance();
        this.DaoUser = daoFactory.getDaoUser();
    }

	public ProfessorCreation() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/professorCreationForm.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Professor new_professor_to_add = new Professor();
		
		new_professor_to_add.setName(request.getParameter("name")); 
		request.setAttribute("name", new_professor_to_add.getName());
		new_professor_to_add.setLastname(request.getParameter("lastname"));
		request.setAttribute("lastname", new_professor_to_add.getLastname());
		new_professor_to_add.setBirthday(request.getParameter("birthday"));
		request.setAttribute("birthday", new_professor_to_add.getBirthday());
		new_professor_to_add.setContact(request.getParameter("contact"));
		request.setAttribute("contact",new_professor_to_add.getContact());
		new_professor_to_add.setSection(request.getParameter("section"));
		request.setAttribute("section",new_professor_to_add.getSection());
		new_professor_to_add.setId(request.getParameter("id"));
		request.setAttribute("id",new_professor_to_add.getId());
		new_professor_to_add.setPassword(request.getParameter("password")); 
		request.setAttribute("password", new_professor_to_add.getPassword());
		
		DaoUser.addProfessor(new_professor_to_add);

		request.getRequestDispatcher("/professorCreationForm.jsp").forward(request, response);
	}

}

