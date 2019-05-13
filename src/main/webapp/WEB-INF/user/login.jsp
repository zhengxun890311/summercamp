<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to summercamp</title>
<link href="<%=request.getContextPath()%>/css/style.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body id="body">
	<div id="header">
		<img src="<%=request.getContextPath()%>/image/hearder_img.jpg"
			style="oveerflow: auto; width: 1580px; height: 100px;" />
	</div>
	<div id="login_div">
		<div>
			<input id="regBtn" type="button" class="btn btn-warning"
				value="Registration" style="border-radius: 10px" data-toggle="modal"
				data-target="#regModal" />
			<div class="modal fade" id="regModal" tabindex="-1" role="dialog"
				aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h2 class="modal-title">Registration</h2>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<h5 style="color: red;">
								<form:errors path="userObj.*" />
							</h5>
							<form:form method="POST" action="/register"
								modelAttribute="userObj">
								<p>
									<form:label path="user_first_name">First name</form:label>
									<form:input type="text" class="form-control"
										path="user_first_name"
										placeholder="please input your first name" />
								</p>
								<p>
									<form:label path="user_last_name">Last name</form:label>
									<form:input type="text" class="form-control"
										path="user_last_name"
										placeholder="please input your last name" />
								</p>
								<p>
									<form:label path="user_email">Email:</form:label>
									<form:input type="text" class="form-control" path="user_email"
										placeholder="please input your Email" />
								</p>
								<p>
									<form:label path="password">Password:</form:label>
									<form:input type="password" class="form-control"
										path="password" placeholder="please input your password" />
								</p>
								<p>
									<form:label path="passwordConfirmation">Password Confirmation:</form:label>
									<form:input type="password" class="form-control"
										path="passwordConfirmation"
										placeholder="please re-input your password" />
								</p>
								<button type="submit" class="btn btn-primary">Register</button>
							</form:form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div style="margin-top: 10px; padding: 10px;">
			<h5 style="color: red;">${errors}</h5>
			<form:form method="POST" action="/login" modelAttribute="userObj">
				<p>
					<form:input type="email" class="form-control" path="user_email"
						placeholder="Please input your username" />
				</p>
				<P>
					<form:input type="password" class="form-control" path="password"
						placeholder="Please input your password" />
				</P>
				<input type="submit" class="btn btn-success" value="Login" />
			</form:form>
			<br>
			<a href="#">Forget Password?</a> <br>
			<hr>
		</div>
	</div>
	<div id="slide_div">
		<img class="d-block w-100" src="<%= request.getContextPath() %>/images/la.jpg" style="width:600px;height:350px;"
		 alt="First slide">
	</div>
	<div id="about">
		<img src="<%=request.getContextPath() %>/images/aboutbg.png"/>
		<h2 id="summercamp" style="color:white">Summer Camp</h2>
		<div id="about_content">
			<p>
				A summer camp or sleepaway camp is a supervised program for children or teenagers conducted during the summer months in some countries
			</p>
			<p>
				The traditional view of a summer camp as a woody place with hiking, canoeing, and campfires is changing, with greater acceptance of newer 
			</p>
			<p>
				types of summer camps that offer a wide variety of specialized activities.or example, there are camps for the performing arts, music, magic,
			</p>
			<p>
				computer programming, language learning, mathematics, children with special needs, and weight loss. In 2006, the American Camp Association 
			</p>
			<p>
				reported that 75 percent of camps added new programs.
			</p>
		</div>
		<h5 style="margin-left:20%;margin-top:0%">
			© 2019 Skyler Chang, Pasadena,CA . All Rights Reserved.  Terms & Privacy.
		</h5>
		
	</div>
</body>
</html>