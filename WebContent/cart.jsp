<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="com.bie.po.CardItem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购物车</title>
<style type="text/css">
tr,td{text-align:center;background-color:#eee;}

</style>
</head>
<body>
<%
		
	Map<Integer,CardItem> cart=(Map<Integer,CardItem>)session.getAttribute("cart");
	double count=0;//总价格
	double p=0;
	if(cart != null && !"".equals(cart) && !"null".equals(cart)){
		for(Map.Entry<Integer,CardItem> entry : cart.entrySet()){	
			//小计
			p=entry.getValue().getNumber() * entry.getValue().getBook().getPrice();
			//总价格
			count=count+p;
		}	
	}
	session.setAttribute("entry", cart);
	pageContext.setAttribute("p", p);
	pageContext.setAttribute("count", count);
%>

<table width="100%" align="center">
	<tr>
		<th>书本编号</th>
		<th>书本名称</th>
		<th>书本单价</th>
		<th>书本数量</th>
		<th>书本小计</th>
	</tr>
	
	<c:forEach items="${entry }" var="entry">
	<tr>
		<td>${entry.getKey()}</td>
		<td>${entry.getValue().getBook().getBookname()}</td>
		<td>${entry.getValue().getBook().getPrice()}</td>
		<td>${entry.getValue().getNumber() }</td>
		<td>${entry.getValue().getNumber() * entry.getValue().getBook().getPrice() }</td>
	</tr>
	</c:forEach>
	<tr>
		<td colspan="4" align="right">价格总计</td>
		<td>${count }</td>
	</tr>
</table>
<div style="text-align:right;font-size:36px;margin-top:20px;">
	<a href="book.jsp">继续购买图书</a>
	<a href="login.jsp">登陆页面</a>
</div>
</body>
</html>