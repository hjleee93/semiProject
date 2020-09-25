package com.semi.rsv.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.rsv.model.vo.Reservation;
import com.semi.rsv.service.ReservationService;

/**
 * Servlet implementation class RsvServlet
 */
@WebServlet("/store/reservation")
public class RsvServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public RsvServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("서버에서 요청을 받음!");
		
		Reservation r = new Reservation();
		
		
		
		r.setCustomerNum(Integer.parseInt(request.getParameter("customerId")));
		r.setStoreId(Integer.parseInt(request.getParameter("storeId")));
		r.setRsvDate(request.getParameter("selectedDate"));
		r.setRsvTime(Integer.parseInt(request.getParameter("rsvTime")));
		
		System.out.println("request.getParameter(\"rsvRequire\"): "+request.getParameter("rsvRequire"));
		r.setRsvRequire(request.getParameter("rsvRequire"));
		r.setRsvPpl(Integer.parseInt(request.getParameter("ppl")));
		System.out.println("r in servlet" + r);
		
		int result = new ReservationService().insertReservation(r);
		
		String msg = "";
		String loc = "/";
		if (result > 0) {
			msg = "예약이 완료되었습니다. 마이페이지에서 확인 하실 수 있습니다.";

			loc = "/views/partner/rsvStatus.jsp";// 마이페이지로 이동
		} else {
			msg = "예약에 실패했습니다.관리자에게 문의해주세요.";
			// 신청폼 다시
			loc = "/store/storeDetail?storeId=" + request.getParameter("storeId");
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
