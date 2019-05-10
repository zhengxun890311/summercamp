<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Welcome to summercamp</title>
	 <link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet"/>
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body id="body">
	<div id="header">
		<img src="<%=request.getContextPath() %>/image/hearder_img.jpg" style="oveerflow:auto;width:1580px;height:100px;"/>
	</div>
	<!--
	<fieldset>
	  
	<p><form:errors path="userObj.*"/></p>
		<form:form method="POST" action="/register" modelAttribute="userObj">
			<p>
				<form:label path="user_first_name">first name</form:label>
				<form:input type="text" path="user_first_name" />
			</p>
			<p>
				<form:label path="user_last_name">last name</form:label>
				<form:input type="text" path="user_last_name" />
			</p>
			<p>
				<form:label path="user_email">Email:</form:label>
				<form:input type="email" path="user_email"/>
			</p>
			<p>
				<form:label path="password">Password:</form:label>
				<form:password path="password" />
			</p>
			<p>
				<form:label path="passwordConfirmation">Password Confirmation:</form:label>
				<form:password path="passwordConfirmation" />
			</p>
			<input type="submit" value="register"/>
		</form:form>
	</fieldset> -->
	
	<!--  
	<fieldset>
		<h1>${errors}</h1>
		<form:form method="POST" action="/login" modelAttribute="userObj">
			<P>
				<form:label path="user_email">Email:</form:label>
				<form:errors path="user_email"/>
				<form:input type="email" path="user_email"/>
			</P>
			<P>
				<form:label path="password">Password:</form:label>
				<form:errors path="password"/>
				<form:input type="password" path="password"/>
				
			</P>
			<input type="submit" value="login"/>
		</form:form>
	</fieldset>
	-->
	<div id="login_div">
		<div>
			<input id="regBtn" type="submit" class="btn btn-warning" value="Registration"/>
		</div>
		<div style="margin-top:10px;padding:10px;">
	        <form:form method="POST" action="/login" modelAttribute="userObj">
				<p>
		            <form:input type="email" class="form-control" path="user_email" placeholder="Please input your username"/>
				</p>
				<P>
					<form:input type="password" class="form-control" path="password" placeholder="Please input your password"/>
				</P>
				<input type="submit" class="btn btn-success" value="Login"/>
			</form:form>
			<br>
			<a href="#">Forget Password?</a>
			<br><hr>
		</div>
	</div>
	<div id="slide_div">
			
	</div>
</body>
</html>