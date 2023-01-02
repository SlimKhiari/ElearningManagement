<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Les abscences</title>
  <link rel="stylesheet" href="styleDashboard.css">
  <script language="javascript" type="text/javascript">
		function removeSpaces(string) {
		 return string.split(' ').join('');
		}
  </script>
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
	<jsp:include page="menuAdmin.jsp" />
	
	<div class="container" style="margin-left:25%;padding:1px 16px;height:1000px;">
		<h1>Voir les abscences des étudiants</h1><hr> <h3>Supprimer l'abscence d'un(e) étudiant(e):</h3>
		<form method="post" action="attendanceTrackerStudents">
			<div class="row">
			    <div class="col-25">
			      <label for="studentID">Numéro d'étudiant</label>
			    </div>
			    <div class="col-75">
			      <input type="text" name="studentID" id="studentID" required="required" onblur="this.value=removeSpaces(this.value);"/>
			    </div>
			 </div>
			 <div class="row">
			    <div class="col-25">
			      <label for="date">Date</label>
			    </div>
			    <div class="col-75">
			      <input type="text" name="date" id="date" required="required" onblur="this.value=removeSpaces(this.value);"/>
			    </div>
			 </div>
			 <div class="row">
			    <div class="col-25">
			      <label for="subject">Matière</label>
			    </div>
			    <div class="col-75">
			      <input type="text" name="subject" id="subject" required="required"/>
			    </div>
			 </div>
			 <div class="row">
			    <div class="col-25">
			      <label for="time">Créneau</label>
			    </div>
			    <div class="col-75">
			      <input type="text" name="time" id="time" required="required"  onblur="this.value=removeSpaces(this.value);"/>
			    </div>
			 </div>
			 <div class="row">
	    		<button type="submit" value="Submit">  Supprimer l'absence </button>
	  		 </div>
	   </form> <hr>
		<div>     
		  <table>
		    <thead>
		      <tr>
		        <th>Identifiant</th>
		        <th>Date</th>
		        <th>Matière</th>
		        <th>Créneau</th>
		      </tr>
		    </thead>
		    <tbody>
		    <c:forEach var="studentsAttendance" items="${studentsAttendance}">
				<tr>
					<td>${studentsAttendance.studentID}</td>
			        <td>${studentsAttendance.date}</td>
			        <td>${studentsAttendance.subject}</td>
			        <td>${studentsAttendance.time}</td>
		      </tr>
			</c:forEach>
		    </tbody>
		  </table>
		</div>
	</div>
</body>
</html>