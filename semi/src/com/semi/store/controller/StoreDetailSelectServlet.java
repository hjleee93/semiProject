package com.semi.store.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.store.model.vo.Store;
import com.semi.store.service.StoreService;

/**
 * Servlet implementation class StoreDetailSelectServlet
 */
@WebServlet("/store/storeDetailSelect")
public class StoreDetailSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreDetailSelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int ptnId = Integer.parseInt(request.getParameter("ptnId"));
		
		List<Store> storeList = new StoreService().selectStoreListByPartner(ptnId);
		System.out.println("storeList : " + storeList);
		
		request.getRequestDispatcher("/views/store/storeDetailSelect.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
