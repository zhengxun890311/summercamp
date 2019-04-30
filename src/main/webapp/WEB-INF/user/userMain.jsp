<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<%=request.getContextPath() %>/css/home.css" rel="stylesheet"/>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Home</title>
</head>
<body>
	<div id="container">
		<div id="div_navi">
			<%@ include file="/WEB-INF/system/navigation.jsp" %>
		</div>
		<div id="content">
			<div id="title">
				<h1>Registration</h1>
			</div>
				<form:form modelAttribute="userObj">
					<p>
							<form:label path="user_first_name">First name</form:label>
							<form:input id="user_first_name" class="form-control" path="user_first_name" />
					</p>
					<p>
							<form:label path="user_last_name">Last name</form:label>
							<form:input id="user_last_name" class="form-control" path="user_last_name" />
					</p>
					<p>
							<form:label path="user_email">Email</form:label>
							<form:input id="user_email" class="form-control" path="user_email" />
					</p>
					<p>
							<form:label path="createdAt">Create Date</form:label>
							<form:input id="createdAt" class="form-control" path="createdAt" />
					</p>
				</form:form>
				<form:form method="post" action="/addUserBasicInfo" modelAttribute="userBasicInfo">
					<p>
							<form:label path="user_phone">Phone:</form:label>
							<form:input id="phone" type="text" class="form-control" placeholder="please input phone number" path="user_phone" ></form:input>
				
					</p>
					<p>
							<form:label path="user_birth">Date</form:label>
							<form:input id="date" type="text" class="form-control" placeholder="please input birthday" path ="user_birth"/>
					</p>
					<p>
							<form:label path="user_street">Street:</form:label>
							<form:input id="street" type="text" class="form-control" placeholder="please input street number" path="user_street"/>
						
					</p>
					<p>
							<form:label path="user_city">City:</form:label>
							<form:input id="city" type="text" class="form-control" placeholder="please input city name" path="user_city"/>
					
					</p>
					<p>
							<form:label path="user_state">State:</form:label>
							<form:input id="state" type="text" class="form-control" placeholder="please input state" path="user_state"/>
					
					</p>
					<p>
							<form:label path="user_zip">Zip:</form:label>
							<form:input id="zip" type="text" class="form-control" placeholder="please input state" path="user_zip"/>
					
					</p>
						<input id="success_btn" class="btn btn-success" type="submit" value="Next"/>
						<input id="info_btn" onClick="window.location.href='/findUnivesityInfo'" class="btn btn-info" type="button" value="Next(Submitted)"/>
				</form:form>
		</div>
	</div>
	<script>
		$(document).ready(function(){
			$("#user_first_name").attr("disabled",true);
			$("#user_last_name").attr("disabled",true);
			$("#user_email").attr("disabled",true);
			$("#createdAt").attr("disabled",true);
			$("#info_btn").hide();
			if($("#phone").val().length>0){
				$("#phone").attr("disabled",true);
				$("#success_btn").hide();
				$("#info_btn").show(1000);
			}
			if($("#date").val().length>0){
				$("#date").attr("disabled",true);
			}
			if($("#street").val().length>0){
				$("#street").attr("disabled",true);
			}
			if($("#city").val().length>0){
				$("#city").attr("disabled",true);
			}
			if($("#state").val().length>0){
				$("#state").attr("disabled",true);
			}
			if($("#zip").val().length>0){
				$("#zip").attr("disabled",true);
			}
		})
	</script>
</body>
</html>