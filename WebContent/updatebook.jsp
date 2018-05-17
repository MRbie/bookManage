<%@page import="com.bie.po.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改图书的页面</title>
</head>
<body>
<marquee><h1>修改图书的页面</h1></marquee>
<%
	Book book=(Book)session.getAttribute("book");
%>

<form action="doupdatebook.jsp" method="post">
	<input type="hidden" name="bookid" value="${book.bookid }"/>
	<table align="center" cellpadding="10" cellspacing="10" width="100%">
		<tr bgcolor="pink" align="center">
			<td>书名<input type="text" name="bookname" value="${book.bookname }"/></td>
		</tr>
		<tr bgcolor="green" align="center">
			<td>价格<input type="text" name="price" value="${book.price }"/></td>
		</tr>
		<tr bgcolor="yellow" align="center">
			<td>作者<input type="text" name="author" value="${book.author }"/></td>
		</tr>
		<tr bgcolor="green" align="center">
			<td>封皮<input type="text" name="pic" value="${book.pic }"/></td>
		</tr>
		<tr bgcolor="blue" align="center">
			<td>出版社<input type="text" name="publish" value="${book.publish }"/></td>
		</tr>
		<tr bgcolor="pink" align="center"> 
			<td>
				<input type="submit" value="修改">
				<input type="reset" value="重置">
				<a href="admin.jsp">管理员后台</a>
			</td>
		</tr>
	</table>	
</form>
</body>
</html>