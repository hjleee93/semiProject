package com.semi.qna.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/qna/qnaFileDown")
public class QnaFileDownServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -9036871096745044543L;

	public QnaFileDownServlet() {
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		String path=getServletContext().getRealPath("/upload/qna");
		String oName=req.getParameter("oName");//원본이름
		String rName=req.getParameter("rName");//서버에 저장된 이름
		
		BufferedInputStream bis=new BufferedInputStream(new FileInputStream(path+"/"+rName));
		
		ServletOutputStream sos=resp.getOutputStream();
		BufferedOutputStream bos=new BufferedOutputStream(sos);
		
		//한글인코딩처리
		String header=req.getHeader("user-agent");
		boolean isMS=header.indexOf("Trident")!=-1||header.indexOf("MSIE")!=-1;
		String reName="";
		if(isMS) {
			reName=URLEncoder.encode(oName,"UTF-8");
			reName=reName.replaceAll("//+","%20");
		}else {
			reName=new String(oName.getBytes("UTF-8"),"ISO-8859-1");
		}
		
		resp.setContentType("application/octet-stream");
		resp.setHeader("Content-Disposition", "attachment;filename="+reName);
		
		int read=-1;
		while((read=bis.read())!=-1) {
			bos.write(read);
		}
		
		bos.close();
		bis.close();		
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req,resp);
	}
	
	
	
	
}
