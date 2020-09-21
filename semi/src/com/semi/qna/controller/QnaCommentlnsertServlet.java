package com.semi.qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.qna.model.service.QnaService;
import com.semi.qna.model.vo.QnaComment;


/**
 * Servlet implementation class QnaCommentInsertServlet
 */
@WebServlet("/qna/qnaCommentInsert")
public class QnaCommentlnsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaCommentlnsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int qnaRef=Integer.parseInt(request.getParameter("qnaRef"));
		String qnaCommentWriter=request.getParameter("qnaCommentWriter");
		int qnaCommentLevel=Integer.parseInt(request.getParameter("qnaCommentLevel"));
		int qnaCommentRef=Integer.parseInt(request.getParameter("qnaCommentRef"));
		String qnaCommentContent=request.getParameter("qnaCommentContent");
		
		QnaComment bc=new QnaComment(0,qnaCommentLevel,qnaCommentWriter,
				qnaCommentContent,qnaRef,qnaCommentRef,null);
		
		int result=new QnaService().insertQnaComment(bc);
		
		String msg="";
		String loc="/qna/qnaView?no="+qnaRef;
		if(result>0) {
			msg="답변 등록 완료";
		}else {
			msg="답변 등록 실패";
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
