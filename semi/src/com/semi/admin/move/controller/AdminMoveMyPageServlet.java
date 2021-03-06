package com.semi.admin.move.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.admin.service.AdminService;
import com.semi.admin.store.service.StoreService;
import com.semi.qna.model.service.QnaService;
import com.semi.qna.model.vo.Qna;
import com.semi.store.model.vo.Store;

/**
 * Servlet implementation class AdminMyPageServlet
 */
@WebServlet("/admin/adminpage")
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
		
		int numPerPage=1000;
		//입점현황 팝업
		List<Store> list = new StoreService().selectStoreList(page,numPerPage);

		int totalData = new StoreService().selectStoreCount();
		
		int totalPage=(int)(Math.ceil((double)totalData/numPerPage));
		
		int pageBarSize = 5;
		int pageNo=((page-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		String pageBar="";
		if(pageNo==1) {
			pageBar="<span> ◀ </span>";
		}else {
			pageBar="<a href='"+request.getContextPath()+"/adminpage?page="+(pageNo-1)+"'> ◀ </a>";
			
		}
		while(!(pageNo>pageEnd || pageNo>totalPage)) {
			if(pageNo==page) {
				pageBar+="<span>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getContextPath()
				+"/adminpage?page="+(pageNo)+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo>totalPage) {
			pageBar+="<span> ▶ </span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()
			+"/adminpage?page="+(pageNo)+"'> ▶ </a>";
		}
//		List<Qna> qnalist = new AdminService().selectQnaList();
		
		int count = new StoreService().selectWaitingCount();
		int qnacount = new AdminService().selectqnaCount();
		int reservationcount = new AdminService().selectrsvCount();
		//파트너 안됨.
		request.setAttribute("waitingCount", count);
		request.setAttribute("storelist", list);
		System.out.println("movemypage: "+list);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("qnacount", qnacount);
		request.setAttribute("reservationcount", reservationcount);
		
		
		
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
