<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>L'envoie des fichiers</title>
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
	
	<div class="container" style="margin-left:25%;padding:1px 16px;height:1000px;">
	   	<h1>Envoyer un fichier aux étudiants</h1>
	   	<form action="uploadServlet" method="post" enctype="multipart/form-data">
				<div class="row">
				    <div class="col-25">
				      <label for="section">Section</label>
				    </div>
				    <div class="col-75 form-group required">
				      <select id="section" name="section">
				        <option value="iatic 3">IATIC 3</option>
				        <option value="iatic 4">IATIC 4</option>
				        <option value="iatic 5">IATIC 5</option>
				      </select>
				    </div>
				  </div>
				 <div class="row">
				    <div class="col-25">
						<label for="subject">Nom du module </label>
				    </div>
				    <div class="col-75">
						<input type="text" name="subject" id="subject" required="required" value="${subject}"/>
				    </div>
				 </div>
				<div class="row">
				    <div class="col-25">
						<label>Sélectionnez le fichier</label>
				    </div>
				    <div class="col-75">
	            		<input type="file"  name="file" required="required">
				    </div>
				 </div>	
	            <button type='submit'>Envoyer</button>
	    </form>
	</div>       
</body>
</html>
