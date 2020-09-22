package com.semi.admin.store.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.admin.store.service.StoreService;

/**
 * Servlet implementation class StatusAcceptServlet
 */
@WebServlet("/admin/store/accept")
public class StatusAcceptServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StatusAcceptServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String[] idArr=request.getParameterValues("storeId");
		
		int[] storeId = new int[idArr.length];
		for(int i=0;i<idArr.length;i++) {
			storeId[i]=Integer.parseInt(idArr[i]);
			System.out.println("idArr"+storeId[i]);
		}
		
//		int result = new StoreService().updateStoreStatus(storeId);
		
////		List<Store> updateList = new storeService().updateListStatus();
//		String msg="";
//		String loc="/admin/StoreRequestStatus";
//		
//		if(result>0) {
//			msg="업데이트 완료";
//		}else {
//			msg="null";
//		}
//		request.setAttribute("msg", msg);
//		request.setAttribute("loc", loc);
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
