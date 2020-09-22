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
		TotalMember t = new TotalMember();
		Customer c = new Customer();
		
		t.setMemberId(request.getParameter("member_id"));
		t.setMemberName(request.getParameter("member_name"));
		t.setMemberPw(request.getParameter("pw"));
		t.setMemberEmail(request.getParameter("member_email"));
		t.setMemberPhone(request.getParameter("member_phone"));
		t.setMemPostcode(request.getParameter("postcode"));
		t.setMemAddress(request.getParameter("address"));
		t.setMemDetailAddress(request.getParameter("detailAddress"));
		t.setMemExtraAddress(request.getParameter("extraAddress"));
		
		c.setCustomerNum(Integer.parseInt(request.getParameter("seq")));
		c.setCategory(String.join(",", request.getParameterValues("category")));
		
		System.out.println("modimem : "+t);
		System.out.println("modicustomer "+c);
		int memresult = new MemberService().memberUpdate(t);
		int ctmresult = new MemberService().customerUpdate(c);
		//결과를 가지고 페이지를 선택하기
		//수정이 되면 result>0 실패하면 result=0;
		//메세지출력 메인화면
		String msg="";
		String loc="";
		if(memresult>0 && ctmresult>0) {
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
