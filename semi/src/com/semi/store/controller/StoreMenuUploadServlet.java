package com.semi.store.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.store.model.vo.Store;
import com.semi.store.model.vo.StoreMenu;
import com.semi.store.service.StoreMenuService;
import com.semi.store.service.StoreService;

/**
 * Servlet implementation class StoreMenuUploadServlet
 */
@WebServlet("/store/menuUpload") //매핑값ok
public class StoreMenuUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StoreMenuUploadServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		int storeId = Integer.parseInt(request.getParameter("selectedStoreId"));//잘가져옴
		
		//System.out.println("storeId in servlet: " + storeId);
		
		Store s = new StoreService().selectStoreDtl(storeId);
		
		System.out.println("서블릿 store: "+ s);
		
		
		request.setAttribute("StoreMenu", s);
		//ajax
		request.getRequestDispatcher("/views/store/menuUploadAjax.jsp")
		.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
