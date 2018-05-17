<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//获取绝对路径路径 ,开发项目一定要使用绝对路径，不然肯定出错
	String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
				+ request.getServerName() + ":" + request.getServerPort()
				+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登陆页面</title>
<style type="text/css">
h1{text-align:left;}
h4{text-align:left;color:red;}
body{background:url(images/1.png)}
a{text-decoration:none;font-size:20px;color:black;}
a:hover{text-decoration:underline;font-size:24px;color:red;}	
</style>

</head>
<body>
<form action="info.jsp" method="post">
	<h1>用户登陆页面</h1>
	<h4>装饰中......</h4>	
	<hr/>
	<table align="left">
		<tr>
			<td>账号：</td>
			<td><input type="text" name="name" id="name"></td>
		</tr>
		<tr>
			<td>密码：</td>
			<td><input type="password" name="password" id="password"></td>
			<td><a href="searchPassword.jsp">找回密码</a></td>
		</tr>
		<!-- <tr>
			<td>权限：</td>
			<td>
				<select name="isAdmin">
					<option value="1">管理员</option>
					<option value="0">普通人</option>
				</select>
			</td>
			
		</tr> -->
		<tr>
			<td colspan="1">
			</td>
			<td>
				<input type="submit" value="登陆"/>
				<input type="reset" value="重置"/>
				<a href="register.jsp" target="_blank">注册</a>
			</td>
		</tr>
	</table>
</form>
</body>
</html>