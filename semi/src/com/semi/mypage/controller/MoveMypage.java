package com.semi.mypage.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.admin.store.service.StoreService;
import com.semi.mypage.model.service.PtnStoreListService;

/**
 * Servlet implementation class MovePtnpage
 */
@WebServlet("/partnerpage")
public class MoveMypage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MoveMypage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		//count
		int count = new PtnStoreListService().selectWaitingCount();
		request.setAttribute("mypageCount", count);
		int count2 = new PtnStoreListService().selectWaitingCount2();
		request.setAttribute("mypageCount2", count2);
		
		
		
		
		RequestDispatcher rd= request.getRequestDispatcher("/views/mypage/mypage_partner.jsp");
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
