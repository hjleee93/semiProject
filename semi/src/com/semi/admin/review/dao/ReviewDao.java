package com.semi.admin.review.dao;

import static com.semi.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.semi.admin.notice.vo.Notice;
import com.semi.admin.review.vo.Review;

public class ReviewDao {

	private Properties prop = new Properties();
	
	public ReviewDao() {
		// TODO Auto-generated constructor stub
		try {
			String fileName=ReviewDao.class.getResource("/sql/admin_sql.properties").getPath();
			prop.load(new FileReader(fileName));
		}catch(IOException e) {
			e.printStackTrace();
		}
		
	}
	public List<Review> selectReviewList(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Review> list = new ArrayList();
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectReviewList"));
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Review r = new Review();
				r.setReviewNum(rs.getInt("seq_review_num"));
				r.setReviewTitle(rs.getString("review_title"));
				r.setReviewCategory(rs.getString("review_category"));
				r.setReviewWriter(rs.getString("review_writer"));
				r.setReviewContent(rs.getString("review_content"));
				r.setReviewMark(rs.getString("review_mark"));
				r.setEnrolldate(rs.getDate("enrolldate"));
				list.add(r);
			}
		}catch(SQLException e) {
				e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;

	}
	public int selectReviewCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count=0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectReviewCount"));
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return count;
		
	}
	public Review selectReviewOne(Connection conn, int no) {
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		Review r = null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectReviewOne"));
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				r=new Review();
				r.setReviewNum(rs.getInt(1));
				r.setReviewTitle(rs.getString(2));
				r.setReviewCategory(rs.getString(3));
				r.setReviewWriter(rs.getString(4));
				r.setReviewContent(rs.getString(5));
				r.setReviewMark(rs.getString(6));
				r.setEnrolldate(rs.getDate(7));
				System.out.println("review dao "+r);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return r;
	}
	public int reviewDelete(Connection conn, int no) {
		PreparedStatement pstmt = null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("reviewDelete"));
			pstmt.setInt(1, no);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
		
	}
	public int modifyReview(Connection conn, Review r) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("modifyReview"));
			pstmt.setString(1, r.getReviewTitle());
			pstmt.setString(2, r.getReviewCategory());
			pstmt.setString(3, r.getReviewWriter());
			pstmt.setString(4, r.getReviewContent());
			pstmt.setString(5, r.getReviewMark());
			pstmt.setInt(6, r.getReviewNum());;
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	public int insertReview(Connection conn, Review r) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertReview"));
			pstmt.setString(1, r.getReviewTitle());
			pstmt.setString(2, r.getReviewCategory());
			pstmt.setString(3, r.getReviewWriter());
			pstmt.setString(4, r.getReviewContent());
			pstmt.setString(5, r.getReviewMark());
			result = pstmt.executeUpdate();
			System.out.println("result in reviewdao" +result);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}

	
}
