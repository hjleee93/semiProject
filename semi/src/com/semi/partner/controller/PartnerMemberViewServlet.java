package com.semi.partner.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.partner.model.service.PartnerService;
import com.semi.partner.model.vo.PartnerMember;

/**
 * Servlet implementation class PartnerMemberViewServlet
 */
@WebServlet("/partner/memberView")
public class PartnerMemberViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PartnerMemberViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id =request.getParameter("partner_id");
//		PartnerMember pm = new PartnerService().selectMember(id);
		
//		String pw = pm.getPartner_pw();
//		try {
//			pm.setPartner_pw(AESCrypto.decrypt(pw));
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
		/*
		 * String email=m.getEmail(); String phone=m.getPhone(); try {
		 * m.setEmail(AESCrypto.decrypt(email)); m.setPhone(AESCrypto.decrypt(phone));
		 * }catch(Exception e){ e.printStackTrace();
		 * 
		 * 
		 * }
		 */		
//		request.setAttribute("member", pm);
		request.getRequestDispatcher("/views/partner/partnerModify.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
