package com.semi.admin.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.admin.review.service.ReviewService;
import com.semi.admin.review.vo.Review;

/**
 * Servlet implementation class ReviewModiOkServlet
 */
@WebServlet("/admin/reviewModiok")
public class ReviewModiOkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewModiOkServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Review r = new Review();
		r.setReviewNum(Integer.parseInt(request.getParameter("no")));
		r.setReviewTitle(request.getParameter("title"));
		r.setReviewCategory(request.getParameter("category"));
		r.setReviewWriter(request.getParameter("writer"));
		r.setReviewContent(request.getParameter("content"));
		r.setReviewMark(request.getParameter("mark"));
		
		int result = new ReviewService().modifyReview(r);
		
		String msg="";
		String loc="";
		if(result>0) {
			msg="성공적으로 수정되었습니다.";
			loc="/admin/review";
		}else {
			msg="리뷰 수정에 실패했습니다.";
			loc="/admin/review";

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
