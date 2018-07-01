<%@page import="com.bie.dao.impl.BookDaoImpl"%>
<%@page import="com.bie.dao.BookDao"%>
<%@page import="com.bie.po.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改图书的操作</title>
</head>
<body>
<%
	Book book=new Book();
	//从页面获取插入的值
	String bookname=request.getParameter("bookname");	
	String price=request.getParameter("price");	
	String author=request.getParameter("author");	
	String pic=request.getParameter("pic");	
	String publish=request.getParameter("publish");	
	String bookid=request.getParameter("bookid");
	
	//将页面获取的值设置到set方法中
	book.setBookname(bookname);
	book.setAuthor(author);
	Double price2=Double.parseDouble(price);
	book.setPrice(price2);
	book.setPic(pic);
	book.setPublish(publish);
	Integer id=Integer.parseInt(bookid);
	book.setBookid(id);
	
	BookDao dao=new BookDaoImpl();
	boolean mark=dao.updateBook(book);
	if(mark){
		request.setAttribute("show", "修改信息成功");
	}else{
		request.setAttribute("show", "修改信息失败");
	}
	request.getRequestDispatcher("show.jsp").forward(request, response);

%>

</body>
</html>