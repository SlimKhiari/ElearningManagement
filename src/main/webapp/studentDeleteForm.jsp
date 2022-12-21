<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Supprimer un(e) étudiant(e)</title>
</head>
<body>
	<%
		if(session.getAttribute("login") == null)
		{
			response.sendRedirect("login.jsp");
		}
	%>
	
	<a href="/ElearningManagement/adminMenuRedirection">Revenir au menu</a>
	
	<form method="post" action="studentDelete">
		<p>
		<label for="studentID">Numéro de l'étudiant à supprimer </label>
		<input type="text" name="studentID" id="studentID" required="required"/>
		</p>
		<p>
		<input type="Submit"/>
		</p>
	</form>
</body>
</html>