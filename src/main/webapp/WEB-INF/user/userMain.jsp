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
				<h1 style="margin-top:0px;margin-bottom: 0px;">Registration</h1>
			</div>
			<div id="info_div">
				
				<span style="color:red;">
					<i>
						<form:errors id="abc" path="userBasicInfo.*"/>
					</i>
				</span>
				<form:form method="post" action="/addUserBasicInfo" modelAttribute="userBasicInfo">
					<p>
							<p><form:errors path="userBasicInfo.*"/></p>
							<form:label path="user_phone">Phone:</form:label>
							<form:input id="phone" type="text" class="form-control" placeholder="please input phone number" path="user_phone" ></form:input>
					</p>
					<p>
							<form:label path="user_birth">Birthday 
								<span style="color:red;">
									<i>*Remind:The minumum age is 13</i>
								</span>
							</form:label>
							<form:input id="birthday" type="date" path="user_birth" class="form-control form-control-sm"/>
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
	</div>
	<script>
		$(document).ready(function(){
			var date = new Date();
			var year = date.getFullYear()-13;
			var month = ''+(date.getMonth()+1);
			var day = ''+date.getDate();
			if(month.length<2){
				month="0"+month;
			}
			if(day.length<2){
				day="0"+day;
			}
			var date = [year, month, day].join('-');
			$("#birthday").attr("max",date);
			$("#user_first_name").attr("disabled",true);
			$("#user_last_name").attr("disabled",true);
			$("#user_email").attr("disabled",true);
			$("#createdAt").attr("disabled",true);
			$("#info_btn").hide();
			
			
		})
	</script>
</body>
</html>