package com.semi.qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import com.semi.qna.model.service.QnaService;
import com.semi.qna.model.vo.Qna;

/**
 * Servlet implementation class WriteNoticeServlet
 */
@WebServlet("/qna/qnaWrite")
public class WriteQnaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteQnaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "문의사항이 등록되었습니다.");
			request.setAttribute("loc", "/Qna");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		System.out.println(getServletContext().getRealPath("/"));
		
		String path=getServletContext().getRealPath("/")+"upload/qna";		
		//String path=getServletContext().getRealPath("/upload/qna");
		int maxSize=1024*1024*10;
		String encode="UTF-8";
		
		//MultipartRequest mr = new MultipartRequest(request,path,maxSize,"UTF-8",new DefaultFileRenamePolicy());
		MultipartRequest mr=new MultipartRequest(request, path, maxSize
				,encode,new DefaultFileRenamePolicy());
					
		Qna n = new Qna();
		n.setQnaTitle(mr.getParameter("title"));
		n.setQnaSep(mr.getParameter("sep"));
		n.setQnaWriter(mr.getParameter("writer"));
		n.setQnaContent(mr.getParameter("content"));
//		n.setQnaOriginalFileName(mr.getOriginalFileName("upfile"));
//		n.setQnaRenamedFileName(mr.getFilesystemName("upfile"));
		
		
		System.out.println("list in servlet: "+n);
		
		int result = new QnaService().insertQna(n);
		
		String msg="";
		String loc="";
		if(result>0) {
			msg="QNA 등록이 완료되었습니다.";
			loc="/qna";
		}else {
			msg="QNA 등록에 실패하였습니다. 관리자에게 문의해주시거나 카카오톡으로 문의 해주세요";
			loc="/qna/writeQna";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

