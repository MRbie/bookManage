<%@page import="com.bie.dao.impl.BookDaoImpl"%>
<%@page import="com.bie.dao.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.bie.po.Book" %>
<%@ page import="com.bie.service.impl.BookServiceImpl" %>
  
<%@ include file="head.jsp" %>  

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书处理页面</title>

<link href="js/bootstrap.min.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<style type="text/css">
/* h1{text-align:center; } */
</style>

<script type="text/javascript">
	function clickIt(){
		var p2=document.getElementById("t2").value;
		location.href="book.jsp?p="+p2;
	}
</script>
</head>
<body>

<%
	Book book=new Book();
	BookDao dao=new BookDaoImpl();
	//2:获取从下面上一页下一页传来的参数p
	String p2=request.getParameter("p");
	String bookname=request.getParameter("bookname");
	if(bookname != null && !"".equals(bookname)){
		book.setBookname(bookname);
		request.setAttribute("bookname", bookname);
	}
	
	//1:设置好第一页开始和一页有五条记录
	int p=1;
	int r=5;
	//5:获取到返回的总页数,将每页的总记录数传进去
	int count=dao.getCount(r);
	
	//3:如果p2不为null且不为空，就转化为p
	if(p2!=null && !p2.equals("")){
		p=Integer.parseInt(p2);
	}
	//4:如果页数为负的那么就赋值为首页
	if(p<=0){
		p=1;
	}
	
	//6:控制后面的页数，如果大于总页数，将最后一页赋值为尾页即可
	if(p>=count){
		p=count;
	}
	
	//7:调用分页的方法进行分页操作
	List<Book> list=dao.bookPage(p, r,book);
	request.setAttribute("list",list);
%>
<h1 style="text-align:center;">图书列表</h1>
<!-- <h1 style="text-align:right;margin-top: -50px;">图书排名榜</h1> -->

<form action="book.jsp" method="post">
	
	<div class="row alert alert-info" style="text-align:center;margin: 0px; padding: 5px;">
		<div class="form-group">
			图书查询:<input type="text" name="bookname" id="bookname" value="${bookname}" placeholder="请输入查询条件"/>
			<input type="submit" class="btn btn-danger" value="查询"> 
		</div>
	</div>	  
		  
<table align="center" cellpadding="10" cellspacing="10" class="table table-hover table-striped table-bordered">
	<%-- <tr>	
		<th>
			图书查询:<input type="text" name="bookname" id="bookname" value="${bookname}"/>
		</th>
		<th><input type="submit" value="查询"></th>
	</tr> --%>
	<tr bgcolor="green">
		<td>编号</td>
		<td>书名</td>
		<td>价格</td>
		<td>作者</td>
		<td>封皮</td>
		<td>出版社</td>
		<td>图书排名榜</td>
		<!-- <td>操作</td> -->
	</tr>
	<c:set var="bg" value=""></c:set>
	<c:forEach var="b" items="${list }" varStatus="i">
	
	<tr>
			<td>${b.bookid}</td>
			<td><a href="doInfo.jsp?bookid=${b.bookid}">${b.bookname }</a></td>
			<td>${b.price }</td>
			<td>${b.author }</td>
			<td>${b.pic }</td>
			<td>${b.publish }</td>
			<td>第${b.bookid}名</td>
			<%-- <td>
				<a href="doupdatebook.jsp?bookid=${b.bookid}">修改</a>
				<a href="">删除</a>
			</td> --%>
	</tr>
	</c:forEach>
</table>

<div align="center">
	第<%=p %>/共<%=count %>页
	<a href="book.jsp?p=0">首页</a>
	<a href="book.jsp?p=<%=p-1 %>">上一页</a>
	<a href="book.jsp?p=<%=p+1 %>">下一页</a>
	<a href="book.jsp?p=<%=count%>">尾页</a>
	<input type="text" size="2" id="t2">
	<input type="button" value="go" onclick="clickIt()"/>
</div>


</form>
</body>
</html>