<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="/css/style.css" />
		<link rel="stylesheet" type="text/css" href="/lib/themes/bootstrap/easyui.css" />
		<link rel="stylesheet" type="text/css" href="/lib/themes/icon.css" />
		<link rel="stylesheet" type="text/css" href="/lib/themes/color.css" />
		<script type="text/javascript" src="/lib/jquery.min.js"></script>
		<script type="text/javascript" src="/lib/jquery.easyui.min.js"></script>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<div class="easyui-layout" style="width: 1600px; height: 750px;">
	
			<!-- West part -->
			<div region="west" split="true" title="Navigator"
				style="width: 300px;">
				<p style="padding: 5px; margin: 0;">Select Operation:</p>
				<ul class="easyui-tree">
					<li>
						<span>Operation</span>
							<ul>
								<li><a href="javascript:void(0)"
									onclick="addTab('tweets','http://www.google.com')">Like</a></li>
								<li><a href="javascript:void(0)"
									onclick="addTab('amazon','http://www.amazon.com')">Reply</a></li>
								<li><a href="javascript:void(0)"
									onclick="addTab('facebook','http://www.facebook.com')">User</a></li>
							</ul>
						</li>
				</ul>
				<ul class="easyui-tree">
					<li>
						<span>Operation</span>
							<ul>
								<li><a href="javascript:void(0)"
									onclick="addTab('google','http://www.google.com')">Like</a></li>
								<li><a href="javascript:void(0)"
									onclick="addTab('amazon','http://www.amazon.com')">Reply</a></li>
								<li><a href="javascript:void(0)"
									onclick="addTab('facebook','http://www.facebook.com')">User</a></li>
							</ul>
						</li>
				</ul>
			</div>
	
			<!-- midddle part this is user table  -->
			<div region="center" split="true" title="Admin Operation">
				<div id="tt" class="easyui-tabs"
					style="width: 1500px; height: 700px;">
					<div title="Home">
						<table id="dg" title="User List" class="easyui-datagrid"
							url="/user/list" toolbar="#toolbar" pagination="true"
							rownumbers="true" fitColumns="true" singleSelect="true"
							style="width: 1500px; height: 800px">
							<thead>
								<tr>
									<th field="id" style="width:5px;">ID</th>
									<th field="email" style="width:5px;">Email</th>
									<th field="firstName" style="text-align: center;width:5px;">First Name</th>
									<th field="lastName" style="width:5px;">Last Name</th>
									<th field="createAt" style="width:5px;">Create Date</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${userList}" var="user">
									<tr>
										<td><c:out value="${user.id}"></c:out></td>
										<td><c:out value="${user.user_email}"></c:out></td>
										<td><c:out value="${user.user_first_name}"></c:out></td>
										<td><c:out value="${user.user_last_name}"></c:out></td>
										<td><c:out value="${user.createdAt}"></c:out></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		<div id="toolbar">
			<a href="javascript:void(0)" class="easyui-linkbutton"
				iconCls="icon-add" plain="true" onClick="newUser()">Create </a> <a
				href="javascript:void(0)" class="easyui-linkbutton"
				iconCls="icon-edit" plain="true" onClick="editUser()">Edit </a> <a
				href="javascript:void(0)" class="easyui-linkbutton"
				iconCls="icon-remove" plain="false" onClick="destroyUser()">
				Remove </a>
			<div id="dlg" class="easyui-dialog" style="width:400px;height:500px;"
				data-options="closed:true,modal:true,border:'thin',buttons:'#dlg-buttons'">
				<form id="fm" method="post" novalidate style="margin: 0; padding: 20px 50px" modelAttribute="userObj">
					<h3>User Information</h3>
					<div style="margin-bottom: 10px">
						<input name="user_first_name" class="easyui-textbox" required="true"
							label="First Name:" style="width: 100%" />
					</div>
					<div style="margin-bottom: 10px">
						<input name="user_last_name" class="easyui-textbox" required="true"
							label="Last Name:" style="width: 100%" />
					</div>
					<div style="margin-bottom: 10px">
						<input name="user_email" type="email" class="easyui-textbox" required="true"
							label="email:" style="width: 100%" />
					</div>
					<div style="margin-botton: 10px;;margin-top:10px;">
						<input name="password" class="easyui-textbox" required="true"
							  label="password" style="width:100%"/>
					</div>
				</form>
				<div id="dlg-buttons">
					<a href="javascript:void(0)" class="easyui-linkbutton c6"
						iconCls="icon-ok" onclick="saveUser()" style="width: 90px">Save</a>
					<a href="javascript:void(0)" class="easyui-linkbutton"
						iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')"
						style="width: 90px">Cancel</a>
				</div>
			</div>
			
		</div>
		<script>
			function addTab(title, url) {
				if ($('#tt').tabs('exists', title)) {
					$('#tt').tabs('select', title);
				} else {
					var content = '<iframe scrolling="auto" frameborder="0"  src="'
							+ url + '" style="width:100%;height:100%;"></iframe>';
					$('#tt').tabs('add', {
						title : title,
						content : content,
						closable : true
					});
				}
			}
			function newUser() {
				$("#dlg").dialog('open').dialog('center').dialog('setTitle','New User');
				$("#fm").form('clear');
				url = '/questions/new';
			}
	
			function editUser() {
				var row = $("#dg").datagrid('getSelected');
				if (row) {
					$('#dlg').dialog('open').dialog('left').dialog('setTitle',
							'Edit User');
					$("#fm").form('load', row);
					url = '/questions/new';
				}
			}
			function saveUser() {
				$('#fm').form('submit', {
					url : "/newUser",
					onSubmit : function() {
						return $(this).form('validate');
					},
					success : function(result) {
						var result = eval('(' + result + ')');
						if (result.errorMsg) {
							$.messager.show({
								title : 'Error',
								msg : result.errorMsg
							});
						} else {
							$('#dlg').dialog('close'); // close the dialog
							$('#dg').datagrid('reload'); // reload the user data
						}
					}
				});
			}
	
			function destroyUser() {
				var row = $('#dg').datagrid('getSelected');
				if (row) {
					alert(row.id)
					$.messager.confirm('Confirm',
						'Are you sure you want to remove this data',
						function(r) {
						if (r) {
							$.post('/user/deleteUser', {
								id : row.id
							}, function(result) {
								if (result.success) {
									$('#dg').datagrid('reload'); // reload the user data
								} else {
									$.messager.show({
										title : 'Error',
										msg : result.errorMsg
									});
								}
							}, 'json');
						}
					});
				}
			}
		</script>
	</body>
</html>