<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Ajouter un(e) étudiant(e)</title>
	<link rel="stylesheet" href="styleDashboard.css">
	<script language="javascript" type="text/javascript">
		function removeSpaces(string) {
		 return string.split(' ').join('');
		}
	</script>
</head>
<body>
	<%
		if(session.getAttribute("login") == null)
		{
			response.sendRedirect("login.jsp");
		}
	%>
	
	<jsp:include page="menuAdmin.jsp" />
	<div class="container"  style="margin-left:25%;padding:1px 16px;height:1000px;">
	  <h1>Inscrire un(e) enseignant(e)</h1>
	  <form method="post" action="professorCreation">
	  <div class="row">
	    <div class="col-25">
	      <label for="name">Nom</label>
	    </div>
	    <div class="col-75">
	     <input type="text" name="name" id="fname" required="required" placeholder="Nom..."/>
	    </div>
	  </div>
	  <div class="row">
	    <div class="col-25">
	      <label for="lname">Prénom</label>
	    </div>
	    <div class="col-75">
	      <input type="text" id="lname" name="lastname" placeholder="Prénom...">
	    </div>
	  </div>
	  <div class="row">
	    <div class="col-25">
	      <label for="lname">Date de naissance</label>
	    </div>
	    <div class="col-75">
	      <input type="date" name="birthday" id="lname" placeholder="Date de naissance...">
	    </div>
	  </div>
	  <div class="row">
	    <div class="col-25">
	      <label for="section">Spécialité</label>
	    </div>
	    <div class="col-75">
	      	<input type="text" name="section" id="section" required="required" placeholder="Spécialité..."/>
	    </div>
	  </div>
	  <div class="row">
	    <div class="col-25">
	      <label for="lname">Numéro de téléphone</label>
	    </div>
	    <div class="col-75">
	      <input type="text" name="contact" id="contact" required="required" placeholder="Numéro de téléphone..."/>	      
	    </div>
	  </div>
	  <div class="row">
		    <div class="col-25">
		      <label for="lname">Numéro de professeur</label>
		    </div>
		    <div class="col-75">
				<input type="text" name="id" id="id" required="required" placeholder="Numéro de professeur..." onblur="this.value=removeSpaces(this.value);"/>
		    </div>
	   </div>
	   <div class="row">
		    <div class="col-25">
		      <label for="lname">Mot de passe</label>
		    </div>
		    <div class="col-75">
				<input type="text" name="password" id="password" required="required" placeholder="Mot de passe..." />
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