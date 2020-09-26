//package com.semi.mypage.controller;
//
//import java.io.IOException;
//import java.util.List;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import com.semi.mypage.model.service.PtnStoreListService;
//import com.semi.store.model.vo.Store;
//
//
//
///**
// * Servlet implementation class PtnStoreListServlet
// */
//@WebServlet("/ptnstorelist")
//public class PtnStoreListServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//       
//    /**
//     * @see HttpServlet#HttpServlet()
//     */
//    public PtnStoreListServlet() {
//        super();
//        // TODO Auto-generated constructor stub
//    }
//
//	/**
//	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//		
//		//페이징처리해서 보내기!!!!!!!!!!
//		int cPage;
//		try {
//			cPage=Integer.parseInt(request.getParameter("cPage"));
//		}catch(NumberFormatException e) {
//			cPage=1;
//		}
//		int numPerPage=5;
//		
//		
//		List<Store> list=new PtnStoreListService().selectPtnStoreList(cPage,numPerPage);
//		
//		
//		int totalData=new PtnStoreListService().PtnStoreListCount();
//		int totalPage=(int)(Math.ceil((double)totalData/numPerPage));
//		int pageBarSize=5;
//		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
//		int pageEnd=pageNo+pageBarSize-1;
//		
//		String pageBar="";
//		if(pageNo==1) {
//			pageBar="<span>이전</span>";
//		}else {
//			pageBar="<a href='"+request.getContextPath()+"/mypage/partnerStoreList?cPage="+(pageNo-1)+"'>이전</a>";
//		}
//		
//		while(!(pageNo>pageEnd||pageNo>totalPage)) {
//			if(pageNo==cPage) {
//				pageBar+="<span>"+pageNo+"</span>";
//			}else {
//				pageBar+="<a href='"+request.getContextPath()+"/mypage/partnerStoreList?cPage="+(pageNo)+"'>"+pageNo+"</a>";
//			}
//			pageNo++;
//		}
//		
//		if(pageNo>totalPage) {
//			pageBar+="<span>다음</span>";
//		}else {
//			pageBar+="<a href='"+request.getContextPath()+"/mypage/partnerStoreList?cPage="+(pageNo)+"'>다음</a>";
//		}
//		
//		
//		request.setAttribute("pageBar", pageBar);
//		request.setAttribute("list", list);
//		
//		request.getRequestDispatcher("/views/mypage/partnerStoreList.jsp")
//		.forward(request,response);
//	
//	}
//
//
//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}
//
//}
