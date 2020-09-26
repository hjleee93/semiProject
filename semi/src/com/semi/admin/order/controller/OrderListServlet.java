package com.semi.admin.order.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.admin.order.service.OrderService;
import com.semi.admin.order.vo.Order;
import com.semi.admin.service.AdminService;
import com.semi.admin.store.service.StoreService;
import com.semi.member.model.vo.TotalMember;
import com.semi.store.model.vo.Store;
import com.semi.store.model.vo.StoreMenu;
import com.semi.store.service.StoreMenuService;

/**
 * Servlet implementation class OrderViewServlet
 */
@WebServlet("/admin/order")
public class OrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int page;
		try {
			page=Integer.parseInt(request.getParameter("page"));
		}catch(NumberFormatException e) {
			page=1;
		}
		int numPerPage=5;

		List<Order> orderlist = new OrderService().selectTotalOrderList(page,numPerPage);
		
		int totalData = new OrderService().selectOrderCount();
		
		int totalPage = (int)(Math.ceil((double)totalData/numPerPage));
		
		int pageBarSize=5;
		int pageNo=((page-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		String pageBar = "";
		if(pageNo==1) {
			pageBar="<span> ◀ </span>";
		}else {
			pageBar="<a href='"+request.getContextPath()+"/admin/order?page="+(pageNo-1)+"'> ◀ </a>";
		}
		while(!(pageNo>pageEnd||pageNo>totalPage)){
			if(pageNo==page) {
				pageBar+="<span class='num'>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getContextPath()+"/admin/order?page="+(pageNo)+"' class='num'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo>totalPage) {
				pageBar+="<span> ▶ </span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()+"/admin/order?page="+(pageNo)+"'> ▶ </a>";
		}
		
//		List<Store> storelist = new StoreService().selectStoreList(page,numPerPage);
//		int storeId=0;
//		for(Store s : storelist) {
//			storeId = s.getStoreId();
//		}
//		List<StoreMenu> storemenu = new StoreMenuService().selectStoreMenu(storeId);
		
		request.setAttribute("totalData", totalData);
		request.setAttribute("Orderlist", orderlist);
		request.setAttribute("pageBar", pageBar);
		
		
		request.getRequestDispatcher("/views/admin/order/OrderList.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
