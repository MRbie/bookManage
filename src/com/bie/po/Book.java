package com.bie.po;

import java.io.Serializable;

/** 
* @author BieHongLi 
* @version 创建时间：2017年2月23日 上午10:19:08 
* 图书的实体类
*/
public class Book implements Serializable{

	
	private static final long serialVersionUID = 1L;
	private Integer bookid;
	private String bookname;
	private Double price;
	private String author;
	private String pic;
	private String publish;
	public Integer getBookid() {
		return bookid;
	}
	public void setBookid(Integer bookid) {
		this.bookid = bookid;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public String getPublish() {
		return publish;
	}
	public void setPublish(String publish) {
		this.publish = publish;
	}
	//重写toString()方法
	@Override
	public String toString() {
		return "Book [bookid=" + bookid + ", bookname=" + bookname + ", price=" + price + ", author=" + author
				+ ", pic=" + pic + ", publish=" + publish + "]";
	}
	 
	 
}
