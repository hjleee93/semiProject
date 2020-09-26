package com.semi.mypage.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.member.model.service.MemberService;
import com.semi.partner.model.service.PartnerService;

/**
 * Servlet implementation class MypageDeleteServlet
 */
@WebServlet(name="deleteMember",urlPatterns="/deleted/withm")
public class MypageDeleteM extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageDeleteM() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String ph = request.getParameter("ph");
		String id = request.getParameter("id");
		System.out.println("pw in wid: " + ph);
		
		int result = new MemberService().deleteMember(id, ph);
		String msg="";
		String loc="";
		//회원이 삭제가 되었다면 로그아웃로직으로 전환
		if(result>0) {
			msg="정상적으로 탈퇴되었습니다.";
			loc="/logout";
		}else {
			msg="탈퇴실패하였습니다.";
			loc="/main.jsp";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc",	loc);
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
