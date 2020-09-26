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
 * Servlet implementation class StroeEnrollEndServlet
 */
@WebServlet("/ptn/storeEnrollEnd")
public class StoreEnrollEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreEnrollEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Store store=new Store();
		
		store.setStoreCategory(request.getParameter("category"));
		store.setStoreDtlCtgry(request.getParameter("ra"));
		store.setStoreName(request.getParameter("storeName"));
		store.setStorePhone(request.getParameter("storePhone"));
		
		
		store.setStorePost(request.getParameter("storePost"));
		store.setStoreAddress(request.getParameter("storeAddr"));
		store.setStoreDtlAddr(request.getParameter("storeDtlAddr"));
		store.setStoreExtraAddr(request.getParameter("storeExtraAddr"));
		store.setStoreContent(request.getParameter("storeContent"));
		store.setStorePage(request.getParameter("storePage"));
		
		System.out.println("11111" +request.getParameterValues("storeProfit")[0]);
		store.setStoreProfit(request.getParameterValues("storeProfit")[0]);
		store.setStoreTarget(request.getParameterValues("storeTarget")[0]);
		store.setPtnNum(Integer.parseInt(request.getParameter("ptnId")));
		
		int pNum =Integer.parseInt(request.getParameter("ptnId")); 
		
		System.out.println("store in servlet: "+ store);
		int result=new StoreService().insertStore(store);
		

		String msg="";
		String loc="/";
		if(result>0) {
			 msg="입점신청이 완료되었습니다. 신청 현황은 마이페이지에서 확인가능합니다.";
			//이미지 등록페이지로 이동
			loc="/ptnstorelist?no=" + pNum;
		}else {
			msg="입력하신 데이터에 오류가 발생했습니다. 입점 신청을 다시 시도해주세요";
			//신청폼 다시
			loc="/storeEnroll";
		}
		String storeName = request.getParameter("storeName");
		String storeContent = request.getParameter("storeContent");
		
		
		request.setAttribute("storeName", storeName);
		request.setAttribute("storeContent",storeContent);
		
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp") //입점신청현황으로 이동해야함
		.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
