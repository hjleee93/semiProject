package com.semi.qna.model.service;

import static com.semi.common.JDBCTemplate.close;
import static com.semi.common.JDBCTemplate.commit;
import static com.semi.common.JDBCTemplate.rollback;
import static com.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.semi.qna.model.dao.QnaDao;
import com.semi.qna.model.vo.Qna;

public class QnaService {

	private QnaDao dao = new QnaDao();
	
	public List<Qna> selectQnaList(int cPage, int numPerPage) {
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
	
	public List<Qna> selectSearch(String type, String keyword){
		Connection conn = null;
		List<Qna> list = dao.selectSearch(conn,type,keyword);
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
	
	public int insertQna(Qna n) {
		Connection conn = getConnection();
		int result = dao.insertQna(conn,n);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
}
