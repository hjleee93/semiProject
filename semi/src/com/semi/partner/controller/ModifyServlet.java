package com.semi.partner.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.member.model.service.MemberService;
import com.semi.member.model.vo.Member;

/**
 * Servlet implementation class ModifyServlet
 */
@WebServlet(name="modiMember", urlPatterns="/partner/memberUpdate")
public class ModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		Member m = new Member();
		m.setMemberId(request.getParameter("Member_id"));
		m.setMemberName(request.getParameter("Member_name"));
		m.setMemberPw(request.getParameter("Member_pw"));
		m.setMemberEmail(request.getParameter("Member_email"));
		m.setMemberPhone(request.getParameter("Member_phone"));
		m.setMemPostcode(request.getParameter("mem_postcode"));
		m.setMemAddress(request.getParameter("mem_address"));
		m.setMemDetailAddress(request.getParameter("mem_detailAddress"));
		m.setMemExtraAddress(request.getParameter("mem_extraAddress"));	
		
		int result = new MemberService().partnerUpdate(m);
		//결과를 가지고 페이지를 선택하기
		//수정이 되면 result>0 실패하면 result=0;
		//메세지출력 메인화면
		String msg="";
		String loc="";
		if(result>0) {
			msg="성공적으로 수정되었습니다.";
		}else {
			msg="회원정보 수정에 실패했습니다.";
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
