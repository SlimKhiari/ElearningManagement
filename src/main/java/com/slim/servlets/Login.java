package com.slim.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.slim.dao.DaoFactory;
import com.slim.dao.DaoUser;

public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DaoUser DaoUser;
    
    public void init() throws ServletException {
        DaoFactory daoFactory = DaoFactory.getInstance();
        this.DaoUser = daoFactory.getDaoUser();
    }
     
    public Login() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String login=request.getParameter("txtLogin");
		String password=request.getParameter("txtPassword");
		String status=request.getParameter("txtStatus");
		
		HttpSession session = request.getSession( true );  
		 
		session.setAttribute("login", login);
		session.setAttribute("password", password);
		session.setAttribute("status", status);
		
 		request.getRequestDispatcher("/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String login=request.getParameter("txtLogin");
		String password=request.getParameter("txtPassword");
		String status=request.getParameter("txtStatus");

		HttpSession session = request.getSession( true ); 
				
		if(login.equals("isty") && password.equals("isty") && status.equals("Administration"))
		{
			session.setAttribute( "login", login);
			session.setAttribute("password", password);
			session.setAttribute("status", status);
			request.getRequestDispatcher("/menuAdmin.jsp").forward(request, response);
		}
		else if((DaoUser.isInDB(login, password, 0) == true) && status.equals("Professor"))
		{
			session.setAttribute( "login", login);
			session.setAttribute("password", password);
			session.setAttribute("status", status);
			request.getRequestDispatcher("/menuProfessor.jsp").forward(request, response);
		}
		else if((DaoUser.isInDB(login, password, 1) == true) && status.equals("Student"))
		{
			session.setAttribute( "login", login);
			session.setAttribute("password", password);
			session.setAttribute("status", status);
			request.getRequestDispatcher("/menuStudent.jsp").forward(request, response);
		}
		else
		{	
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
	}
}
