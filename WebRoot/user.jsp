<%@page import="com.bie.dao.impl.UserDaoImpl"%>
<%@page import="com.bie.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.bie.po.User" %>
<%@ page import="com.bie.service.impl.BookServiceImpl" %>
  
<%@ include file="head3.jsp" %>  

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户信息</title>
<style type="text/css">
h1{text-align:center; }
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
	User users=new User();
	UserDao dao=new UserDaoImpl();
	//2:获取从下面上一页下一页传来的参数p
	String p2=request.getParameter("p");
	//String bookname=request.getParameter("bookname");
	//if(bookname != null && !"".equals(bookname)){
	//	book.setBookname(bookname);
	//	request.setAttribute("bookname", bookname);
	//}
	
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
	List<User> list=dao.userPage(p, r);
	request.setAttribute("list",list);
%>
<h1>用户列表</h1>

<!-- <form action="book.jsp" method="post"> -->

<!-- <a href="javascript: window.history.go(-1)">返回上一级</a> -->
<table align="center" cellpadding="10" cellspacing="10">
	<%-- <tr>	
		<th>
			图书查询:<input type="text" name="bookname" id="bookname" value="${bookname}"/>
		</th>
		<th><input type="submit" value="查询"></th>
	</tr> --%>
	<tr bgcolor="green">
		<td>编号</td>
		<td>账号</td>
		<td>密码</td>
		<td>邮箱</td>
		<td>电话</td>
		<td>是否管理员</td>
		<!-- <td>操作</td> -->
	</tr>
	<c:set var="bg" value=""></c:set>
	<c:forEach var="user" items="${list }" varStatus="i">
	
	<tr>
			<td>${user.id}</td>
			<%-- <td><a href="doInfo.jsp?bookid=${user.bookid}">${user.bookname }</a></td> --%>
			<td>${user.name }</td>
			<td>${user.password }</td>
			<td>${user.email }</td>
			<td>${user.phone }</td>
			<td>
				<c:if test="${user.isAdmin==0 }">学生</c:if>
				<c:if test="${user.isAdmin==1 }">管理员</c:if>
			</td>
			<%-- <td>
				<a href="doupdatebook.jsp?bookid=${b.bookid}">修改</a>
				<a href="">删除</a>
				
			</td> --%>
	</tr>
	</c:forEach>
</table>
<div align="center">
	第<%=p %>/共<%=count %>页
	<a href="user.jsp?p=0">首页</a>
	<a href="user.jsp?p=<%=p-1 %>">上一页</a>
	<a href="user.jsp?p=<%=p+1 %>">下一页</a>
	<a href="user.jsp?p=<%=count%>">尾页</a>
	<input type="text" size="2" id="t2">
	<input type="button" value="go" onclick="clickIt()"/>
</div>

<!-- </form> -->
</body>
</html>