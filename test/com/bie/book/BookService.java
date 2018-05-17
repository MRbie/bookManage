package com.bie.book;

import java.util.List;

import org.junit.Test;

import com.bie.po.Book;
import com.bie.service.impl.BookServiceImpl;

/** 
* @author BieHongLi 
* @version 创建时间：2017年2月23日 下午1:20:37 
* 
*/
public class BookService {

	private BookServiceImpl service=new BookServiceImpl();
	
	@Test
	public void select(){
		Book book=new Book();
		book.setBookid(1);
		List<Book> list=service.select(book);
		for(Book b:list){
			System.out.println(b);
		}
	}
}
