package com.semi.admin.notice.service;

import static com.semi.common.JDBCTemplate.close;
import static com.semi.common.JDBCTemplate.commit;
import static com.semi.common.JDBCTemplate.rollback;
import static com.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.semi.admin.notice.dao.NoticeDao;
import com.semi.admin.notice.vo.Notice;

public class NoticeService {

	private NoticeDao dao = new NoticeDao();
	
	public List<Notice> selectNoticeList(int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Notice> list = dao.selectNoticeList(conn,cPage,numPerPage);
		close(conn);
		return list;
	}
	
	public int selectNoticeCount() {
		Connection conn = getConnection();
		int count = dao.selectNoticeCount(conn);
		close(conn);
		return count;
	}
	
	public Notice selectNoticeOne(int no,boolean hasRead) {
		Connection conn = getConnection();
		Notice n = dao.selectNoticeOne(conn,no);
		//조회수증가로직
		if(n!=null && !hasRead) {
			int result = dao.updateReadCount(conn,no);
			if(result>0) commit(conn);
			else rollback(conn);
		}
		close(conn);
		return n;
	}
	public int modifyNotice(Notice n) {
		Connection conn = getConnection();
		int result = dao.modifyNotice(conn,n);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int deleteNoticeWrite(int no) {
		Connection conn = getConnection();
		int result = dao.deleteNoticeWrite(conn,no);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int insertNotice(Notice n) {
		Connection conn = getConnection();
		int result = dao.insertNotice(conn,n);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
}
