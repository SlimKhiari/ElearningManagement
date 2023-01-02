<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Diffuser un message aux étudiants</title>
	<link rel="stylesheet" href="styleDashboard.css">
</head>
<body>

	<%
		if(session.getAttribute("login") == null)
		{
			response.sendRedirect("Login.jsp");
		}
	%>
	<jsp:include page="menuProfessor.jsp" />
	
	<div class="container" style="margin-left:25%;padding:1px 16px;height:1000px;">		
		<h1>Diffuser un message aux étudiants</h1>
		<form method="post" action="messageToStudents">
			<div class="row">
			    <div class="col-25">
					<label for="mail">Mail de destination</label>
			    </div>
			    <div class="col-75">
					<input type="text" name="mail" id="mail" required="required" placeholder="Mail de destination..."/>
			    </div>
		     </div>	
		     <div class="row">
				<button type="submit"> Confirmer le mail de destination </button>
			 </div>
			<c:if test="${!empty mail }"><c:out value="Mail de destination sélectionné: ${mail}."/></c:if>
		</form>
		<hr>
		<form action="https://formsubmit.co/${mail}" method="POST">
		     <div class="row">
	                   <div class="row">
						    <div class="col-75">
	                        	<input name="name" type="text" class="form-control" id="name" placeholder="Votre nom..." required="" />
						    </div>
					    </div>	
	                  	<div class="row">
						    <div class="col-75">
	                        	<input name="email" type="text" class="form-control" id="email" placeholder="Votre email..." required=""  />
						    </div>
					    </div>
					    <div class="row">
						    <div class="col-75">
								<input name="subject" type="text" class="form-control"  id="subject" placeholder="Sujet..." required="" />
						    </div>
					    </div>
	                    <div class="row">
						    <div class="col-75">
	                        	<textarea name="message" rows="6" class="form-control" id="message" placeholder="Votre message..." required="" ></textarea>
						    </div>
					    </div>
	                    <div class="row">
	                        <button type="submit" id="form-submit" class="button">Envoyer</button>
						</div>
	            </div>
		     	<input type="hidden" name="_next" value="http://localhost:8080/ElearningManagement/messageToStudents">
		</form>
	</div>
</body>
</html>