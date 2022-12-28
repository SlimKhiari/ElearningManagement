<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mes notes</title>
</head>
<body>
	
	<%
		if(session.getAttribute("login") == null)
		{
			response.sendRedirect("login.jsp");
		}
	%>
	
	<a href="/ElearningManagement/studentMenuRedirection">Revenir au menu</a>
	
	<c:forEach var="studentMark" items="${studentMarks}">
		<li><c:out value="${studentMark.subject}"/> :  <c:out value="${studentMark.mark}"/></li>
	</c:forEach>
</body>
</html>