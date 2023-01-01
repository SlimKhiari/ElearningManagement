<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mes notes</title>
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
	
	<jsp:include page="menuStudent.jsp" />
	
	<div class="container" style="margin-left:25%;padding:1px 16px;height:1000px;">
		<h1>Consulter mes notes</h1>
		<div>     
		  <table>
		    <thead>
		      <tr>
		        <th>Module</th>
		        <th>Note</th>
		      </tr>
		    </thead>
		    <tbody>
		    <c:forEach var="studentMark" items="${studentMarks}">
				<tr>
					<td>${studentMark.subject}</td>
			        <td>${studentMark.mark}</td>
		      </tr>
			</c:forEach>
		    </tbody>
		  </table>
		</div>
	</div>
</body>
</html>