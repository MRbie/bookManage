package com.bie.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.bie.dao.UserDao;
import com.bie.dao.impl.UserDaoImpl;
import com.bie.po.User;
import com.bie.service.UserService;

/** 
* @author BieHongLi 
* @version 创建时间：2017年2月23日 下午1:59:36 
* 
*/
public class UserServiceImpl implements UserService{

	private UserDao dao=new UserDaoImpl();
	
	@Override
	public List<User> selectUser(User user) {
		//sql语句
		//String sql="select * from user ";
		StringBuilder sql=new StringBuilder("select * from user where 1=1 ");
		List<Object> list=new ArrayList<Object>();
		if(user!=null){
			//按照姓名查询
			if(user.getName()!=null && !user.getName().equals("")){
				sql.append(" and name = ? ");
				list.add(user.getName());
			}
			//按照email查询
			if(user.getEmail()!=null && !user.getEmail().equals("")){
				sql.append(" and email = ? ");
				list.add(user.getEmail());
			}
			
		}
		return dao.selectUser(sql.toString(), list.toArray());
	}

	
}
