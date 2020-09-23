package com.semi.review.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.semi.review.model.vo.Review;
import static com.semi.common.JDBCTemplate.close;
public class ReviewDao {
	
	private Properties prop=new Properties();
	
	public ReviewDao() {
		try {
			String path=ReviewDao.class.getResource("/sql/review_sql.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertReview(Connection conn,Review r) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertReview"));
			pstmt.setInt(1,r.getReviewNum());
			pstmt.setInt(2, r.getMemberNum());
			pstmt.setString(3, r.getStoreId());
			pstmt.setInt(4, r.getReviewScore());
			pstmt.setString(5, r.getReviewTitle());
			pstmt.setString(6, r.getReviewContent());
			pstmt.setString(7, r.getReviewPicsa());
			pstmt.setString(8, r.getReviewPicsb());
			pstmt.setString(9,r.getReviewPicsc());
			pstmt.setDate(10,r.getReviewDate());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
}
