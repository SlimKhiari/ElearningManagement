<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="styleDashboard.css">
	<script language="javascript" type="text/javascript">
		function removeSpaces(string) {
		 return string.split(' ').join('');
		}
	</script>
	<meta charset="UTF-8">
	<title>Les notes des étudiants</title>
</head>
<body>
	<%
		if(session.getAttribute("login") == null)
		{
			response.sendRedirect("login.jsp");
		}
	%>
	<jsp:include page="menuProfessor.jsp" />
	
	<div class="container" style="margin-left:25%;padding:1px 16px;height:1000px;">	
		<h1>Saisir les notes des étudiants</h1>
		<form method="post" action="setMarks">
			<div class="row">
			    <div class="col-25">
					<label for="subject">Le nom du module </label>
			    </div>
			    <div class="col-75">
			    		<input type="text" name="subject" id="subject" required="required" value="${subject}"/>
			    </div>
			 </div>
			 <div class="row">
			    <div class="col-25">
					<label for="studentID">Numéro de l'étudiant</label>
			    </div>
			    <div class="col-75">
					<input type="text" name="studentID" id="studentID" onblur="this.value=removeSpaces(this.value);"/>
			    </div>
			 </div>
			 <div class="row">
			    <div class="col-25">
					<label for="mark">Note</label>
			    </div>
			    <div class="col-75">
					<input type="text" name="mark" id="mark"/>
			    </div>
			 </div>	
			 <div class="row">
				<button type='submit'> Envoyer la note</button>
				<button type='submit'> Supprimer la note</button>
				<button type='submit'> Afficher les notes</button>			
		     </div>
		</form>
		
		<c:forEach var="studentMark" items="${studentsMarks}">
			<li><c:out value="${studentMark.subject}"/> : <c:out value="${studentMark.studentID}"/> <c:out value="${studentMark.mark}"/></li>
		</c:forEach>
	</div>

</body>
</html>