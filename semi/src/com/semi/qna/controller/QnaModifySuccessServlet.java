package com.semi.qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.qna.model.service.QnaService;
import com.semi.qna.model.vo.Qna;


/**
 * Servlet implementation class NoticeModifySuccessServlet
 */
@WebServlet("/qna/modifySuccess")
public class QnaModifySuccessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaModifySuccessServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Qna n = new Qna();
		n.setQnaNo(Integer.parseInt(request.getParameter("no")));
		n.setQnaTitle(request.getParameter("title"));
		n.setQnaWriter(request.getParameter("writer"));
		n.setQnaContent(request.getParameter("content"));
		
		int result = new QnaService().modifyQna(n);
		
		String msg="";
		String loc="";
		if(result>0) {
			msg="성공적으로 수정되었습니다.";
			loc="/qna";
		}else {
			msg="수정에 실패했습니다.";
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
