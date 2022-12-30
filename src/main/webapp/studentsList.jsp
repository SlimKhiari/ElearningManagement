<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Students registered</title>
</head>
<body>
	<%
		if(session.getAttribute("login") == null)
		{
			response.sendRedirect("login.jsp");
		}
	%>
	
	<a href="/ElearningManagement/adminMenuRedirection">Revenir au menu</a>

	<c:forEach var="student" items="${students}">
		<li><c:out value="${student.id}"/> | <c:out value="${student.name}"/> , <c:out value="${student.lastname}"/> , <c:out value="${student.section}"/> , <c:out value="${student.birthday}"/> , <c:out value="${student.contact}"/> , <c:out value="${student.password}"/></li>
	</c:forEach>
</body>
</html>