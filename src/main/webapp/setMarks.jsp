<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Les notes des étudiants</title>
</head>
<body>
	<%
		if(session.getAttribute("login") == null)
		{
			response.sendRedirect("login.jsp");
		}
	%>
	
	<a href="/ElearningManagement/professorMenuRedirection">Revenir au menu</a>
	
	<form method="post" action="setMarks">
		<p>
			<label for="subject">Le nom du module </label>
			<input type="text" name="subject" id="subject" required="required" value="${subject}"/>
		</p>
		<p>
			<label for="studentID">Numéro de l'étudiant </label>
			<input type="text" name="studentID" id="studentID"/>
		</p>
		<p>
			<label for="mark">Note </label>
			<input type="text" name="mark" id="mark"/>
		</p>
			<button type='submit'> Envoyer la note</button>
			<button type='submit'> Supprimer la note</button>
			<button type='submit'> Afficher les notes</button>			
	</form>
	
	<c:forEach var="studentMark" items="${studentsMarks}">
		<li><c:out value="${studentMark}"/></li>
	</c:forEach>

</body>
</html>