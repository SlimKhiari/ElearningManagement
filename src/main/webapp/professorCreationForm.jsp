<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Ajouter un(e) étudiant(e)</title>
</head>
<style>
* {
  box-sizing: border-box;
}

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

button[type=submit] {
  background-color: #04AA6D;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: right;
}

button[type=submit]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

.col-25 {
  float: left;
  width: 25%;
  margin-top: 6px;
}

.col-75 {
  float: left;
  width: 75%;
  margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
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
				<input type="text" name="id" id="id" required="required" placeholder="Numéro de professeur..."/>
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