<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/css/navigation.css" rel="stylesheet"/>
</head>
<body>
	<ul>
		<li><a class="active" href="/goHome">Home</a></li>
		<li><a hre="/">${userFirstName}</a></li>
		<li><a href="/userInfo">Personal Information</a></li>
		<li><a href="#about">Application</a></li>
		<li><a href="#about">Status checking</a></li>
		<li><a href="#">Question&Answer</a></li>
		<li><a href="/logout">Log out</a></li>
	</ul>
	<div style="margin-left: 25%; padding: 1px 16px; height: 500px;">
	</div>
</body>
</html>