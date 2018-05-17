package com.bie.service;

import java.util.List;

import com.bie.po.User;

/** 
* @author BieHongLi 
* @version 创建时间：2017年2月23日 下午1:58:59 
* 
*/
public interface UserService {

	/***
	 * 用户查询的信息
	 * @param user
	 * @return
	 */
	public List<User> selectUser(User user);
}
