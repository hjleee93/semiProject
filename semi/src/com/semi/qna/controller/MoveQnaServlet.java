package com.semi.qna.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.qna.model.service.QnaService;
import com.semi.qna.model.vo.Qna;


/**
 * Servlet implementation class MoveNoticeServlet
 */
@WebServlet("/Qna")
public class MoveQnaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MoveQnaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int cPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		int numPerPage=5;
		
		List<Qna> list = new QnaService().selectQnaList(cPage,numPerPage);
		
		int totalData = new QnaService().selectQnaCount();
		
		int totalPage = (int)(Math.ceil((double)totalData/numPerPage));
		
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		String pageBar = "";
		if(pageNo==1) {
			pageBar="<span> < </span>";
		}else {
			pageBar="<a href='"+request.getContextPath()+"/qna?page="+(pageNo-1)+"'> < </a>";
		}
		while(!(pageNo>pageEnd||pageNo>totalPage)){
			if(pageNo==cPage) {
				pageBar+="<span class='num'>"+pageNo+"</span>";
			}else {
				pageBar+="<a class='num' href='"+request.getContextPath()+"/qna?page="+(pageNo)+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo>totalPage) {
				pageBar+="<span> > </span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()+"/qna?page="+(pageNo)+"'> > </a>";
		}
	
		request.setAttribute("totalData", totalData);
		request.setAttribute("list", list);
		request.setAttribute("pageBar", pageBar);
		
		request.getRequestDispatcher("/views/qna/qnaBoard.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
