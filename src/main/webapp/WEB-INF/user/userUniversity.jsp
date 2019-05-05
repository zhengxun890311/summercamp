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
				<h1>University</h1>
			</div>
				<span style="color:red;">
					<i>
						<form:errors id="abc" path="userUniversityInfo.*"/>
					</i>
				</span>
				<form:form method="post" action="/addUserUniversityInfo"
					modelAttribute="userUniversityInfo">
					<p>
						<form:label path="user_university">University:</form:label>
						<form:input id="university" type="text" class="form-control"
							placeholder="please input phone number" path="user_university" />
					</p>
					<p>
						<form:label path="user_major">Major:</form:label>
						<form:input id="major" type="text" class="form-control"
							placeholder="please input major" path="user_major" />
					</p>
					<p>
						<form:label path="user_university_date">
							Enrollment date:
						</form:label>
						<form:input id="enrollment" type="date" class="form-control" path="user_university_date" />
					</p>
					<p>
						<form:label path="user_grade">Grade:</form:label>
						<form:input id="grade" type="text" class="form-control"
							placeholder="please input city name" path="user_grade" />
					</p>
					<input id="success_btn" class="btn btn-success" type="submit" value="next" />
					<input id="info_btn" onClick="window.location.href='/findResumeHobby'" class="btn btn-info" type="button" value="Next(Submitted)"/>
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