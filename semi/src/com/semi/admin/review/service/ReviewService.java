package com.semi.admin.review.service;

import static com.semi.common.JDBCTemplate.close;
import static com.semi.common.JDBCTemplate.commit;
import static com.semi.common.JDBCTemplate.getConnection;
import static com.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.semi.admin.notice.vo.Notice;
import com.semi.admin.review.dao.ReviewDao;
import com.semi.admin.review.vo.Review;

public class ReviewService {

	private ReviewDao dao = new ReviewDao();
	
	public List<Review> selectReviewList(int page, int numPerPage) {
		Connection conn = getConnection();
		List<Review> list = dao.selectReviewList(conn,page,numPerPage);
		close(conn);
		return list;
	}
	public int selectReviewCount() {
		Connection conn = getConnection();
		int count = dao.selectReviewCount(conn);
		close(conn);	
		return count;
	}
	
	public Review selectReviewOne(int no) {
		Connection conn = getConnection();
		Review r = dao.selectReviewOne(conn,no);
		close(conn);
		System.out.println("reviewservice"+r);
		return r;
	}
	public int reviewDelete(int no) {
		Connection conn = getConnection();
		int result = dao.reviewDelete(conn,no);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	public int modifyReview(Review r) {
		Connection conn = getConnection();
		int result = dao.modifyReview(conn,r);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	public int insertReview(Review r) {
		Connection conn = getConnection();
		int result = dao.insertReview(conn,r);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
}
