<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bie.po.Book" %>
<%@page import="java.util.HashMap"%>
<%@page import="com.bie.po.CardItem"%>
<%@page import="java.util.Map"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>处理购物车</title>
</head>
<body>

<%
	//购物车功能
	//1：我购买的是哪一本书籍,先将要购买的书本先放到session域中
	Book book=(Book)session.getAttribute("book");
	
	//2：如何把该书籍存放到购物车中???
	//2.1：先判断是否有购物车，如果没有购物车，那么创建购物车，如果有购物车，则直接使用购物车
	//2.2：购物车使用什么数据类型？
	//数组(数组是固定大小的，所以不适合)
	//List集合(list集合是可以存放相同的对象，所以不适合)
	//Set集合，Map集合(使用Map集合是因为Map集合存储速度比较快) key:存放商品编号;value:存放购物车项;
	
	//先将购物车从session中拿出来，然后判断是否存在，不存在就创建。
	Map<Integer,CardItem> cart=(Map<Integer,CardItem>)session.getAttribute("cart");
	//如果没有购物车，只有第一次访问，才会操作
	if(cart==null){
		//就new一个购物车
		cart=new HashMap<Integer,CardItem>();
	}
	
	//把书籍存放到购物车
	//第二次判断，判断购物车中是否有该书籍
	//从购物车中，获取该书籍，如果为空，表示购物车中没有该书籍
	CardItem item=cart.get(book.getBookid());
	if(item==null){//购物车中不存在这本书，创建，数量默认为1
		item=new CardItem();
		item.setBook(book);
		item.setNumber(1);
	}else{//购物车中，存在该书籍，直接把数量加1
		item.setNumber(item.getNumber()+1);
	}
	
	
	//把购物车项存放到购物车
	cart.put(book.getBookid(), item);
	
	//把购物车存放到session
	session.setAttribute("cart", cart);
	
	response.sendRedirect("book.jsp");
%>


</body>
</html>