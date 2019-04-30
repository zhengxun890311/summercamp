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
				<h1>Application Information</h1>
			</div>
			<div id="left_div">
				<table class="NewTable" border="1" width="100%">
					<tr>
						<td width="12%">Last Name</td>
						<td width="12%">${userInfo.user_last_name}</td>
						<td width="12%">First Name</td>
						<td width="12%">${userInfo.user_first_name}</td>
						<td width="12%">Email</td>
						<td width="12%">${userInfo.user_email}</td>
						<td width="28%" rowspan="4" colspan="4">
							<img width="200px" height="200px" src="/${userInfo.userPhoto.user_photo_path}"/>
						</td>
					</tr>
					<tr>
						<td>Date of Birth</td>
						<td>${userInfo.userBasicInfo.user_birth}</td>
						<td>Address</td>
						<td colspan="3">
							${userInfo.userBasicInfo.user_street}
							${userInfo.userBasicInfo.user_city}
							${userInfo.userBasicInfo.user_state}
							${userInfo.userBasicInfo.user_zip}
						</td>
					</tr>
					<tr>
						<td>University</td>
						<td colspan="2">${userInfo.userUniversityInfo.user_university}</td>
						<td>Major</td>
						<td colspan="2">${userInfo.userUniversityInfo.user_major}</td>
					</tr>
					<tr>
						<td>Grade</td>
						<td colspan="2">${userInfo.userUniversityInfo.user_grade}</td>
						<td>Enrollment date</td>
						<td colspan="2">${userInfo.userUniversityInfo.user_university_date}</td>
					</tr>
					<tr>
						<td colspan="1" rowspan="7">
							resume:
						</td>
						<td colspan="10" rowspan="7">
							${userInfo.userResumeHobby.user_resume}
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>