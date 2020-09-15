package com.semi.store.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.store.model.vo.Store;
import com.semi.store.service.StoreService;

/**
 * Servlet implementation class StoreListServlet
 */
@WebServlet("/store/storeList")
public class StoreListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cPage;
		int pageBarSize;
		try{
			cPage=Integer.parseInt(request.getParameter("cPage"));
			pageBarSize=Integer.parseInt(request.getParameter("numPerPage"));
		}catch(NumberFormatException e) {
			cPage=1;
			pageBarSize=5;
		}
		
		int numPerPage; 
		try {
			numPerPage = Integer.parseInt(request.getParameter("numPerPage"));
			
		}catch(NumberFormatException e) {
			numPerPage = 5;
		}
		
		
		
		
		
		List<Store> list = new StoreService().selectAllStoreList(cPage, numPerPage);
		
		int totalData=new StoreService().selectAllStoreCount();
		int totalPage=(int)(Math.ceil((double)totalData/numPerPage));
		
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		String pageBar="";//페이지바를 구성한 html구문을 누적 하는 변수
		if(pageNo==1) {
			pageBar="<span>[이전]</span>";
		}else {
			pageBar="<a href='"+request.getContextPath()+"/admin/memberList?cPage="+(pageNo-1)+"&numPerPage=" +numPerPage+"'>[이전]</a>";		
		}
		
		//연결되는 페이지 번호 출력하기
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<span>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getContextPath()+
						"/admin/memberList?cPage="+pageNo+"&numPerPage=" +numPerPage+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		
		//다음
		if(pageNo>totalPage) {
			pageBar+="<span>[다음]</span>";
			
		}else {
			pageBar+="<a href='"+request.getContextPath()+
					"/admin/memberList?cPage="+pageNo+"&numPerPage=" +numPerPage+"'>[다음]</a>";
		}
		
		request.setAttribute("stores", list);
		System.out.println("store: " + list);
		
		request.getRequestDispatcher("/views/store/storeList.jsp")
		.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
