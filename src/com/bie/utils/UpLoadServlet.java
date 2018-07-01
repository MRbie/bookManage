package com.bie.utils;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@WebServlet("/system/upload")
@MultipartConfig
public class UpLoadServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//将表单中的数据封装到Product中，测试使用，其他没有作用
		//Product product=RequestBeanUtils.requestToSimpleBean(request, Product.class);
		//System.out.println(product);
		try{
			request.setCharacterEncoding("utf-8");
			//获取上传文件
			Part file=request.getPart("productimg");
			//请求头信息
			String name=file.getHeader("content-disposition");
			//获取上传文件的真实目录
			String root=request.getServletContext().getRealPath("/upload");
			//获取文件的后缀
			String str=name.substring(name.lastIndexOf("."),name.length()-1);
			//System.out.println(str);
			
			//生成一个新的文件名,UUID生成的随机的是不会重复的值
			String fname=UUID.randomUUID().toString()+str;
			//后加的，上传的图片名称保存到域中
			//request.setAttribute("fname", fname);
			
			String filename=root+"\\"+fname;
			//System.out.println(filename);
			
			//上传文件到指定目录
			file.write(filename);
			//把上传的文件名返回到页面
			response.setContentType("text/text");
			response.setCharacterEncoding("utf-8");
			PrintWriter out=response.getWriter();
			out.println(fname);
			out.flush();
			out.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

}
