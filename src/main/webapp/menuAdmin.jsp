<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
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
</head>
<body>
	<ul>
 		<img src="./files/isty.png" width="400" height="100">
 		<li><h2><a href="/ElearningManagement/studentsList">Liste des étudiants inscrits</a></h2></li>
 		<li><h2><a href="/ElearningManagement/studentCreation">Inscrire un(e) étudiant(e)</a></h2></li>
 		<li><h2><a href="/ElearningManagement/studentDelete">Supprimer un(e) étudiant(e)</a></h2></li>
 		<li><h2><a href="/ElearningManagement/professorsList">Liste des professeurs inscrits</a></h2></li>
 		<li><h2><a href="/ElearningManagement/professorCreation">Inscrire un(e) enseignant(e)</a></h2></li>
 		<li><h2><a href="/ElearningManagement/professorDelete">Supprimer un(e) enseignant(e)</a></h2></li>
 		<li><h2><a href="/ElearningManagement/attendanceTrackerStudents">Voir les abscences des étudiants</a></h2></li>
		<li><h2><a href="/ElearningManagement/login">Quitter mon espace</a></li>
	</ul>
</body>
</html>