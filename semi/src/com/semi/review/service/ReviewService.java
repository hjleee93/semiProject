package com.semi.review.service;

import java.sql.Connection;

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
}
