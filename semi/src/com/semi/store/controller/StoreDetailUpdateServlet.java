package com.semi.store.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.semi.store.model.vo.Store;
import com.semi.store.service.StoreService;

/**
 * Servlet implementation class StoreDetailUpdateServlet
 */
@WebServlet("/store/storeDetailUpdate")
public class StoreDetailUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreDetailUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String savePath = getServletContext().getRealPath("/") + "img/store"; //다운받을 경로
		int uploadFileSizeLimit = 50 * 1080 * 1900; 
		String encType = "UTF-8";
		
		try {
			MultipartRequest multi = new MultipartRequest(request, savePath, uploadFileSizeLimit, encType, new DefaultFileRenamePolicy());
			
			Store s = new Store();
			
			String promoText = multi.getParameter("promoText");
			String mainImg = multi.getFilesystemName("mainImg");
			String postImg = multi.getFilesystemName("postImg");
			String detailImg = multi.getFilesystemName("detailImg");
			int storeId = Integer.parseInt(multi.getParameter("storeId"));
			
			System.out.println("promo: " + promoText);
			System.out.println("storeId123233: " + multi.getParameter("storeId"));
			
			
			//클라이언트로 부터 받은 이미지 가져오기 
			s.setStoreMainImg(mainImg);
			s.setStoreDtlImg(postImg);
			s.setStorePostImg(detailImg);
			s.setPromoText(promoText);
			s.setStoreId(storeId);
			
			System.out.println("S in jsp: " + s);
			int result=new StoreService().updateStoreImg(s);
			System.out.println("result in jsp: " + result);
			
			
			String msg="";
			String loc="/";
			
			if(result>0) {
				msg="이미지 업로드가 완료되었습니다. 등록된 이미지는 홈페이지에서 바로 확인가능합니다.";
				loc="/main.jsp"; 
			}else {
				msg="이미지 업로드에 실패했습니다. 관리자에게 문의해주시거나 다시 한 번 시도해주세요.";
				loc="/store/storeInfoUpdate?storeId=" + storeId;
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
