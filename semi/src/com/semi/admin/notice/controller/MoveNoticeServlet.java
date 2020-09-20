package com.semi.admin.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.admin.notice.service.NoticeService;
import com.semi.admin.notice.vo.Notice;

/**
 * Servlet implementation class MoveNoticeServlet
 */
@WebServlet("/notice")
public class MoveNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MoveNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int page;
		try {
			page=Integer.parseInt(request.getParameter("page"));
		}catch(NumberFormatException e) {
			page=1;
		}
		int numPerPage=5;
		
		List<Notice> list = new NoticeService().selectNoticeList(page,numPerPage);
		
		int totalData = new NoticeService().selectNoticeCount();
		
		int totalPage = (int)(Math.ceil((double)totalData/numPerPage));
		
		int pageBarSize=5;
		int pageNo=((page-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		String pageBar = "";
		if(pageNo==1) {
			pageBar="<span> ◀ </span>";
		}else {
			pageBar="<a href='"+request.getContextPath()+"/notice?page="+(pageNo-1)+"'> ◀ </a>";
		}
		while(!(pageNo>pageEnd||pageNo>totalPage)){
			if(pageNo==page) {
				pageBar+="<span class='num'>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getContextPath()+"/notice?page="+(pageNo)+"' class='num'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo>totalPage) {
				pageBar+="<span> ▶ </span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()+"/notice?page="+(pageNo)+"'> ▶ </a>";
		}
	
		request.setAttribute("totalData", totalData);
		request.setAttribute("list", list);
		request.setAttribute("pageBar", pageBar);
		
		request.getRequestDispatcher("/views/admin/notice/adminNoticeBoard.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
