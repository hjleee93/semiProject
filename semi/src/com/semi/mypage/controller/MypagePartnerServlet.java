package com.semi.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.mypage.model.service.PtnStoreListService;
import com.semi.store.model.vo.Store;

/**
 * Servlet implementation class MypageCustomerServlet
 */
@WebServlet("/mypagepartner")
public class MypagePartnerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypagePartnerServlet() {
        super();
        // TODO Auto-generated constructor stub
    
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		
	List<Store> list = new PtnStoreListService().selectPtnStoreList();
	
	System.out.println("mypageptnsevlet"+list);
	request.setAttribute("store",list);
		
	RequestDispatcher rd=request.getRequestDispatcher("/views/mypage/mypage_partner.jsp");
	rd.forward(request, response);
	
	
	
		
	//저거 마이페이지 jsp 바꾼거 있어요?저긴 없져? 
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
