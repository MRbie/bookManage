<%@page import="com.bie.dao.impl.BookDaoImpl"%>
<%@page import="com.bie.dao.BookDao"%>
<%@page import="com.bie.po.Book"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员页面</title>
<style type="text/css">
h1{text-align:center;}
a{font-size:36px;text-decoration:none;color:black;}
a:hover{text-decoration:underline;color:#FF3300;}
h1{color:#00FF99;}
table{margin-top:-95px; }
</style>

<script type="text/javascript">
	function clickIt(){
		var p2=document.getElementById("t2").value;
		location.href="admin.jsp?p="+p2;
	}
</script>
</head>
<body>
<marquee><h1>管理员页面</h1></marquee>
<a href="insertbook.jsp">添加书籍</a><br/>
<a href="logout.jsp">安全退出</a>

<%
	Book book=new Book();
	BookDao dao=new BookDaoImpl();
	//2:获取从下面上一页下一页传来的参数p
	String p2=request.getParameter("p");
	
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
	
	request.setAttribute("book", book);
%>

<form action="" method="get">
	
	

<table align="center" cellpadding="10" cellspacing="10">
	
	<tr bgcolor="green">
		<td>编号</td>
		<td>书名</td>
		<td>价格</td>
		<td>作者</td>
		<td>封皮</td>
		<td>出版社</td>
		<td>更改操作</td>
		<td>删除操作</td>
	</tr>
	<c:set var="bg" value=""></c:set>
	<c:forEach var="b" items="${list }" varStatus="i">
	<c:if test="${i.index%2==0 }">
		<c:set var="bg" value="#09F7F7"></c:set>
	</c:if>
	<c:if test="${i.index%2==1 }">
		<c:set var="bg" value="#7755AA"></c:set>
	</c:if>
	<tr bgcolor="${bg }"> 
			<td>${b.bookid}</td>
			<td><a href="doInfo2.jsp?bookid=${b.bookid}">${b.bookname }</a></td>
			<td>${b.price }</td>
			<td>${b.author }</td>
			<td>${b.pic }</td>
			<td>${b.publish }</td>
			<td><a href="doInfo3.jsp?bookid=${b.bookid }">修改书籍</a></td>
			<td><a href="doInfo4.jsp?bookid=${b.bookid }">删除书籍</a></td>
	</tr>
	</c:forEach>
</table>
<div align="center">
	第<%=p %>/共<%=count %>页
	<a href="admin.jsp?p=0">首页</a>
	<a href="admin.jsp?p=<%=p-1 %>">上一页</a>
	<a href="admin.jsp?p=<%=p+1 %>">下一页</a>
	<a href="admin.jsp?p=<%=count%>">尾页</a>
	<input type="text" size="2" id="t2">
	<input type="button" value="go" onclick="clickIt()"/>
</div>

</form>
</body>
</html>