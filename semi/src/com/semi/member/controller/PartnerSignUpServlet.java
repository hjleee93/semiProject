package com.semi.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.member.model.service.MemberService;
import com.semi.member.model.vo.Partner;
import com.semi.member.model.vo.TotalMember;

/**
 * Servlet implementation class PartnerSignUpServlet
 */
@WebServlet(name="signup",urlPatterns="/signuppartner")
public class PartnerSignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PartnerSignUpServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		
		TotalMember m=new TotalMember();
		
		m.setMemberId(request.getParameter("partner_id"));
		m.setMemberName(request.getParameter("partner_name"));
		m.setMemberSep(request.getParameter("partner_sep"));
		m.setMemberPw(request.getParameter("pw2"));
		m.setMemberEmail(request.getParameter("partner_Email"));
		m.setMemberPhone(request.getParameter("partner_Phone"));
		m.setMemPostcode(request.getParameter("partner_postcode"));
		m.setMemAddress(request.getParameter("partner_address"));
		m.setMemDetailAddress(request.getParameter("partner_detailAddress"));
		m.setMemExtraAddress(request.getParameter("partner_extraAddress"));
		
		
		int result=new MemberService().insertPartner(m);
		System.out.println("ptn * m : "+m);
		
		
		
		//result결과에 따라 가입 성공여부 메세지를 출력 후 메인화면 이동
		String msg="";
		String loc="/";
		if(result>0) {
			msg="회원가입 성공";
		}else {
			msg="회원가입 실패";
			loc="/enrollMember";
		}
		request.setAttribute("msg",msg);
		request.setAttribute("loc", loc);
		
		request.getRequestDispatcher("/views/common/msg.jsp")
		.forward(request, response);
	
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
