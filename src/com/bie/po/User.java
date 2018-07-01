package com.bie.po;

import java.io.Serializable;

/** 
* @author BieHongLi 
* @version 创建时间：2017年2月21日 上午9:59:03 
* 用户的实体类
*/
public class User implements Serializable{
	
	//增加序列号
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String name;
	private String password;
	private String email;
	private String phone;
	
	private String isAdmin;//用于判断是否是管理员,1为管理员，0为普通人
	
	public String getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", password=" + password + ", email=" + email + ", phone=" + phone
				+ ", isAdmin=" + isAdmin + "]";
	}
	
	
}
