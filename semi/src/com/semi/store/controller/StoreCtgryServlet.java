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
 * Servlet implementation class StoreCtgryServlet
 */
@WebServlet("/store/storeCtgry")
public class StoreCtgryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreCtgryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("카테고리서블릿 실행");
		String category = request.getParameter("storeDtlCtgry");
		System.out.println("request.getParameter(\"storeDtlCtgry\"): " + request.getParameter("storeDtlCtgry"));
		System.out.println("category: "+ category);
		List<Store> list = new StoreService().selectStoreCtgry(category);
		System.out.println("list in servlet! : "+ list);
		
		request.setAttribute("stores",list);
		
		request.getRequestDispatcher("/views/store/storeList.jsp")
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

