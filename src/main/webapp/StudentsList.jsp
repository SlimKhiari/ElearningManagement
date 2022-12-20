<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Students registered</title>
</head>
<body>
	<c:forEach var="student" items="${students}">
		<li><c:out value="${student.name}"/> <c:out value="${student.id}"/></li>
	</c:forEach>
</body>
</html>