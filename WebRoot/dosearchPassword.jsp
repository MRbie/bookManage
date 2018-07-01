<%@page import="java.util.List"%>
<%@page import="com.bie.service.impl.UserServiceImpl"%>
<%@page import="com.bie.po.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>处理找回密码的页面</title>
</head>
<body>
<%
	User user=new User();
	//获取login.jsp页面提交的账号和密码
	String name=request.getParameter("name");
	user.setName(name);
	
	UserServiceImpl service=new UserServiceImpl();
	List<User> list=service.selectUser(user);
	request.setAttribute("list", list);
	for(User u:list){
		request.setAttribute("user", u);
		out.print(u);
	}
	if(user!=null){
		//response.sendRedirect("search.jsp");//不传输数据的转发
		request.getRequestDispatcher("search.jsp").forward(request, response);
	}
	

%>
</body>
</html>