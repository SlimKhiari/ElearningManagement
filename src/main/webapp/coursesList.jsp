<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Les ressources pédagogiques</title>
</head>
<body>
		
	<%
		if(session.getAttribute("login") == null)
		{
			response.sendRedirect("login.jsp");
		}
	%>
	
	<a href="/ElearningManagement/professorMenuRedirection">Revenir au menu</a>
	
	<c:forEach var="fileName" items="${filesName}">
    	<p><a href="downloadServlet?fileName=${fileName}&section=${section}">${fileName}</a></p>
	</c:forEach>
	
</body>
</html>