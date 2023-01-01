<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>L'envoie des fichiers</title>
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
	   	<form action="uploadServlet" method="post" enctype="multipart/form-data">
				<p>
					<label for="section">Filière </label>
					<input type="text" name="section" id="section" required="required"/>
				</p>
				<p>
					<label for="subject">Nom du module </label>
					<input type="text" name="subject" id="subject" required="required" value="${subject}"/>
				</p>
				<p>
					<label>Sélectionnez le fichier</label>
	            	<input type="file"  name="file" required="required">
				</p>		
	            <button type='submit'>Envoyer</button>
	    </form>
	    
	   	
	   <c:forEach var="fileName" items="${filesName}">
	    	<p><a href="downloadServlet?fileName=${fileName}&section=${section}">${fileName}</a></p>
		</c:forEach>
	</div>
   
          
</body>
</html>
