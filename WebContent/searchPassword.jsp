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
<title>找回密码</title>
<style type="text/css">
body{background:url(images/3.jpg)}
</style>
</head>
<body>
<h1>找回密码</h1>
<hr/>
<a href="javascript: window.history.go(-1)">返回上一级</a>
<form action="dosearchPassword.jsp" method="post">
	<table>
		<tr>
			<td>请输入账号：</td>
			<td><input type="text" name="name"/></td>
		</tr>
		<tr>
			<td colspan="1"></td>
			<td>
				<input type="submit" value="提交">
				<input type="reset" value="重置">
			</td>
		</tr>
	</table>
</form>

</body>
</html>