package com.semi.admin.search.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.admin.service.AdminService;
import com.semi.member.model.service.MemberService;
import com.semi.member.model.vo.Member;
import com.semi.partner.model.vo.PartnerMember;

/**
 * Servlet implementation class TestAdminMemberSearchServlet
 */
@WebServlet("/admin/search/member")
public class MoveAdminMemberSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MoveAdminMemberSearchServlet() {
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
		
		
		List<Member> list = new AdminService().selectMemberList(page,numPerPage);
		List<PartnerMember> listpm = new AdminService().selectPartnerList(page, numPerPage);
		
		int totalData = new AdminService().selectMemberCount();
		int totalPage=(int)(Math.ceil((double)totalData/numPerPage));
		/*
		 * int totalDataP= new AdminService().selectPartnerCount(); int
		 * totalPageP=(int)(Math.ceil((double)totalDataP/numPerPage));
		 */
		
		int pageBarSize = 5;
		int pageNo=((page-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		String pageBar = "";
		if(pageNo==1) {
			pageBar="<span> ◀ </span>";
		}else {
			pageBar="<a href='"+request.getContextPath()+"/admin/search/member?page="+(pageNo-1)+"'> ◀ </a>";
		}
		while(!(pageNo>pageEnd||pageNo>totalPage)){
			if(pageNo==page) {
				pageBar+="<span class='num'>"+pageNo+"</span>";
			}else {
				pageBar+="<a class='num' href='"+request.getContextPath()+"/admin/search/member?page="+(pageNo)+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo>totalPage) {
				pageBar+="<span> ▶ </span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()+"/admin/search/member?page="+(pageNo)+"'> ▶ </a>";
		}
	
		
		request.setAttribute("list", list);
		request.setAttribute("listpm", listpm);
		request.setAttribute("pageBar", pageBar);
		
		request.getRequestDispatcher("/views/admin/search/MemberSearch.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
