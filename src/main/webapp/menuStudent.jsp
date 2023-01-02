<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ISTY - Education</title>
</head>
<style>
body {
  margin: 0;
}

ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  width: 25%;
  background-color: #f1f1f1;
  position: fixed;
  height: 100%;
  overflow: auto;
}

li a {
  display: block;
  color: #000;
  padding: 8px 16px;
  text-decoration: none;
}

li a.active {
  background-color: #04AA6D;
  color: white;
}

li a:hover:not(.active) {
  background-color: #555;
  color: white;
}
</style>
<body>
	<ul>
		<img src="./files/isty.png" width="400" height="100">
		<li><h2><a href="/ElearningManagement/myAccount?studentID=${sessionScope.login}">Mon compte</a></h2></li>
		<li><h2><a href="/ElearningManagement/getMarks">Consulter mes notes</a></h2></li>
		<li><h2><a href="/ElearningManagement/getAttendanceTracker">Consulter mes abscences</a></h2></li>
		<li><h2><a href="/ElearningManagement/coursesList?studentID=${sessionScope.login}">Consulter mes cours</a></h2></li>
		<li><h2><a href="/ElearningManagement/abscenceJustification">Justifier une abscence</a></h2></li>
		<li><h2><a href="/ElearningManagement/login">Quitter mon espace</a></h2></li>
	</ul>
</body>
</html>