<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(function(){
    $("input#studentID").on({
        keydown: function(e) {
            if (e.which === 32)
                return false;
        },
        change: function() {
            this.value = this.value.replace(/\s/g, "");
        }
    });
    })
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
	
	<div style="margin-left:25%;padding:1px 16px;height:1000px;">
		<a href="/ElearningManagement/professorMenuRedirection">Revenir au menu</a>
		
		<form method="post" action="setMarks">
			<p>
				<label for="subject">Le nom du module </label>
				<input type="text" name="subject" id="subject" required="required" value="${subject}"/>
			</p>
			<p>
				<label for="studentID">Numéro de l'étudiant </label>
				<input type="text" name="studentID" id="studentID"/>
			</p>
			<p>
				<label for="mark">Note </label>
				<input type="text" name="mark" id="mark"/>
			</p>
				<button type='submit'> Envoyer la note</button>
				<button type='submit'> Supprimer la note</button>
				<button type='submit'> Afficher les notes</button>			
		</form>
		
		<c:forEach var="studentMark" items="${studentsMarks}">
			<li><c:out value="${studentMark.subject}"/> : <c:out value="${studentMark.studentID}"/> <c:out value="${studentMark.mark}"/></li>
		</c:forEach>
	</div>
</body>
</html>