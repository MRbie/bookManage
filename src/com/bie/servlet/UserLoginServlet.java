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

public class UserLoginServlet extends HttpServlet{

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
		//引入数据交互层
		User user=new User();
		UserDao dao=new UserDaoImpl();
		String name=request.getParameter("name");
		String password=request.getParameter("password");
		System.out.println(" 账号:" + name + ", 密码:" + password);
		
		String isAdmin=request.getParameter("isAdmin");
		user.setName(name);
		user.setPassword(password);
		user.setIsAdmin(isAdmin);
		
		User us=dao.login(user);
		
		HttpSession session = request.getSession();
		session.setAttribute("user",user);
		if(us != null){
			//如果是管理员跳转到管理员页面
			if(user.getIsAdmin().equals("1")){
				//out.println(us.getIsAdmin());
				response.sendRedirect("admin.jsp");
			}else if(user.getIsAdmin().equals("0")){
				//如果是普通会员，跳转到图书列表的页面
				//response.sendRedirect("book.jsp");
				
				Book book=new Book();
				BookDao bookDao=new BookDaoImpl();
				//2:获取从下面上一页下一页传来的参数p
				String p2=request.getParameter("p");
				
				//1:设置好第一页开始和一页有五条记录
				int p=1;
				int r=5;
				//5:获取到返回的总页数,将每页的总记录数传进去
				int count=bookDao.getCount(r);
				
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
				List<Book> list=bookDao.bookPage(p, r,book);
				request.setAttribute("list",list);
				request.getRequestDispatcher("/book.jsp").forward(request, response);
			}
		}else{
			response.sendRedirect("login.jsp");
			//out.println("登录失败");
		}
	}

		
}
