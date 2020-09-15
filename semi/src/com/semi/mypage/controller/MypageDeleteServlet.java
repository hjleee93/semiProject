package com.semi.mypage.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.partner.model.service.PartnerService;

/**
 * Servlet implementation class MypageDeleteServlet
 */
@WebServlet("/withdrawal")
public class MypageDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		RequestDispatcher rd=request.getRequestDispatcher("/views/mypage/mypage_withdrawal.jsp");
		rd.forward(request, response);
		
		String mypagedelete = request.getParameter("partner_id");
		int result = new PartnerService().deleteMember2(mypagedelete);
		
		String msg="";
		String loc="";
		if(result>0) {
			msg="정상적으로 탈퇴되었습니다.";
			loc="/logout";
		}else {
			msg="탈퇴실패하였습니다.";
			loc="/partner/memberView?partner_id="+mypagedelete;
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc",loc);
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
