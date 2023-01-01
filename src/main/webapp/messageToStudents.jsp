<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Diffuser un message aux étudiants</title>
</head>
<body>

	<%
		if(session.getAttribute("login") == null)
		{
			response.sendRedirect("Login.jsp");
		}
	%>
	<jsp:include page="menuProfessor.jsp" />
	
	<div style="margin-left:25%;padding:1px 16px;height:1000px;">
		<a href="/ElearningManagement/professorMenuRedirection">Revenir au menu</a>
		
		<form method="post" action="messageToStudents">
			<label for="mail">Mail</label>
			<input type="text" name="mail" id="mail" required="required" placeholder="Mail de destination..."/>
			<button type="submit"> Confirmer le mail de destination </button>
			<c:if test="${!empty mail }"><c:out value="Envoi du mail à ${mail}."/></c:if>
		</form>
		
		<form action="https://formsubmit.co/${mail}" method="POST">
		     <div class="row">
	                    <div class="col-md-6">
	                      <fieldset>
	                        <input name="name" type="text" class="form-control"
	                          id="name" placeholder="Votre nom..." required="" />
	                      </fieldset>
	                    </div>
	                    <div class="col-md-6">
	                      <fieldset>
	                        <input name="email" type="text" class="form-control"
	                          id="email" placeholder="Votre email..." required=""  />
	                      </fieldset>
	                    </div>
	                    <div class="col-md-12">
	                      <fieldset>
	                        <input name="subject" type="text" class="form-control" 
	                          id="subject" placeholder="Sujet..." required="" />
	                      </fieldset>
	                    </div>
	                    <div class="col-md-12">
	                      <fieldset>
	                        <textarea name="message" rows="6" class="form-control"
	                          id="message" placeholder="Votre message..." required="" ></textarea>
	                      </fieldset>
	                    </div>
	                    <div class="col-md-12">
	                      <fieldset>
	                        <button type="submit" id="form-submit" class="button">Envoyer</button>
	                      </fieldset>
	                    </div>
	            </div>
		     	<input type="hidden" name="_next" value="http://localhost:8080/ElearningManagement/messageToStudents">
		</form>
	</div>
</body>
</html>