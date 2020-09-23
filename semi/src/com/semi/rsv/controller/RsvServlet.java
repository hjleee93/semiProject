package com.semi.rsv.controller;
//view�� db ����

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.rsv.model.vo.Reservation;

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
		
		
		int result = new ReservationService().insertReservation(r);
		
		String msg = "";
		String loc = "/";
		if (result > 0) {
			msg = "예약 서비스 등록이 완료되었습니다.";

			loc = "/ptnstorelist";// 마이페이지로 이동
		} else {
			msg = "입력하신 데이터에 오류가 발생했습니다. 입점 신청을 다시 시도해주세요";
			// 신청폼 다시
			loc = "/storeService/storeRsvSetting?storeId=" + request.getParameter("storeId");
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
