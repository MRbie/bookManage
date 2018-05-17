<%@page import="com.bie.dao.BookDao"%>
<%@page import="com.bie.dao.impl.BookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bie.po.Book" %>
<%@ page import="com.bie.service.BookService" %>
<%@ page import="com.bie.service.impl.BookServiceImpl" %>
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
<title>书籍详细信息的页面</title>
</head>
<body>
<%
	Book book=new Book();
	String sid=request.getParameter("bookid");
	Integer id=Integer.parseInt(sid);
	book.setBookid(id);
	BookDao dao=new BookDaoImpl();
	boolean mark=dao.deleteBook(id);
	if(mark){
		request.setAttribute("show", "删除信息成功");
	}else{
		request.setAttribute("show", "删除信息失败");
	}
	request.getRequestDispatcher("show.jsp").forward(request, response);

%>
</body>
</html>