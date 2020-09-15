package com.semi.member.controller;

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
@WebServlet(name="modiMember", urlPatterns="/member/memberUpdate")
public class MemberModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberModifyServlet() {
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
		m.setMember_id(request.getParameter("member_id"));
		m.setMember_name(request.getParameter("member_name"));
		m.setMember_pw(request.getParameter("member_pw"));
		m.setGender(request.getParameter("gender"));
		m.setMember_age(request.getParameter("member_age"));
		m.setMember_email(request.getParameter("member_email"));
		m.setMember_phone(request.getParameter("member_phone"));
		m.setMem_postcode(request.getParameter("mem_postcode"));
		m.setMem_address(request.getParameter("mem_address"));
		m.setMem_detailAddress(request.getParameter("mem_detailAddress"));
		m.setMem_extraAddress(request.getParameter("mem_extraAddress"));
		m.setCategory(String.join(",",request.getParameterValues("category")));
		
		int result = new MemberService().memberUpdate(m);
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
