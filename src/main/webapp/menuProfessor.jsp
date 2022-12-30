<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ISTY - Enseignement</title>
</head>
<body>
	<h1>Bienvenu dans votre espace de professeur</h1>
	<ul>
		<li> <a href="/ElearningManagement/myAccount?professorID=${sessionScope.login}">Mon compte</a></li>
		<li> <a href="/ElearningManagement/attendanceTracker">Faire l'appel des étudiants</a></li>
		<li> <a href="/ElearningManagement/setMarks">Saisir les notes des étudiants</a></li>
		<li> <a href="/ElearningManagement/messageToStudents">Diffuser un message aux étudiants</a></li>
		<li> <a href="/ElearningManagement/uploadServlet">Envoyer un fichier aux étudiants</a></li>
		<li> <a href="/ElearningManagement/login">Quitter mon espace</a></li>
	</ul>
</body>
</html>