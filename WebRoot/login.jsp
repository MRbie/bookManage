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
h1{text-align:center;}
h4{text-align:left;color:red;}
/* body{background:url(images/timg.jpg)} */
body{background:url(images/2.png)}
/* a{text-decoration:none;font-size:20px;color:black;} */
/* a:hover{text-decoration:underline;font-size:24px;color:red;} */	
</style>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//alert("测试jQuery是否能用");
		$("#form1").submit(function(){
			var name=$("#name").val();//获取提交的值
			if(name.length==0){//进行判断，如果获取的值为0那么提示账号不能为空
				//alert("aa");//测试使用
				$("#nameError").html("账号不能为空");
				return false;
			}
			
			//密码进行验证不能为空
			var password=$("#password").val();//获取提交的密码的值
			if(password.length==0){
				$("#passwordError").html("密码不能为空");
				return false;
			}
			
		});
	
	});
</script>

</head>
<body>
<form action="info.jsp" method="post"  id="form1">
<!-- <form action="UserLoginServlet" method="post"  id="form1"> -->
	<h1>~~~登陆~~~</h1>
	<table align="center">
		<tr>
			<td>账号：</td>
			<td>
				<input type="text" name="name" id="name">
				<div id="nameError" style="display:inline;color:red;"></div>
			</td>
		</tr>
		<tr>
			<td>密码：</td>
			<td>
				<input type="password" name="password" id="password">
				<div id="passwordError" style="display:inline;color:red;"></div>
			</td>
			<!-- <td><a href="searchPassword.jsp">找回密码</a></td> -->
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
				<a href="register.jsp">注册</a>
				<a href="searchPassword.jsp">找回密码</a>
			</td>
		</tr>
	</table>
</form>
</body>
</html>