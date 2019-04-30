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
	<div class="easyui-layout" style="width: 400px; height: 200px;">
		<div region="west" split="true" title="Navigator"
			style="width: 150px;">
			<p style="padding: 5px; margin: 0;">Select language:</p>
			<ul class="easyui-tree">
				<li>
					<span>Folder</span>
					<ul>
						<li><span href="www.baidu.com">SubFolder 1</span></li>
						<li><a href="javascript:void(0)" onclick="showcontent('java')">Java</a></li>
						<li><a href="javascript:void(0)" onclick="showcontent('C#')">C#</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<div id="content" region="center" title="Language"
			style="padding: 5px;"></div>
	</div>

	<table id="dg" title="User List" class="easyui-datagrid"
		url="/user/list" toolbar="#toolbar" pagination="true"
		rownumbers="true" fitColumns="true" singleSelect="true">
		<thead>
			<tr>
				<th field="id" width="50">ID</th>
				<th field="firstName" width="50">First Name</th>
				<th field="lastName" width="50">Last Name</th>
				<th field="email" width="50">Email</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${userList}" var="user">
				<tr>
					<td><c:out value="${user.id}"></c:out></td>
					<td><c:out value="${user.user_first_name}"></c:out></td>
					<td><c:out value="${user.user_last_name}"></c:out></td>
					<td><c:out value="${user.user_email}"></c:out></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
		<div id="toolbar">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-add" plain="true" onClick="newUser()">Create </a>
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-edit" plain="true" onClick="editUser()">Edit </a>
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-remove" plain="false" onClick="destroyUser()">
			Remove </a>
		<div id="dlg" class="easyui-dialog" style="width: 400px"
			data-options="closed:true,modal:true,border:'thin',buttons:'#dlg-buttons'">
			<form id="fm" method="post" novalidate
				style="margin: 0; padding: 20px 50px">
				<h3>User Information</h3>
				<div style="margin-bottom: 10px">
					<input name="firstName" class="easyui-textbox" required="true"
						label="First Name:" style="width: 100%" />
				</div>
				<div style="margin-bottom: 10px">
					<input name="lastName" class="easyui-textbox" required="true"
						label="Last Name:" style="width: 100%" />
				</div>
				<div style="margin-bottom: 10px">
					<input name="phone" class="easyui-textbox" required="true"
						label="phone:" style="width: 100%" />
				</div>
				<div style="margin-bottom: 10px">
					<input name="email" class="easyui-textbox" required="true"
						label="email:" style="width: 100%" />
				</div>
			</form>
		</div>
		<div id="dlg-buttons">
			<a href="javascript:void(0)" class="easyui-linkbutton c6"
				iconCls="icon-ok" onclick="saveUser()" style="width: 90px">Save</a>
			<a href="javascript:void(0)" class="easyui-linkbutton"
				iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')"
				style="width: 90px">Cancel</a>
		</div>
	</div>
	<script>
		function showcontent(language){
	        $('#content').html('Introduction to ' + language + ' language');
	    }	
		function newUser() {
			$("#dlg").dialog('open').dialog('center').dialog('setTitle',
					'New User')
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
				url : url,
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
				$.messager.confirm('Confirm',
						'Are you sure you want to remove this data',
						function(r) {
							if (r) {
								$.post('/user/delete', {
									id : row.id
								}, function(result) {
									if (result.success) {
										$('#dg').datagrid('reload'); // reload the user data
									} else {
										$.messager.show({
											// show error message
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