package com.semi.qna.model.service;

import static com.semi.common.JDBCTemplate.close;
import static com.semi.common.JDBCTemplate.commit;
import static com.semi.common.JDBCTemplate.rollback;
import static com.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.semi.qna.model.dao.QnaDao;
import com.semi.qna.model.vo.Qna;
import com.semi.qna.model.vo.QnaComment;

public class QnaService {

	private QnaDao dao = new QnaDao();
	
	public List<Qna> selectQnaList(int cPage, int numPerPage) {
		System.out.println("service: " + cPage + ": " + numPerPage);
		Connection conn = getConnection();
		List<Qna> list = dao.selectQnaList(conn,cPage,numPerPage);
		close(conn);
		return list;
	}
	
	public int selectQnaCount() {
		Connection conn = getConnection();
		int count = dao.selectQnaCount(conn);
		close(conn);
		return count;
	}
	
	public Qna selectQnaOne(int no) {
		Connection conn = getConnection();
		Qna n = dao.selectQnaOne(conn,no);
		//조회수증가로직
		if(n!=null) {
			int result = dao.updateReadCount(conn,no);
			if(result>0) commit(conn);
			else rollback(conn);
		}
		close(conn);
		return n;
	}
	public int modifyQna(Qna n) {
		Connection conn = getConnection();
		int result = dao.modifyQna(conn,n);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public List<Qna> selectQnaSearch(String type, String keyword,int cPage, int numPerpage){
		Connection conn=getConnection();
		List<Qna> list = dao.selectQnaSearch(conn,type, keyword,cPage,numPerpage);
		close(conn);
		return list;
	}
	
	public int deleteQnaWrite(int no) {
		Connection conn = getConnection();
		int result = dao.deleteQnaWrite(conn,no);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
//	public int insertQna(Qna n) {
//		Connection conn = getConnection();
//		int result = dao.insertQna(conn,n);
//		if(result>0) commit(conn);
//		else rollback(conn);
//		close(conn);
//		return result;
//	}
	public int selectQnaSearchCount(String type, String keyword) {
		Connection conn=getConnection();
		int count=dao.selectQnaSearchCount(conn,type, keyword);
		close(conn);
		return count;
	}
	
	public int insertQna(Qna b) {
		Connection conn=getConnection();
		int result=dao.insertQna(conn,b);
		if(result>0)commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
		
	public int insertQnaComment(QnaComment bc) {
			Connection conn=getConnection();
			int result=dao.insertQnaComment(conn, bc);
			if(result>0) commit(conn);
			else rollback(conn);
			close(conn);
			return result;
	}
	
	
	public List<QnaComment> selectQnaCommentList(int no){
		Connection conn=getConnection();
		List<QnaComment> list=dao.selectQnaCommentList(conn,no);
		close(conn);
		return list;
	}
	
	
	
	
	
	
	
}




