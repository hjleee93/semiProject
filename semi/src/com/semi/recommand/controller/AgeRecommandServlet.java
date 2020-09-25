package com.semi.recommand.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.recommand.service.AgeRecommandService;
import com.semi.store.model.vo.Store;

/**
 * Servlet implementation class StoreRandomServlet
 */
@WebServlet("/ageRecommand")
public class AgeRecommandServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AgeRecommandServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		Store r0=new AgeRecommandService().selectTarget0();
		Store r1=new AgeRecommandService().selectTarget1();
		Store r2=new AgeRecommandService().selectTarget2();
		Store r3=new AgeRecommandService().selectTarget3();
		Store r4=new AgeRecommandService().selectTarget4();
		
		request.getRequestDispatcher("/views/recommand/age_store.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
