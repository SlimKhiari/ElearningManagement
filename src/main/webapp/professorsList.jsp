<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Students registered</title>
</head>
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
</style>
<body>
	<%
		if(session.getAttribute("login") == null)
		{
			response.sendRedirect("login.jsp");
		}
	%>
	<jsp:include page="menuAdmin.jsp" />
	
	<div class="container" style="margin-left:25%;padding:1px 16px;height:1000px;">
		<h1>Liste des professeurs inscrits</h1>
		<div>     
		  <table>
		    <thead>
		      <tr>
		        <th>Identifiant</th>
		        <th>Nom</th>
		        <th>Prénom</th>
		        <th>Contact</th>
		        <th>Date de naissance</th>
		        <th>Section</th>
		        <th>Mot de passe</th>
		      </tr>
		    </thead>
		    <tbody>
		    <c:forEach var="professor" items="${professors}">
				<tr>
					<td>${professor.id}</td>
			        <td>${professor.name}</td>
			        <td>${professor.lastname}</td>
			        <td>${professor.contact}</td>
			        <td>${professor.birthday}</td>
			        <td>${professor.section}</td>
			        <td>${professor.password}</td>
		      </tr>
			</c:forEach>
		    </tbody>
		  </table>
		</div>
	</div>
</body>
</html>