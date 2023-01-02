<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Supprimer un(e) étudiant(e)</title>
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
	  <h1>Supprimer un(e) étudiant(e)</h1>		
	  <form method="post" action="studentDelete">
	  <div class="row">
	    <div class="col-25">
	      <label for="studentID">Numéro de l'étudiant à supprimer</label>
	    </div>
	    <div class="col-75">
	     <input type="text" name="studentID" id="studentID" required="required" placeholder="Numéro de l'étudiant..."/>
	    </div>
	  </div>	  
	  <br>
	  <div class="row">
	    <button type="submit" value="Submit">  Supprimer </button>
	  </div>
	  </form>
	 </div>
</body>
</html>