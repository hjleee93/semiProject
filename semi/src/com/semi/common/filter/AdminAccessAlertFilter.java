package com.semi.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.semi.member.model.vo.Member;

/**
 * Servlet Filter implementation class AdminAccessAlertFilter
 */
@WebFilter("/admin/*")
public class AdminAccessAlertFilter implements Filter {

    /**
     * Default constructor. 
     */
    public AdminAccessAlertFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		//관리자페이지 권한 처리하기
		//관리자가 아닌 경우에는 페이지를 못보게 처리하기
		HttpSession session=((HttpServletRequest)request).getSession(false);
		Member login=(Member)session.getAttribute("Memberloggined");
		

		if(login==null || !login.getMemberId().equals("admin")) {
			//msg/jsp로 메세지 출력 후 메인화면으로 전환!
			request.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		
//		if((login!=null && login.getMemberId().equals("admin"))||(loginpm!=null&& loginpm.getPartnerId().equals("admin"))){
//	
//			
//			request.setAttribute("msg","관리자님 환영합니다.");
//			request.setAttribute("loc", "/");
//			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
//		
//		}else {
//			//msg/jsp로 메세지 출력 후 메인화면으로 전환!
//			request.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
//			request.setAttribute("loc", "/");
//			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
//			
//		}
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
