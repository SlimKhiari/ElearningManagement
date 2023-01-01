<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Les ressources pédagogiques</title>
</head>
<style>
.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
a:link { 
  text-decoration: none;
}
h4:hover, h4:active {
  background-color: #04AA6D;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
</style>
<body>
		
	<%
		if(session.getAttribute("login") == null)
		{
			response.sendRedirect("login.jsp");
		}
	%>
	<jsp:include page="menuStudent.jsp" />
	
	<div style="margin-left:25%;padding:1px 16px;height:1000px;" class="container">
		<h1>Consulter mes cours</h1>
		<c:forEach var="fileName" items="${filesName}">
	    	<p><h4><a href="downloadServlet?fileName=${fileName}&section=${section}">${fileName}</a></h4></p>
		</c:forEach>
	</div>
</body>
</html>