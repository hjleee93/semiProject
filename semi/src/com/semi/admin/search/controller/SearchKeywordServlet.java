package com.semi.admin.search.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.admin.service.AdminService;

/**
 * Servlet implementation class SearchKeywordServlet
 */
@WebServlet("/admin/search/member.do")
public class SearchKeywordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchKeywordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String key = request.getParameter("keyword");
		
		List<String> list = new AdminService().selectSearchId(key);
		String csv="";
		if(!list.isEmpty()) {
			for(int i=0;i<list.size();i++) {
				if(i!=0) csv+=",";
				csv+=list.get(i);
			}
			
		}
		response.setContentType("text/csv;charset=utf-8");
		response.getWriter().write(csv);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
