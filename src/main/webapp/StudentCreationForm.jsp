<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajouter un(e) étudiant(e)</title>
</head>
<body>

	<c:if test="${!empty sessionScope.login}">
	 <p>Bienvenue dans votre espace ${sessionScope.status} , ${sessionScope.login }.</p>
	</c:if>
	<c:if test="${!empty name }"><p><c:out value="${name } ${lastname } enregistré."/></p></c:if>
	
	<%
		if(session.getAttribute("login") == null)
		{
			response.sendRedirect("Login.jsp");
		}
	%>
	<form method="post" action="studentCreation">
		<label for="name">Nom </label>
		<input type="text" name="name" id="name"/>
		<label for="lastnamename">Prénom </label>
		<input type="text" name="lastname" id="lastnamename"/>
		<input type="Submit"/>
	</form>
</body>
</html>