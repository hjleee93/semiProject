package com.semi.admin.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.admin.notice.service.NoticeService;
import com.semi.admin.notice.vo.Notice;

/**
 * Servlet implementation class NoticeModifyServlet
 */
@WebServlet("/notice/modify")
public class NoticeModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int no = Integer.parseInt(request.getParameter("no"));
		
		Cookie[] cookies = request.getCookies();
		String NoticeHistory="";
		boolean hasRead=false;//읽었으면 true, 안읽었음 false;
		
		if(cookies!=null) {
			for(Cookie c : cookies) {
				String name = c.getName();
				String value=c.getValue();
				if("NoticeHistory".equals(name)) {
					NoticeHistory=value;
					if(value.contains("|"+no+"|")) {
						hasRead=true;
						break;
					}
				}
						
			}
		}
			
		if(!hasRead) {
			Cookie c = new Cookie("NoticeHistory",NoticeHistory+"|"+no+"|");
			c.setMaxAge(-1);
			response.addCookie(c);
		}
		Notice n = new NoticeService().selectNoticeOne(no,hasRead);
		
		request.setAttribute("notice", n);
		
		request.getRequestDispatcher("/views/admin/notice/adminNoticeModify.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
