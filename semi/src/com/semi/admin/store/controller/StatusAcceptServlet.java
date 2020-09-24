package com.semi.admin.store.controller;

import java.io.IOException;
import java.util.Arrays;

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
//		int id = Integer.parseInt(request.getParameter("storeId").trim());

		  String[] idArr=request.getParameterValues("storeId");
		  
		 
//		  int id = 0; 
//		  if(nums!=null) { 
//			  for(int i=0;i<nums.length;i++) { 
//				  id = nums[i];
//			
//		  } 
//		  }
		
//		  String[] idArr = request.getParameterValues("storeId");
//		  Store s = new store();
//		  
		int result = new StoreService().updateStoreStatus(idArr);
		
//////		List<Store> updateList = new storeService().updateListStatus();
		String msg="";
		String loc="/admin/StoreRequestStatus";
		
		if(result>0) {
			msg="입점 승인되었습니다.";
		}else {
			msg="승인처리가 정상적으로 수행되지 않았습니다.";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
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
