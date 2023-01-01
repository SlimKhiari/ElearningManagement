<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mes informations</title>
 <link rel="stylesheet" href="styleDashboard.css">
</head>
<body>
	<%
		if(session.getAttribute("login") == null)
		{
			response.sendRedirect("Login.jsp");
		}
	%>
		
	<%
		if((session.getAttribute("status")).equals("Student"))
		{
	%>
	<jsp:include page="menuStudent.jsp" />
	<%
		}
	%>
	<%
		if((session.getAttribute("status")).equals("Professor"))
		{
	%>
	<jsp:include page="menuProfessor.jsp" />
	<%
		}
	%>
	<div>
		<div class="container"  style="margin-left:25%;padding:1px 16px;height:1000px;">
	  <h1>Mon compte</h1>
	  <form method="post" action="myAccount">
	  <div class="row">
	    <div class="col-25">
	      <label for="name">Nom</label>
	    </div>
	    <div class="col-75">
	     <input type="text" name="name" id="name" value="${name}"/>
	    </div>
	  </div>
	  <div class="row">
	    <div class="col-25">
	      <label for="lname">Prénom</label>
	    </div>
	    <div class="col-75">
	      <input type="text" name="lastname" id="lastname" value="${lastname}"/>
	    </div>
	  </div>
	  <div class="row">
	    <div class="col-25">
	      <label for="lname">Date de naissance</label>
	    </div>
	    <div class="col-75">
	      <input type="text" name="birthday" id="birthday" value="${birthday}"/>
	    </div>
	  </div>
	  <div class="row">
	    <div class="col-25">
	      <label for="section">Spécialité</label>
	    </div>
	    <div class="col-75">
			<input type="text" name="section" id="section" value="${section}"/>	    </div>
	  </div>
	  <div class="row">
	    <div class="col-25">
	      <label for="lname">Numéro de téléphone</label>
	    </div>
	    <div class="col-75">
			<input type="text" name="contact" id="contact" value="${contact}"/>	    </div>
	  </div>
	  <div class="row">
		    <div class="col-25">
		      <label for="lname">Numéro de professeur</label>
		    </div>
		    <div class="col-75">
				<input type="text" name="id" id="id" value="${id}"/>
		    </div>
	   </div>
	   <h2>Changement de mot de passe:</h2>
	   <div class="row">
		    <div class="col-25">
		      <label for="lname">Ancien mot de passe</label>
		    </div>
		    <div class="col-75">
					<input type="text" name="oldpassword" id="oldpassword" required="required"/> 
		    </div>
	   </div>
	   <div class="row">
		    <div class="col-25">
		      <label for="lname">Nouveau mot de passe</label>
		    </div>
		    <div class="col-75">
					<input type="text" name="newpassword" id="newpassword" required="required"/>
		    </div>
	   </div>
	  <br>
	  <div class="row">
	    <button type="submit" value="Submit">  Enregistrer </button>
	  </div>
	  </form>
	</div>
</body>
</html>