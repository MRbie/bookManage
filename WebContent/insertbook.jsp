<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加图书的页面</title>
</head>
<body>
<marquee><h1>添加图书的页面</h1></marquee>
<form action="doinsertbook.jsp" method="post">
	<table align="center" cellpadding="10" cellspacing="10" width="100%">
		<tr bgcolor="pink" align="center">
			<td>书名<input type="text" name="bookname"/></td>
		</tr>
		<tr bgcolor="green" align="center">
			<td>价格<input type="text" name="price"/></td>
		</tr>
		<tr bgcolor="yellow" align="center">
			<td>作者<input type="text" name="author"/></td>
		</tr>
		<tr bgcolor="green" align="center">
			<td>封皮<input type="text" name="pic"/></td>
		</tr>
		<tr bgcolor="blue" align="center">
			<td>出版社<input type="text" name="publish"/></td>
		</tr>
		<tr bgcolor="pink" align="center"> 
			<td>
				<input type="submit" value="添加">
				<input type="reset" value="重置">
				<a href="admin.jsp">管理员后台页面</a>
			</td>
		</tr>
	</table>	
</form>
</body>
</html>