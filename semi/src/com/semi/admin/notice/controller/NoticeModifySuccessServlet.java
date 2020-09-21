package com.semi.admin.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.admin.notice.service.NoticeService;
import com.semi.admin.notice.vo.Notice;

/**
 * Servlet implementation class NoticeModifySuccessServlet
 */
@WebServlet("/notice/modifySuccess")
public class NoticeModifySuccessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeModifySuccessServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Notice n = new Notice();
		n.setNoticeNo(Integer.parseInt(request.getParameter("no")));
		n.setNoticeTitle(request.getParameter("title"));
		n.setNoticeWriter(request.getParameter("writer"));
		n.setNoticeContent(request.getParameter("content"));
		
		int result = new NoticeService().modifyNotice(n);
		
		String msg="";
		String loc="";
		if(result>0) {
			msg="성공적으로 수정되었습니다.";
			loc="/notice";
		}else {
			msg="공지사항 수정에 실패했습니다.";
			loc="/notice";

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
