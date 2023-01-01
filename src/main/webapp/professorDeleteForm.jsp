<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Supprimer un(e) enseignant(e)</title>
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
	  <h1>Supprimer un(e) enseignant(e)</h1>		
	  <form method="post" action="professorDelete">
	  <div class="row">
	    <div class="col-25">
	      <label for="professorID">Numéro du professeur à supprimer</label>
	    </div>
	    <div class="col-75">
	     <input type="text" name="professorID" id="professorID" required="required" placeholder="Numéro de professeur..."/>
	    </div>
	  </div>	  
	  <br>
	  <div class="row">
	    <button type="submit" value="Submit">  Supprimer </button>
	  </div>
	  </form>
	 </div>
	
	<div style="margin-left:25%;padding:1px 16px;height:1000px;">
		
	</div>
</body>
</html>