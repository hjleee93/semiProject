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
 * Servlet implementation class ReviewUploadServlet
 */
@WebServlet("/admin/reviewUpload")
public class ReviewUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Review r = new Review();
		
		r.setReviewTitle(request.getParameter("title"));
		r.setReviewCategory(request.getParameter("category"));
		r.setReviewWriter(request.getParameter("writer"));
		r.setReviewContent(request.getParameter("content"));
		r.setReviewMark(request.getParameter("mark"));
		
		int result = new ReviewService().insertReview(r);
		
		String msg="";
		String loc="/admin/review";
		if(result>0) {
			msg="리뷰 등록이 완료되었습니다.";
		}else {
			msg="리뷰가 등록되지 못했습니다.";
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
