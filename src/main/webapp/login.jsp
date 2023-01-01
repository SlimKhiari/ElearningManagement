<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date" %>
<! DOCTYPE html>  
<html lang="en" >  
<head>  
	<meta charset="UTF-8">  
	<title> Authentifiction </title>  
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">  
</head>  
<style>  
	body {  
	  font-family: 'Muli', sans-serif;  
	}     
	.btn {  
	  background: #008080;  
	  border: #E8D426;  
	}  
	.btn:hover {  
	  background: #28a745;  
	  border: #E8D426;  
	}  
</style>  
<body background="./files/iut.jpg">  
	<div class="pt-5">  
		<div class="container">  
			<div class="row">  
		    	<div class="col-md-5 mx-auto">  
		        	<div class="card card-body">  
		             	<form id="submitForm" action="#" method="post" data-parsley-validate="" data-parsley-errors-messages-disabled="true" novalidate="" _lpchecked="1">  
							<img src="./files/isty.png" width="400" height="100">
							<input type="hidden" name="_csrf" value="7635eb83-1f95-4b32-8788-abec2724a9a4">  
		                   		<div class="form-group required">  
			              			<label for="txtLogin"> Identifiant </label>  
			             			<input type="text" class="form-control text-lowercase" id="txtLogin" required="required" name="txtLogin" value="">  
		               			</div>                      
		       					<div class="form-group required">  
		    						<label class="d-flex flex-row align-items-center" for="txtPassword"> Mot de passe   </label>  
									<input type="password" class="form-control" required="required" id="txtPassword" name="txtPassword" value="">  
		      					</div>
		      					<div class="form-group required">
		      						<label for="txtLogin"> Status </label>  
		      						<select class="custom-select" id="inputGroupSelect01" id="txtStatus" name="txtStatus">  
						            	<option value="Student">Elève</option>
										<option value="Professor">Professeur</option>
										<option value="Administration">Administration</option> 
						        	</select>
		      					</div>    
		         				<div class="form-group pt-1">  
		      						<button class="btn btn-primary btn-block" type="submit"> Me connecter </button>  
		                  		</div>  
		               </form>  
		            
		             </div>  
		        </div>  
		   </div>  
		</div>  
	</div>  
</body>  
</html>  

<!-- 
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		
		<link rel='stylesheet' type='text/css' href='styles.css'>
	</head>
	<body>	
		<h1> Authentification</h1>	
		<form method='post' action="login">
			<label for='txtLogin'>Identifiant </label>
			<input id='txtLogin' name='txtLogin' type='text' value='${login}'> <br/>
			<label for='txtPassword'>Mot de passe </label>
			<input name='txtPassword' type='password' value='${password}'>  <br/><br/>
			<select id="txtStatus" name="txtStatus">
				<option value="Student">Elève</option>
				<option value="Professor">Professeur</option>
				<option value="Administration">Administration</option>
			</select>
			<br/><br/>
			<button type='submit'>Me connecter</button>
		</form>
	
	</body>
</html> -->