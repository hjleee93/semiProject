package com.semi.qna.controller;

import java.util.List;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.qna.model.service.QnaService;
import com.semi.qna.model.vo.Qna;
import com.semi.qna.model.vo.QnaComment;



/**
 * Servlet implementation class NoticeDetailViewServlet
 */
@WebServlet("/qna/qnaView")
public class QnaDetailViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaDetailViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int no = Integer.parseInt(request.getParameter("no"));
		
		Qna n = new QnaService().selectQnaOne(no);
		List<QnaComment> list=new QnaService().selectQnaCommentList(no);
		
		System.out.println("n in service: " + n);
		System.out.println("list in service: " + list);
		request.setAttribute("list", list);
		request.setAttribute("qna", n);
		
		request.getRequestDispatcher("/views/qna/qnaView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
