package com.semi.store.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.semi.store.model.vo.Store;
import com.semi.store.service.StoreService;

@WebServlet("/store/storeInputImg")
public class StoreInputImgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreInputImgServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("storeId= " + request.getParameter("storeId"));
		int storeId = Integer.parseInt(request.getParameter("storeId"));
				//이미지저장
	//	PrintWriter out = response.getWriter();
		getServletContext().getRealPath("/"); 
		
		
		System.out.println("절대경로 : " + getServletContext().getRealPath("/"));
		
		String savePath = getServletContext().getRealPath("/") + "img/store"; //다운받을 경로
		int uploadFileSizeLimit = 50 * 1080 * 1900; 
		String encType = "UTF-8";
		
		
		
		try {
		MultipartRequest multi = new MultipartRequest(request, savePath, uploadFileSizeLimit, encType, new DefaultFileRenamePolicy());
		
		String mainImg = multi.getFilesystemName("mainImg");
		String postImg = multi.getFilesystemName("postImg");
		String detailImg = multi.getFilesystemName("detailImg");


		Store s = new Store();
		
		//클라이언트로 부터 받은 이미지 가져오기 
		s.setStoreMainImg(mainImg);
		s.setStoreDtlImg(postImg);
		s.setStorePostImg(detailImg);
		
		int result=new StoreService().updateStoreImg(s);
		
		
		String msg="";
		String loc="/";
		
		if(result>0) {
			msg="입점신청이 완료되었습니다.";
			//입점신청현황으로 이동
			//loc=""; 
		}else {
			msg="입점신청에 실패했습니다. 관리자에게 문의하시거나 다시 시도해주세요.";
			//loc="/partner/storeEnroll";
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
