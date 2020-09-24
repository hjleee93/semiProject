package com.semi.admin.review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.admin.review.service.ReviewService;
import com.semi.admin.review.vo.Review;

/**
 * Servlet implementation class ReviewViewServlet
 */
@WebServlet("/admin/review")
public class ReviewListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int page;
		try {
			page=Integer.parseInt(request.getParameter("page"));
		}catch(NumberFormatException e) {
			page=1;
		}
		int numPerPage=3;

		List<Review> list = new ReviewService().selectReviewList(page,numPerPage);
		
		int totalData = new ReviewService().selectReviewCount();
		
		int totalPage = (int)(Math.ceil((double)totalData/numPerPage));
		
		int pageBarSize=5;
		int pageNo=((page-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		String pageBar = "";
		if(pageNo==1) {
			pageBar="<span> ◀ </span>";
		}else {
			pageBar="<a href='"+request.getContextPath()+"/admin/review?page="+(pageNo-1)+"'> ◀ </a>";
		}
		while(!(pageNo>pageEnd||pageNo>totalPage)){
			if(pageNo==page) {
				pageBar+="<span class='num'>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getContextPath()+"/admin/review?page="+(pageNo)+"' class='num'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo>totalPage) {
				pageBar+="<span> ▶ </span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()+"/admin/review?page="+(pageNo)+"'> ▶ </a>";
		}
	
		request.setAttribute("totalData", totalData);
		request.setAttribute("reviewlist", list);
		request.setAttribute("pageBar", pageBar);
		
		
		request.getRequestDispatcher("/views/admin/review/ReviewList.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
