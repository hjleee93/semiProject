package com.semi.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.member.model.service.MemberService;
import com.semi.member.model.vo.Customer;
import com.semi.member.model.vo.TotalMember;

/**
 * Servlet implementation class MemberSignUpServlet
 */
@WebServlet(name="signup",urlPatterns="/signupmember")
public class MemberSignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSignUpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		String[] interest=request.getParameterValues("interest");
		String interested=String.join(",", interest);
		
		System.out.println("inte: " + interested);
		
		TotalMember m=new TotalMember();
		
		m.setMemberId(request.getParameter("member_id"));
		m.setMemberName(request.getParameter("member_name"));
		m.setMemberSep(request.getParameter("member_sep"));
		m.setMemberPw(request.getParameter("pw"));
		m.setMemberEmail(request.getParameter("member_Email"));
		m.setMemberPhone(request.getParameter("member_Phone"));
		m.setMemPostcode(request.getParameter("mem_postcode"));
		m.setMemAddress(request.getParameter("mem_address"));
		m.setMemDetailAddress(request.getParameter("mem_detailAddress"));
		m.setMemExtraAddress(request.getParameter("mem_extraAddress"));
		
		int result=new MemberService().insertMember1(m);
		System.out.println(result);
		
		System.out.println("seq:"+m.getMemberNum());
		
		TotalMember m1 = new TotalMember();
		String id = request.getParameter("member_id");
		System.out.println("id1: " + id);
		
		m1 = new MemberService().selectMemberOne(id);
		
		System.out.println("m1: " + m1);
		
//		request.setAttribute("seq", m.getTMember_no());
//		
//		int seq = (int) request.getAttribute("seq");
		
//		System.out.println("seq ?????????????" + seq);
		
		Customer m2=new Customer();
		System.out.println("m1.getMember_num(): " + m1.getMemberNum());
		m2.setCustomerNum(m1.getMemberNum());
		m2.setGender(request.getParameter("gender"));
		m2.setBirthday(request.getParameter("member_age"));
		m2.setCategory(String.join(",", request.getParameterValues("interest")));
		
		
		int result2=new MemberService().insertMember2(m1,m2);
		
		System.out.println("totalMember 서블렛 m : "+m);
		System.out.println("Member테이블 서블렛 m2 : "+m2);
		
		//result결과에 따라 가입 성공여부 메세지를 출력 후 메인화면 이동
		String msg="";
		String loc="/";
		if(result>0) {
			msg="회원가입 성공";
		}else if(result2>0){
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
