<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Identification</title>
		<link rel='stylesheet' type='text/css' href='styles.css'>
	</head>
	<body>	
		<h1> Connection page</h1>	
		<form method='post' action="login">
			<label for='txtLogin'>Identifiant </label>
			<input id='txtLogin' name='txtLogin' type='text' value='${login}'> <br/>
			<label for='txtPassword'>Mot de passe </label>
			<input name='txtPassword' type='password' value='${password}'>  <br/><br/>
			<select id="txtStatus" name="txtStatus">
				<option value="student">Elève</option>
				<option value="Professor">Professeur</option>
				<option value="Administration">Administration</option>
			</select>
			<br/><br/>
			<button type='submit'>Me connecter</button>
			
		</form>
	</body>
</html>