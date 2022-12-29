<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ISTY - Education</title>
</head>
<body>
	<h1>Bienvenu dans votre espace d'étudiant</h1>
	<ul>
		<li> <a href="/ElearningManagement/attendanceTracker">Voir mon emploi du temps</a></li>
		<li> <a href="/ElearningManagement/getMarks">Consulter mes notes</a></li>
		<li> <a href="/ElearningManagement/getAttendanceTracker">Consulter mes abscences</a></li>
		<li> <a href="/ElearningManagement/coursesList?studentID=${sessionScope.password}">Consulter mes cours</a></li>
		<li> <a href="/ElearningManagement/login">Quitter mon espace</a></li>
	</ul>
</body>
</html>