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
	<jsp:include page="menuStudent.jsp" />
	
	<div class="container" style="margin-left:25%;padding:1px 16px;height:1000px;">
	   	<h1>Justifier une abscence</h1>
	   	<form action="abscenceJustification" method="post" enctype="multipart/form-data">
				<div class="row">
				    <div class="col-25">
						<label>Sélectionnez votre justificatif</label>
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