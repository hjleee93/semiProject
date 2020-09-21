package com.semi.admin.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.semi.admin.notice.service.NoticeService;
import com.semi.admin.notice.vo.Notice;

/**
 * Servlet implementation class WriteNoticeServlet
 */
@WebServlet("/admin/noticeWrite")
public class WriteNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "[※enctype※], 관리자에게 문의하세요.");
			request.setAttribute("loc", "/notice");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		String path=getServletContext().getRealPath("/upload/notice");
		int maxSize=1024*1024*10;
		
		MultipartRequest mr = new MultipartRequest(request,path,maxSize,"UTF-8",new DefaultFileRenamePolicy());
		
		Notice n = new Notice();
		n.setNoticeTitle(mr.getParameter("title"));
		n.setNoticeSep(mr.getParameter("sep"));
		n.setNoticeWriter(mr.getParameter("writer"));
		n.setFile(mr.getFilesystemName("file"));
		n.setNoticeContent(mr.getParameter("content"));
		
		System.out.println("list in servlet: "+n);
		
		int result = new NoticeService().insertNotice(n);
		
		String msg="";
		String loc="/notice";
		if(result>0) {
			msg="글등록이 완료되었습니다.";
		}else {
			msg="글등록이 정상적으로 수행되지않았습니다.";
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
