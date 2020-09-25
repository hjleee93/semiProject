package com.semi.store.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.semi.store.model.vo.StoreMenu;
import com.semi.store.service.StoreMenuService;

/**
 * Servlet implementation class StoreMenuUploadServlet
 */
@WebServlet("/store/menuUploadEnd")
public class StoreMenuUploadEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreMenuUploadEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String savePath = getServletContext().getRealPath("/") + "img/store/menu"; //다운받을 경로
		int uploadFileSizeLimit = 50 * 1080 * 1900; 
		String encType = "UTF-8";
		
		try {
			MultipartRequest multi = new MultipartRequest(request, savePath, uploadFileSizeLimit, encType, new DefaultFileRenamePolicy());
			
			StoreMenu sm = new StoreMenu();
			
			int ptnId= Integer.parseInt(multi.getParameter("ptnId"));
			String menuName = multi.getParameter("menuName");
			int menuPrice = Integer.parseInt(multi.getParameter("menuPrice"));			
			int menuAmount = Integer.parseInt(multi.getParameter("menuAmount"));			
			String menuDetail = multi.getParameter("menuDetail");			
			String menuImg = multi.getParameter("menuImg");
			int storeId = Integer.parseInt(multi.getParameter("storeId"));
			
			sm.setMenuName(menuName);
			sm.setMenuPrice(menuPrice);
			sm.setMenuAmount(menuAmount);
			sm.setMenuDetail(menuDetail);
			sm.setMenuImg(menuImg);
			sm.setPtnId(ptnId);
			sm.setStoreId(storeId);
			
			int result = new StoreMenuService().insertStoreMenu(sm);
			
			String msg="";
			String loc="/";
			
			request.setAttribute("storeId", storeId);
			
			if(result>0) {
				msg="메뉴가 등록되었습니다. 마이페이지로 이동합니다.";
				
				loc="/ptnstorelist"; 
			}else {
				msg="메뉴등록에 실패했습니다. 관리자에게 문의해주시거나 다시 한 번 시도해주세요.";
				loc="/store/menuUpload?storeId=" + storeId;
			}
			
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			
			request.getRequestDispatcher("/views/common/msg.jsp")
			.forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
