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
	
	<jsp:include page="menuStudent.jsp" />
	
	<div style="margin-left:25%;padding:1px 16px;height:1000px;">
		<a href="/ElearningManagement/studentMenuRedirection">Revenir au menu</a>
		
		<c:forEach var="studentMark" items="${studentMarks}">
			<li><c:out value="${studentMark.subject}"/> :  <c:out value="${studentMark.mark}"/></li>
		</c:forEach>
	</div>
</body>
</html>