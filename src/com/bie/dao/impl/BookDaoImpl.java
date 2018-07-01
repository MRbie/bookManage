package com.bie.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bie.dao.BookDao;
import com.bie.po.Book;
import com.bie.utils.BaseDao;

/** 
* @author BieHongLi 
* @version 创建时间：2017年2月23日 上午10:24:02 
* 
*/
public class BookDaoImpl implements BookDao{

	@Override
	public List<Book> select(String sql, Object[] arr) {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			con=BaseDao.getCon();//第一步连接数据库
			ps=con.prepareStatement(sql);//第二步：预编译
			if(arr!=null){
				for(int i=0;i<arr.length;i++){
					ps.setObject(i+1, arr[i]);
				}
			}
			//第四步执行sql
			rs=ps.executeQuery();
			List<Book> list=new ArrayList<Book>();
			while(rs.next()){
				Book book=new Book();
				book.setBookid(rs.getInt("bookid"));
				book.setBookname(rs.getString("bookname"));
				book.setPrice(rs.getDouble("price"));
				book.setAuthor(rs.getString("author"));
				book.setPic(rs.getString("pic"));
				book.setPublish(rs.getString("publish"));
				
				list.add(book);
			}
			return list;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			//关闭资源，避免出现异常
			BaseDao.close(con, ps, rs);
		}
		
		return null;
	}

	@Override
	public Book getBook(Integer id) {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			con=BaseDao.getCon();//第一步连接数据库
			String sql="select * from book where bookid = ? ";
			ps=con.prepareStatement(sql);//第二步：预编译
			ps.setInt(1, id);
			
			//第四步执行sql
			rs=ps.executeQuery();
			while(rs.next()){
				Book books=new Book();
				books.setBookid(rs.getInt("bookid"));
				books.setBookname(rs.getString("bookname"));
				books.setPrice(rs.getDouble("price"));
				books.setAuthor(rs.getString("author"));
				books.setPic(rs.getString("pic"));
				books.setPublish(rs.getString("publish"));
				
				return books;
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			//关闭资源，避免出现异常
			BaseDao.close(con, ps, rs);
		}
		
		return null;
	}

	@Override
	public List<Book> bookPage(int page, int record) {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			con=BaseDao.getCon();//第一步连接数据库
			//第二步书写sql语句
			String sql="select * from book limit ?,? ";
			ps=con.prepareStatement(sql);//第三步：预编译
			//第几页需要设置好是页数减一乘以每页的记录数即是第多少页
			ps.setInt(1, (page-1)*record);
			ps.setInt(2, record);
			
			//第四步执行sql
			rs=ps.executeQuery();
			List<Book> list=new ArrayList<Book>();
			while(rs.next()){
				Book book=new Book();
				book.setBookid(rs.getInt("bookid"));
				book.setBookname(rs.getString("bookname"));
				book.setPrice(rs.getDouble("price"));
				book.setAuthor(rs.getString("author"));
				book.setPic(rs.getString("pic"));
				book.setPublish(rs.getString("publish"));
				
				list.add(book);
			}
			return list;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			//关闭资源，避免出现异常
			BaseDao.close(con, ps, rs);
		}
		
		return null;
	}

	@Override
	public int getCount(int record) {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		//设置初始值为-1
		int n=-1;
		try {
			con=BaseDao.getCon();//第一步连接数据库
			//第二步书写sql语句
			String sql="select count(*) from book ";
			ps=con.prepareStatement(sql);//第三步：预编译
			
			//第四步执行sql
			rs=ps.executeQuery();
			if(rs.next()){
				//获取第一条记录，因为查询count(1)就一条记录，获取即可,即总记录数
				n=rs.getInt(1);
				//将总记录数除以每页的总记录数然乎向上取整即可
				n=(int)Math.ceil(1.0*n/record);
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			//关闭资源，避免出现异常
			BaseDao.close(con, ps, rs);
		}
		
		return n;
	}

	@Override
	public boolean insertBook(Book book) {
		String sql="insert into book values(0,?,?,?,?,?)";
		List<Object> list=new ArrayList<Object>();
		list.add(book.getBookname());
		list.add(book.getPrice());
		list.add(book.getAuthor());
		list.add(book.getPic());
		list.add(book.getPublish());
		
		boolean mark=BaseDao.addUpdateDelete(sql, list.toArray());
		if(mark){
			return true;
		}else{
			return false;
		}
		
	}

	@Override
	public boolean updateBook(Book book) {
		String sql="update book SET bookname=?,price=?,author=?,pic=?,publish=? where bookid=? ";
		if(book!=null && book.getBookid()!=null){
			List<Object> list=new ArrayList<Object>();
			list.add(book.getBookname());
			list.add(book.getPrice());
			list.add(book.getAuthor());
			list.add(book.getPic());
			list.add(book.getPublish());
			
			list.add(book.getBookid());
			boolean mark=BaseDao.addUpdateDelete(sql, list.toArray());
			if(mark){
				return true;
			}else{
				return false;
			}
		}
		return false;
	}

	@Override
	public boolean deleteBook(Integer id) {
		String sql="delete from book where bookid=? ";
		List<Object> list=new ArrayList<Object>();
		list.add(id);
		boolean mark=BaseDao.addUpdateDelete(sql, list.toArray());
		if(mark){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public List<Book> bookPage(int page, int record, Book books) {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			con=BaseDao.getCon();//第一步连接数据库
			//第二步书写sql语句
			//String sql="select * from book limit ?,? ";
			if(books != null &&
					books.getBookname() != null && 
					!"".equals(books) && !"null".equals(books)){
				String sql="select * from book where bookname like '%"+ books.getBookname() +"%' limit ?,? ";
				ps=con.prepareStatement(sql);//第三步：预编译
				//第几页需要设置好是页数减一乘以每页的记录数即是第多少页
				//ps.setString(1, books.getBookname());
				ps.setInt(1, (page-1)*record);
				ps.setInt(2, record);
			}else{
				String sql="select * from book limit ?,? ";
				ps=con.prepareStatement(sql);//第三步：预编译
				//第几页需要设置好是页数减一乘以每页的记录数即是第多少页
				//ps.setString(1, books.getBookname());
				ps.setInt(1, (page-1)*record);
				ps.setInt(2, record);
			}
			
			
			
			//第四步执行sql
			rs=ps.executeQuery();
			List<Book> list=new ArrayList<Book>();
			while(rs.next()){
				Book book=new Book();
				book.setBookid(rs.getInt("bookid"));
				book.setBookname(rs.getString("bookname"));
				book.setPrice(rs.getDouble("price"));
				book.setAuthor(rs.getString("author"));
				book.setPic(rs.getString("pic"));
				book.setPublish(rs.getString("publish"));
				
				list.add(book);
			}
			return list;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			//关闭资源，避免出现异常
			BaseDao.close(con, ps, rs);
		}
		
		return null;
	}

	
}
