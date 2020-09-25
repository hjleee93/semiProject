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
@WebServlet("/store/storeDetailUpdate") //ok
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
			String storeName = multi.getParameter("storeName");
			String storePhone = multi.getParameter("storePhone");
			String storePost = multi.getParameter("storePost");
			String storeAddr = multi.getParameter("storeAddr");
			String storeDtlAddr = multi.getParameter("storeDtlAddr");
			String storeExtraAddr = multi.getParameter("storeExtraAddr");
			String storeContent = multi.getParameter("storeContent");
			int ptnId = Integer.parseInt(multi.getParameter("ptnNum"));
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
			s.setStoreName(storeName);
			s.setStorePost(storePost);
			s.setStoreAddress(storeAddr);
			s.setStoreDtlAddr(storeDtlAddr);
			s.setStoreExtraAddr(storeExtraAddr);
			s.setStoreContent(storeContent);
			s.setPtnNum(ptnId);
			s.setStorePhone(storePhone);
			
			
			System.out.println("S in jsp: " + s);
			int result=new StoreService().updateStoreImg(s);
			System.out.println("result in jsp: " + result);
			
			
			String msg="";
			String loc="/";
			
			request.setAttribute("storeId",storeId);
			System.out.println("s in 3" + s);
			if(result>0) {
				msg="이미지 업로드가 완료되었습니다. 서비스예약 설정 페이지로 이동합니다.";
				loc="/storeService/storeRsvSetting?storeId=" + storeId; //ok
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
