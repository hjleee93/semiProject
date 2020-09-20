package com.semi.admin.move.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.admin.store.service.StoreService;
import com.semi.admin.store.vo.Store;
import com.semi.admin.store.service.StoreService;
import com.semi.admin.store.vo.Store;

/**
 * Servlet implementation class AdminMyPageServlet
 */
@WebServlet("/adminpage")
public class AdminMoveMyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMoveMyPageServlet() {
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
		
		List<Store> list = new StoreService().selectStoreList(page,numPerPage);

		int totalData = new StoreService().selectStoreCount();
		
		int totalPage=(int)(Math.ceil((double)totalData/numPerPage));
		
		int pageBarSize = 5;
		int pageNo=((page-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		String pageBar="";
		if(pageNo==1) {
			pageBar="<span>[이전]</span>";
		}else {
			pageBar="<a href='"+request.getContextPath()+"/notice?page="+(pageNo-1)+"'>[이전]</a>";
			
		}
		while(!(pageNo>pageEnd || pageNo>totalPage)) {
			if(pageNo==page) {
				pageBar+="<span>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getContextPath()
				+"/notice?page="+(pageNo)+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo>totalPage) {
			pageBar+="<span>[다음]</span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()
			+"/notice?page="+(pageNo)+"'>[다음]</a>";
		}
	
		int count = new StoreService().selectWaitingCount();
		request.setAttribute("waitingCount", count);
		request.setAttribute("list", list);
		request.setAttribute("pageBar", pageBar);
		
		
		RequestDispatcher rd= request.getRequestDispatcher("/views/admin/adminMyPage.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
