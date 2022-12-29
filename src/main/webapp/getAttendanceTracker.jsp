<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mes abscences</title>
</head>
<body>
	<%
		if(session.getAttribute("login") == null)
		{
			response.sendRedirect("login.jsp");
		}
	%>
	
	<a href="/ElearningManagement/studentMenuRedirection">Revenir au menu</a>
	
	<c:forEach var="studentAttendance" items="${studentAttendance}">
		<li><c:out value="${studentAttendance.date}"/> :  <c:out value="${studentAttendance.subject}"/> - <c:out value="${studentAttendance.time}"/></li>
	</c:forEach>
</body>
</html>