<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mes informations</title>
</head>
<body>
	<%
		if(session.getAttribute("login") == null)
		{
			response.sendRedirect("Login.jsp");
		}
	%>
		
	<%
		if((session.getAttribute("status")).equals("Student"))
		{
	%>
	<jsp:include page="menuStudent.jsp" />
	<%
		}
	%>
	<%
		if((session.getAttribute("status")).equals("Professor"))
		{
	%>
	<jsp:include page="menuProfessor.jsp" />
	<%
		}
	%>
	<div style="margin-left:25%;padding:1px 16px;height:1000px;">
			<%
				if((session.getAttribute("status")).equals("Professor"))
				{
			%>
			<a href="/ElearningManagement/professorMenuRedirection">Revenir au menu</a>
			<%
				}
			%>
			<%
				if((session.getAttribute("status")).equals("Student"))
				{
			%>
			<a href="/ElearningManagement/studentMenuRedirection">Revenir au menu</a>
			<%
				}
			%>
			<form method="post" action="myAccount">
				<h3>Nom: </h3><input type="text" name="name" id="name" value="${name}"/> </br>
				<h3>Prénom: </h3><input type="text" name="lastname" id="lastname" value="${lastname}"/> </br>
				<h3>Date de naissance: </h3><input type="text" name="birthday" id="birthday" value="${birthday}"/> </br>
				<h3>Contact: </h3><input type="text" name="contact" id="contact" value="${contact}"/> </br>
				<h3>Section: </h3><input type="text" name="section" id="section" value="${section}"/> </br>
				<h3>Identifiant: </h3><input type="text" name="id" id="id" value="${id}"/> </br>
				<p>
					<label for="oldpassword">Ancien mot de passe </label>
					<input type="text" name="oldpassword" id="oldpassword" required="required"/> 
					<label for="newpassword">Nouveau mot de passe </label>
					<input type="text" name="newpassword" id="newpassword" required="required"/>
					<button type='submit'>Confirmer</button>
				</p>
			</form>
	</div>
</body>
</html>