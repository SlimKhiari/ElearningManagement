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
	<jsp:include page="menuStudent.jsp" />
	
	<div style="margin-left:25%;padding:1px 16px;height:1000px;">
		<a href="/ElearningManagement/studentMenuRedirection">Revenir au menu</a>
		
		<c:forEach var="studentAttendance" items="${studentAttendance}">
			<li><c:out value="${studentAttendance.date}"/> :  <c:out value="${studentAttendance.subject}"/> - <c:out value="${studentAttendance.time}"/></li>
		</c:forEach>
	</div>
</body>
</html>