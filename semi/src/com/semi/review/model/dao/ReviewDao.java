package com.semi.review.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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
	
	public List<Review> selectReviewList(Connection conn,int cPage,int numPerPage){
		PreparedStatement pstmt =null;
		ResultSet rs=null;
		List<Review> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectReviewList"));
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs=pstmt.executeQuery();
			Review r = null;
			while(rs.next()) {
				r = new Review();

				r.setReviewNum(rs.getInt(2));
				r.setMemberNum(rs.getInt(3));
				r.setStoreId(rs.getString(4));
				r.setReviewScore(rs.getInt(5));
				r.setReviewTitle(rs.getString(6));
				r.setReviewContent(rs.getString(7));
				r.setReviewPicsa(rs.getString(8));
				r.setReviewPicsb(rs.getString(9));
				r.setReviewPicsc(rs.getString(10));
				r.setReviewDate(rs.getDate(11));
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
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectReviewCount"));
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	
	public Review selectReviewOne(Connection conn,int no) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Review r=null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectReviewOne"));
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				r=new Review();
				r.setReviewNum(rs.getInt(1));
				r.setMemberNum(rs.getInt(2));
				r.setStoreId(rs.getString(3));
				r.setReviewScore(rs.getInt(4));
				r.setReviewTitle(rs.getString(5));
				r.setReviewContent(rs.getString(6));
				r.setReviewPicsa(rs.getString(7));
				r.setReviewPicsb(rs.getString(8));
				r.setReviewPicsc(rs.getString(9));
				r.setReviewDate(rs.getDate(10));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return r;
	}
	
	
}
