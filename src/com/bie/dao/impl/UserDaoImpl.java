package com.bie.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bie.dao.UserDao;
import com.bie.po.Book;
import com.bie.po.User;
import com.bie.utils.BaseDao;

/** 
* @author BieHongLi 
* @version 创建时间：2017年2月21日 上午10:38:56 
* 
*/
public class UserDaoImpl implements UserDao{

	@Override
	public User login(User user) {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			con=BaseDao.getCon();//1:获取数据库的连接
			//2:书写sql语句
			String sql="select * from user where name=? and password=? ";
			ps=con.prepareStatement(sql);//3：预编译
			//4：设置值
			ps.setString(1, user.getName());
			ps.setString(2, user.getPassword());
			rs=ps.executeQuery();//5:执行sql语句
			User users=null;
			if(rs.next()){
				users=new User();
				//从数据库中获取值设置到实体类的setter方法中
				users.setId(rs.getInt("id"));
				users.setName(rs.getString("name"));
				users.setPassword(rs.getString("password"));
				users.setEmail(rs.getString("email"));
				users.setPhone(rs.getString("phone"));
				user.setIsAdmin(rs.getString("isAdmin"));
				
				return user;
			}else{
				return null;
			}
			
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

	/***
	 * 插入的方法，即注册
	 */
	@Override
	public boolean register(User user) {
		String sql="insert into user(name,password,email,phone,isAdmin)  values(?,?,?,?,?) ";
		List<Object> list=new ArrayList<Object>();
		list.add(user.getName());
		list.add(user.getPassword());
		list.add(user.getEmail());
		list.add(user.getPhone());
		list.add(user.getIsAdmin());
		
		//后台设置权限默认为普通用户
		//user.setIsAdmin("0");
		//list.add(user.getIsAdmin());
		
		boolean flag=BaseDao.addUpdateDelete(sql,list.toArray());
		if(flag){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public List<User> selectUser(String sql, Object[] arr) {
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
			List<User> list=new ArrayList<User>();
			while(rs.next()){
				User user=new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setPassword(rs.getString("password"));
				user.setEmail(rs.getString("email"));
				user.setPhone(rs.getString("phone"));
				
				if("1".equals(rs.getString("isAdmin"))){
					user.setIsAdmin("管理员");
				}
				if("0".equals(rs.getString("isAdmin"))){
					user.setIsAdmin("普通会员");
				}
				
				//System.out.println(user);//测试数据
				list.add(user);
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
	public List<User> userPage(int page, int record) {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			con=BaseDao.getCon();//第一步连接数据库
			//第二步书写sql语句
			String sql="select * from user limit ?,? ";
			ps=con.prepareStatement(sql);//第三步：预编译
			//第几页需要设置好是页数减一乘以每页的记录数即是第多少页
			ps.setInt(1, (page-1)*record);
			ps.setInt(2, record);
			
			//第四步执行sql
			rs=ps.executeQuery();
			List<User> list=new ArrayList<User>();
			while(rs.next()){
				User user=new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setPassword(rs.getString("password"));
				user.setEmail(rs.getString("email"));
				user.setPhone(rs.getString("phone"));
				user.setIsAdmin(rs.getString("isAdmin"));
				
				list.add(user);
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
			String sql="select count(*) from user ";
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
	public boolean deleteUser(Integer id) {
		// TODO Auto-generated method stub
		String sql="delete from user where id=? ";
		List<Object> list=new ArrayList<Object>();
		list.add(id);
		boolean mark=BaseDao.addUpdateDelete(sql, list.toArray());
		if(mark){
			return true;
		}else{
			return false;
		}
	}

	
}
