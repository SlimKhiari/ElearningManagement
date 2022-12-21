<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajouter un(e) enseignant(e)</title>
</head>
<body>
	
	<a href="/ElearningManagement//adminMenuRedirection">Revenir au menu</a>
	
	<c:if test="${!empty sessionScope.login}">
	 <p>${sessionScope.login }, veuillez remplir ce formulaire afin de rajouter un(e) enseignant(e): </p>
	</c:if>
		
	<%
		if(session.getAttribute("login") == null)
		{
			response.sendRedirect("Login.jsp");
		}
	%>
	<form method="post" action="professorCreation">
		<p>
		<label for="name">Nom </label>
		<input type="text" name="name" id="name" required="required"/>
		</p>
		<p>
		<label for="lastnamename">Prénom </label>
		<input type="text" name="lastname" id="lastnamename" required="required"/>
		</p>
		<p>
		<label for="birthday">Date de naissance </label>
		<input type="date" name="birthday" id="birthday" required="required"/>
		</p>
		<p>
		<label for="contact">Numéro de téléphone </label>
		<input type="text" name="contact" id="contact" required="required"/>
		</p>
		<p>
		<label for="section">Spécialité </label>
		<input type="text" name="section" id="section" required="required"/>
		</p>
		<p>
		<label for="id">Numéro de professeur </label>
		<input type="text" name="id" id="id" required="required"/>
		</p>
		<input type="Submit"/>
	</form>
	
	<c:if test="${!empty name }"><p><c:out value="[${id} | ${name} ${lastname} , ${birthday} , ${contact} , ${section}] ajouté(e)."/></p></c:if>
	
</body>
</html>