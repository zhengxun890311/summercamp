<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	 <link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet"/>
</head>
<body id="body">
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
	</fieldset>
	
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
</body>
</html>