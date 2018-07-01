package com.bie.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bie.dao.BookDao;
import com.bie.dao.impl.BookDaoImpl;
import com.bie.po.Book;

public class BookServletSelect extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Book book=new Book();
		BookDao dao=new BookDaoImpl();
		//2:获取从下面上一页下一页传来的参数p
		String p2=request.getParameter("p");
		String bookname=request.getParameter("bookname");
		book.setBookname(bookname);
		
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
		List<Book> list=dao.bookPage(p, r, book);
		request.setAttribute("list",list);
		request.getRequestDispatcher("/book.jsp").forward(request, response);
	}
	
}
