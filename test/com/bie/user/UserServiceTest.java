package com.bie.user;

import java.util.List;

import org.junit.Test;

import com.bie.po.User;
import com.bie.service.impl.UserServiceImpl;

/** 
* @author BieHongLi 
* @version 创建时间：2017年2月23日 下午6:17:28 
* 
*/
public class UserServiceTest {

	private UserServiceImpl service=new UserServiceImpl();
	@Test
	public void select(){
		User user=new User();
		user.setName("admin");
		List<User> list=service.selectUser(user);
		for(User us:list){
			System.out.println(us);
		}
	}
	
	
}
