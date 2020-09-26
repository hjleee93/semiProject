package com.semi.rsv.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.rsv.model.vo.Reservation;
import com.semi.rsv.service.ReservationService;

/**
 * Servlet implementation class ReservationViewServelt
 */
@WebServlet("/rsv/reservationView")
public class ReservationViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int cPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		int numPerPage=5;
		
		int totalData = new ReservationService().selectRsvCount();
		int totalPage = (int)(Math.ceil((double)totalData/numPerPage));
		
		
		List<Reservation> rsvList = new ReservationService().selectAllReservation(cPage, numPerPage);
		
		
		
		
		String pageBar = "";
		int pageBarSize=5;
		
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		
		if(pageNo==1) {
			pageBar="<span> ◀ </span>";
		}else {
			pageBar="<a href='"+request.getContextPath()+"/rsv/reservationView?page="+(pageNo-1)+"'> ◀ </a>";
		}
		
		
		while(!(pageNo>pageEnd||pageNo>totalPage)){
			if(pageNo==cPage) {
				pageBar+="<a>"+pageNo+"</a>";
			}else {
				pageBar+="<a href='"+request.getContextPath()+"/rsv/reservationView?page="+(pageNo)+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) { 
				pageBar+="<span> < </span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()+"/rsv/reservationView?page="+(pageNo)+"'> > </a>";
		}
		
		
		request.setAttribute("totalData", totalData);
		request.setAttribute("rsvList", rsvList);
		request.setAttribute("pageBar", pageBar);
		
		
		System.out.println("pageBar" + pageBar);
		System.out.println("rsvList" + rsvList);
		System.out.println("totalData" + totalData);
		
		request.getRequestDispatcher("/views/partner/ptnRsvView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
