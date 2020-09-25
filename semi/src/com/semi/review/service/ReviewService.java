package com.semi.review.service;

import java.sql.Connection;
import java.util.List;

import com.semi.review.model.dao.ReviewDao;
import com.semi.review.model.vo.Review;

import static com.semi.common.JDBCTemplate.commit;
import static com.semi.common.JDBCTemplate.rollback;
import static com.semi.common.JDBCTemplate.close;
import static com.semi.common.JDBCTemplate.getConnection;

public class ReviewService {

	private ReviewDao dao=new ReviewDao();
	
	public int insertReview(Review r) {
		Connection conn=getConnection();
		int result=dao.insertReview(conn, r);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public List<Review> selectReviewList(int cPage,int numPerPage){
		Connection conn=getConnection();
		List<Review> list=dao.selectReviewList(conn,cPage,numPerPage);
		close(conn);
		return list;
	}
	
	public int selectReviewCount() {
		Connection conn=getConnection();
		int count=dao.selectReviewCount(conn);
		close(conn);
		return count;
	}
	
	public Review selectReviewOne(int no) {
		Connection conn=getConnection();
		Review r=dao.selectReviewOne(conn,no);
		close(conn);
		return r;
		
	}
}
