<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/css/home.css" rel="stylesheet"/>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div id="container">
		<div id="div_navi">
			<%@ include file="/WEB-INF/system/navigation.jsp"%>
		</div>
		<div id="content">
			<div id="title">
				<h1>Resume and Hobby</h1>
			</div>
			<span style="color:red;">
					<i>
						<form:errors id="abc" path="userResumeHobby.*"/>
					</i>
				</span>
				<form:form method="post" action="/addUserResumeHobby"
					modelAttribute="userResumeHobby">
					<p>
						<form:label path="user_resume">Resume:</form:label>
						<form:textarea id="resume" rows="13" type="text" class="form-control"
							placeholder="please input your Resume" path="user_resume" />
					</p>
					<p>
						<form:label path="user_hobby">Hobby:</form:label>
						<form:textarea id="hobby" rows="13" type="text" class="form-control"
							placeholder="please input your hobby" path="user_hobby" />
					</p>
					<p>
					<input id="success_btn" class="btn btn-success" type="submit"
						value="next" />
					<input id="info_btn" onClick="window.location.href='/findReasonComment'" class="btn btn-info" type="button" value="Next(Submitted)"/>
				</form:form>
		</div>
	</div>
	<script>
	$(document).ready(function(){
		$("#info_btn").hide();
		
	})
	</script>
</body>
</html>