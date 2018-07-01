package com.bie.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bie.dao.BookDao;
import com.bie.dao.UserDao;
import com.bie.dao.impl.BookDaoImpl;
import com.bie.dao.impl.UserDaoImpl;
import com.bie.po.Book;
import com.bie.po.User;

public class BookInsertServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//从页面获取插入的值
		String bookname=request.getParameter("bookname");	
		String price=request.getParameter("price");	
		String author=request.getParameter("author");	
		String pic=request.getParameter("pic");	
		String publish=request.getParameter("publish");	

		Book book=new Book();
		//将页面获取的值设置到set方法中
		book.setBookname(bookname);
		book.setAuthor(author);
		Double price2=Double.parseDouble(price);
		book.setPrice(price2);
		book.setPic(pic);
		book.setPublish(publish);
		
		
		BookDao dao=new BookDaoImpl();
		boolean mark=dao.insertBook(book);
		request.setAttribute("book", book);
		if(mark){
			request.setAttribute("show", "插入信息成功");
		}else{
			request.setAttribute("show", "插入信息失败");
		}
		request.getRequestDispatcher("show.jsp").forward(request, response);
	}

		
}
