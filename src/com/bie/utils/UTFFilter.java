package com.bie.utils;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

/** 
* @author BieHongLi 
* @version 创建时间：2017年2月21日 上午11:08:49 
* 
*/
//@WebFilter("/*")   //必须为servlet3.0
public class UTFFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, 
			FilterChain filterChain)throws IOException, ServletException {
		//将servletRequest转发为HttpServletRequest
		HttpServletRequest request=(HttpServletRequest)servletRequest;
		request.setCharacterEncoding("utf-8");
		filterChain.doFilter(servletRequest, servletResponse);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}
	

}
