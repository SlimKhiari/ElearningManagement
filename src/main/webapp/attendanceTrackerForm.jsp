<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>L'appel des étudiants</title>
	<link rel="stylesheet" href="styleDashboard.css">
</head>
<body>
	<%
		if(session.getAttribute("login") == null)
		{
			response.sendRedirect("login.jsp");
		}
	%>
	
	<jsp:include page="menuProfessor.jsp" />
	
	<div class="container"  style="margin-left:25%;padding:1px 16px;height:1000px;">
	  <h1>Faire l'appel des étudiants</h1>
	  <form method="post" action=attendanceTracker>
		  <div class="row">
					    <div class="col-25">
					      <label for="promoID">Section</label>
					    </div>
					    <div class="col-75 form-group required">
					      <select id="promoID" name="promoID">
					        <option value="iatic 3">IATIC 3</option>
					        <option value="iatic 4">IATIC 4</option>
					        <option value="iatic 5">IATIC 5</option>
					      </select>
					    </div>
					  </div>
		  <div class="row">
		    <div class="col-25">
		      <label for="subject">La matière</label>
		    </div>
		    <div class="col-75">
					<input type="text" name="subject" id="subject" required="required" value="${subject}" placeholder="La matière..."/>
		    </div>
		  </div>
		  <div class="row">
		    <div class="col-25">
		      <label for="time">Le créneau</label>
		    </div>
		    <div class="col-75">
					<input type="time" name="time" id="time" required="required" placeholder="Le créneau..."/>
		    </div>
		  </div>
		  <div class="row">
		    <div class="col-25">
		      <label for="date">La date</label>
		    </div>
		    <div class="col-75">
					<input type="date" name="date" id="date" required="required" placeholder="La date"/>
		    </div>
		  </div>
		  <br>
		  <div class="row">
		    <button type="submit" value="Submit">  récupérer la liste des étudiants </button>
		  </div>
	  </form>
	  <c:forEach var="studentByID" items="${studentsByID}">
			<p>
				<label>${studentByID.lastname} ${studentByID.name}</label>
				<a href="attendanceTracker?delete=0&promoID=${promoID}&studentID=${studentByID.id}&subject=${subject}&time=${time}&date=${date}"> marquer abscent </a>
				<a href="attendanceTracker?delete=1&promoID=${promoID}&studentID=${studentByID.id}&subject=${subject}&time=${time}&date=${date}"> enlever l'abscence </a>
			</p>
	   </c:forEach>
	</div>
</body>
</html>