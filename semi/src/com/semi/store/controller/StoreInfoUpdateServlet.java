package com.semi.store.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.store.model.vo.Store;
import com.semi.store.service.StoreService;

/**
 * Servlet implementation class StoreInfoUpdateServlet
 */
@WebServlet("/store/storeInfoUpdate")
public class StoreInfoUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreInfoUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int storeId = Integer.parseInt(request.getParameter("storeId"));
		
		System.out.println("storeId in servlet: " + storeId);
		
		Store s = new StoreService().selectStoreDtl(storeId);
		System.out.println("서블릿 store: "+ s);
		
		request.setAttribute("store",s);
		
		request.getRequestDispatcher("/views/partner/ptnRequest2.jsp")
		.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
