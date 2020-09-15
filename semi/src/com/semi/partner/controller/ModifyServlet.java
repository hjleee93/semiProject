package com.semi.partner.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.partner.model.service.PartnerService;
import com.semi.partner.model.vo.PartnerMember;

/**
 * Servlet implementation class ModifyServlet
 */
@WebServlet(name="modiPartner", urlPatterns="/partner/memberUpdate")
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
		PartnerMember pm = new PartnerMember();
		pm.setPartner_id(request.getParameter("partner_id"));
		pm.setPartner_name(request.getParameter("partner_name"));
		pm.setPartner_pw(request.getParameter("partner_pw"));
		pm.setPartner_email(request.getParameter("partner_email"));
		pm.setPartner_phone(request.getParameter("partner_phone"));
		pm.setPostcode(request.getParameter("postcode"));
		pm.setAddress(request.getParameter("address"));
		pm.setDetailAddress(request.getParameter("detailAddress"));
		pm.setExtraAddress(request.getParameter("extraAddress"));	
		
		int result = new PartnerService().memberUpdate(pm);
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
