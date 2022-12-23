<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Appel des étudiants</title>
</head>
<body>
	<%
		if(session.getAttribute("login") == null)
		{
			response.sendRedirect("login.jsp");
		}
	%>
	
	<a href="/ElearningManagement/professorMenuRedirection">Revenir au menu</a>
	
	<form method="post" action="attendanceTracker">
		<p>
			<label for="promoID">La promotion </label>
			<input type="text" name="promoID" id="promoID" required="required"/> 
			<label for="subject">La matière </label>
			<input type="text" name="subject" id="subject" required="required"/>
			<label for="time">Le créneau </label>
			<input type="time" name="time" id="time" required="required"/>
			<label for="date">La date </label>
			<input type="date" name="date" id="date" required="required"/>
			<button type='submit'>récupérer la liste des étudiants</button>
		</p>
	</form>
	
	<c:forEach var="studentByID" items="${studentsByID}">
				<p>
					<input type="text" name="lastname" id="lastname" value="${studentByID.lastname}"/>
					<input type="text" name="name" id="name" value="${studentByID.name}"/>
					<a href="attendanceTracker?delete=0&promoID=${promoID}&studentID=${studentByID.id}&subject=${subject}&time=${time}&date=${date}"> marquer abscent </a>
					<a href="attendanceTracker?delete=1&promoID=${promoID}&studentID=${studentByID.id}&subject=${subject}&time=${time}&date=${date}"> enlever l'abscence </a>
				</p>
		</form>	
	</c:forEach>
	
</body>
</html>