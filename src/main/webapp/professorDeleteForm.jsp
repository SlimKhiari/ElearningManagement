<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Supprimer un(e) enseignant(e)</title> 
<link rel="stylesheet" href="styleDashboard.css">
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