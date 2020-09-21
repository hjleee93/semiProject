package com.semi.recommand.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.recommand.service.StoreRandomService;
import com.semi.store.model.vo.Store;

/**
 * Servlet implementation class StoreRandomServlet
 */
@WebServlet("/random")
public class StoreRandomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreRandomServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
		Store m=new StoreRandomService().selectRandomStore();
		Store m2=new StoreRandomService().selectRandomPub();
		Store m3=new StoreRandomService().selectRandomRes();
		
	//	System.out.println(m);
	//	System.out.println(m1);
	//	System.out.println(m2);
		
		request.getRequestDispatcher("/views/recommand/random_store.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
