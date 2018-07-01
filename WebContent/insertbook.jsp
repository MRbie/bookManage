<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加图书的页面</title>
<style type="text/css">
body{background:url(images/2.png)}
h1{text-align:center;}
</style>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//alert("测试jQuery是否能用");
		$("#form1").submit(function(){
			var bookname=$("#bookname").val();//获取提交的值
			if(bookname.length==0){//进行判断，如果获取的值为0那么提示账号不能为空
				//alert("aa");//测试使用
				$("#booknameError").html("图书名称不能为空");
				return false;
			}
			var price=$("#price").val();//获取提交的密码的值
			if(price.length==0){
				$("#priceError").html("图书价格不能为空");
				return false;
			}
			var author=$("#author").val();//获取提交的密码的值
			if(author.length==0){
				$("#authorError").html("图书作者不能为空");
				return false;
			}
			var pic=$("#pic").val();//获取提交的密码的值
			if(pic.length==0){
				$("#picError").html("图书图片不能为空");
				return false;
			}
			var publish=$("#publish").val();//获取提交的密码的值
			if(publish.length==0){
				$("#publishError").html("图书出版社不能为空");
				return false;
			}
		});
	
	});
</script>

</head>
<body>
<h1>~~~图书添加~~~</h1>
<form action="doinsertbook.jsp" method="post" id="form1">
	<table align="center" cellpadding="10" cellspacing="10" width="100%">
		<tr align="center">
			<td>
				书名<input type="text" name="bookname" id="bookname"/>
				<div id="booknameError" style="display:inline;color:red;"></div>
			</td>
		</tr>
		<tr align="center">
			<td>
				价格<input type="text" name="price" id="price"/>
				<div id="priceError" style="display:inline;color:red;"></div>
			</td>
		</tr>
		<tr align="center">
			<td>
				作者<input type="text" name="author" id="author"/>
				<div id="authorError" style="display:inline;color:red;"></div>
			</td>
		</tr>
		<tr align="center">
			<td>
				封皮<input type="text" name="pic" id="pic"/>
				<div id="picError" style="display:inline;color:red;"></div>
			</td>
		</tr>
		<tr align="center">
			<td>
				出版社<input type="text" name="publish" id="publish"/>
				<div id="publishError" style="display:inline;color:red;"></div>
			</td>
		</tr>
		<tr align="center"> 
			<td>
				<input type="submit" value="添加">
				<input type="reset" value="重置">
				<a href="admin.jsp">管理界面</a>
			</td>
		</tr>
	</table>	
</form>
</body>
</html>