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
<title>弹出信息</title>
<style type="text/css">
h1{text-align:center;}
a{text-align:center;}
</style>

<script type="text/javascript">
	/* alert("您的密码是：${user.password}"); */
</script>

</head>
<body style="background:url(images/2.png)">
<h1>您的密码是：${user.password}</h1>

<table align="center">
	<tr>
		<th>
			<a href="register.jsp">注册</a>
		</th>
		<th>
			<a href="login.jsp">登陆</a>
		</th>
	</tr>
</table>
<!-- <a href="javascript: window.history.go(-1)">返回上一级</a> -->
</body>
</html>