<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.bie.po.*"%>
<%@ page import="com.bie.dao.UserDao" %>
<%@ page import="com.bie.dao.impl.UserDaoImpl" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>登陆成功或者失败的页面</title>
<style type="text/css">
h1{text-align:center;}
h4{text-align:right;color:red;}
body{background:url(images/2.png)}
a{text-align:center;text-decoration:none;color:blue;}
a:hover{text-decoration:underline;font-size:18px;}

</style>
</head>
<body>
<!-- <h1>用户登陆成功或者失败的提示页面</h1> -->
<h4>装饰中......</h4>
<hr/>
<h1>现存图书列表</h1>
<%
	//引入数据交互层
	User user=new User();
	UserDao dao=new UserDaoImpl();
	String name=request.getParameter("name");
	String password=request.getParameter("password");
	String writeVerifyCode=request.getParameter("verifyCode");
	System.out.println(" 账号:" + name + ", 密码:" + password + ",randVerifyCode:" + writeVerifyCode);
	Object randVerifyCode = session.getAttribute("randVerifyCode");
	String isAdmin=request.getParameter("isAdmin");
	
	
	user.setName(name);
	user.setPassword(password);
	user.setIsAdmin(isAdmin);
	
	User us=dao.login(user);
	
	if(!(writeVerifyCode != null && !"".equals(writeVerifyCode) && 
			randVerifyCode != null && !"".equals(randVerifyCode) &&
			writeVerifyCode.equals(randVerifyCode.toString()))){
		//如果服务器重启,不产生验证码,那么刷新直接跳转到登录页面
		response.sendRedirect("login.jsp");
	}else{
		session.setAttribute("user",user);
		if(us != null){
			//如果是管理员跳转到管理员页面
			if(user.getIsAdmin().equals("1")){
				//out.println(us.getIsAdmin());
				response.sendRedirect("admin.jsp");
			}else if(user.getIsAdmin().equals("0")){
				//如果是普通会员，跳转到图书列表的页面
				response.sendRedirect("book.jsp");
			}
		}else{
			response.sendRedirect("login.jsp");
			//out.println("登录失败");
		}
	}
	
%>


</body>
</html>