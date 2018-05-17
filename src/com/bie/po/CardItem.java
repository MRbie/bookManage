package com.bie.po;

/**
 * @author BieHongLi
 * @version 创建时间：2017年2月25日 下午9:28:34 
 * 购物车的实体类
 */
public class CardItem {

	private Book book;//书本的实体类
	private int number;//数量

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

}
