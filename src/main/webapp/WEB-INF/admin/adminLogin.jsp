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
		<form:form method="POST" action="/adminRegister" modelAttribute="adminObj">
			<p>
				<form:label path="admin_username">user name:</form:label>
				<form:input type="text" path="admin_username"/>
			</p>
			<p>
				<form:label path="admin_password">Password:</form:label>
				<form:password path="admin_password" />
			</p>
			<p>
				<form:label path="admin_passwordConfirmation">Password Confirmation:</form:label>
				<form:password path="admin_passwordConfirmation" />
			</p>
			<input type="submit" value="register"/>
		</form:form>
	</fieldset>
	
	<fieldset>
		<h1>${errors}</h1>
		<form:form method="POST" action="/adminLogin" modelAttribute="adminObj">
			<P>
				<form:label path="admin_username">Username:</form:label>
				<form:errors path="admin_username"/>
				<form:input type="text" path="admin_username"/>
			</P>
			<P>
				<form:label path="admin_password">Password:</form:label>
				<form:errors path="admin_password"/>
				<form:input type="password" path="admin_password"/>
				
			</P>
			<input type="submit" value="login"/>
		</form:form>
	</fieldset>
</body>
</html>