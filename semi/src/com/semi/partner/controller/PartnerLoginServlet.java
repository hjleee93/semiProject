package com.semi.partner.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.partner.model.service.PartnerService;
import com.semi.partner.model.vo.PartnerMember;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/partner/login")
public class PartnerLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PartnerLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("partner_id");
		String pw = request.getParameter("partner_pw");
		System.out.println("id : "+id+" pw : "+pw);
		
		//쿠키저장로직
		String saveId = request.getParameter("saveId");
		System.out.println("saveId : "+saveId);
		if(saveId!=null) {
			Cookie c = new Cookie("saveId",id);
			c.setMaxAge(3*24*60*60);
			response.addCookie(c);//쿠키저장메소드
		}else {
			Cookie c = new Cookie("saveId","");
			c.setMaxAge(0);
			response.addCookie(c);
		}
		
		
		//로그인로직  서비스요청
		PartnerMember pm = new PartnerService().loginMember(id,pw);
		System.out.println("pm: " + pm);
		
		
		
		if(pm!=null) {
			//로그인한 객체를 데이터보관용 request객체에 보관
//			request.setAttribute("logginedMember", pm);//1회용
			HttpSession session = request.getSession();
			session.setAttribute("logginedMember", pm);//session객체에 데이터 보관
			response.sendRedirect(request.getContextPath());
			
		}else {
//			에러메세지 1회성
			request.setAttribute("msg", "아이디나 비밀번호가 일치하지 않습니다");
			request.setAttribute("loc", "/");//전송할페이지
			//request데이터를 유지해서 페이지를 넘기려면 RequestDispatcher로 페이지전환
			RequestDispatcher rd= request.getRequestDispatcher("/views/common/msg.jsp");
			rd.forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
