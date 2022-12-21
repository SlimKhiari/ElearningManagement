<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Professors registered</title>
</head>
<body>
	<%
		if(session.getAttribute("login") == null)
		{
			response.sendRedirect("login.jsp");
		}
	%>
	
	<a href="/ElearningManagement/adminMenuRedirection">Revenir au menu</a>

	<c:forEach var="professor" items="${professors}">
		<li><c:out value="${professor.id}"/> | <c:out value="${professor.name}"/> , <c:out value="${professor.lastname}"/> , <c:out value="${professor.section}"/> , <c:out value="${professor.birthday}"/> , <c:out value="${professor.contact}"/></li>
	</c:forEach>
</body>
</html>