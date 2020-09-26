package com.semi.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.mypage.model.service.PtnStoreListService;
import com.semi.store.model.vo.Store;



/**
 * Servlet implementation class PtnStoreListServlet
 */
@WebServlet("/ptnstorelist")
public class MovePtnStoreListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovePtnStoreListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
		int ptnId=Integer.parseInt(request.getParameter("no"));
		
		
		
		System.out.println("Move PtnStoreListServlet 서블릿 실행");
		int cPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		int numPerPage;
//		System.out.println("cpage: " + cPage);
		try {
			numPerPage=Integer.parseInt(request.getParameter("numPerPage"));
		}catch(NumberFormatException e) {
			//보여줄 페이지 갯수
			numPerPage=5;
		}
		
		List<Store> list = new PtnStoreListService().selectPtnStoreList(cPage,numPerPage, ptnId);		
		System.out.println("list in sevlet: " + list);				
		int pageBarSize=5;		
		int totalData = new PtnStoreListService().PtnStoreListCount();	
		int totalPage = (int)(Math.ceil((double)totalData/numPerPage));
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;	
		
		String pageBar = "";
		//이전
		if(pageNo==1) {
			pageBar="<span> ◀ </span>";
		}else {
			pageBar="<a href='"+request.getContextPath()
			+"/ptnstorelist?no="+ptnId+"&cPage="+(pageNo-1)+"'> ◀ </a>";		
		}
		//연결되는 페이지 번호 출력
		while(!(pageNo>pageEnd||pageNo>totalPage)){
			if(cPage==pageNo) {
				pageBar+="<span>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getContextPath()+
						"/ptnstorelist?no="+ptnId+"&cPage="+pageNo +">"+pageNo+"</a>";//pageNo왜 두번이에여? 두개에요?아 착각햇다			
			}
			pageNo++;
		}
		System.out.println("pageNo: " + pageNo + ": " + totalPage);
		//다음
		if(pageNo>totalPage) {
			
//				pageBar+="<span> ▶▶▶▶▶▶  </span>";
		}else {
//			pageBar+="<a href='"+request.getContextPath()+
//					"/ptnstorelist?no="+ptnId+"&cPage="+pageNo+"'> ▶ </a>";
		}
	
		request.setAttribute("list", list);
		request.setAttribute("pageBar", pageBar);
		
		//페이지 이동
		request.getRequestDispatcher("/views/mypage/partnerStoreList.jsp").forward(request,response);
	
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
