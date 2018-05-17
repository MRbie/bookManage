package com.bie.service;

import java.util.List;

import com.bie.po.Book;

/** 
* @author BieHongLi 
* @version 创建时间：2017年2月23日 上午10:56:42 
* 
*/
public interface BookService {

	/***
	 * 图书信息查询的方法
	 * @return
	 */
	public List<Book> select(Book book);
	
	/***
	 * 根据id进行查询
	 * @param id
	 * @return
	 */
	public Book getBook(Book book);
}
