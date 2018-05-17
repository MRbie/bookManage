package com.bie.dao;

import java.util.List;

import com.bie.po.User;

/** 
* @author BieHongLi 
* @version 创建时间：2017年2月21日 上午10:38:40 
* 创建一个接口用于声明用户登陆注册的方法
*/
public interface UserDao {

	/***
	 * 用户登陆的方法声明
	 * @param user
	 * @return
	 */
	public User login(User user);
	
	/***
	 * 用户注册的方法声明
	 * @param user
	 * @return
	 */
	public boolean register(User user);
	
	/***
	 * 查询用户的信息
	 * @param sql
	 * @param arr
	 * @return
	 */
	public List<User> selectUser(String sql,Object[] arr);
}
