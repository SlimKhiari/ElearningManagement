<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Supprimer un(e) enseignant(e)</title>
</head>
<body>
	<%
		if(session.getAttribute("login") == null)
		{
			response.sendRedirect("login.jsp");
		}
	%>
	
	<a href="/ElearningManagement/adminMenuRedirection">Revenir au menu</a>
	
	<form method="post" action="professorDelete">
		<p>
		<label for="professorID">Numéro de l'enseignant(e) à supprimer </label>
		<input type="text" name="professorID" id="professorID" required="required"/>
		</p>
		<p>
		<input type="Submit"/>
		</p>
	</form>
</body>
</html>