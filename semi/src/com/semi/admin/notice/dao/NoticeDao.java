package com.semi.admin.notice.dao;

import static com.semi.common.JDBCTemplate.close;
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

public class NoticeDao {

	private Properties prop = new Properties();
	
	public NoticeDao() {
		// TODO Auto-generated constructor stub
		try {
			String fileName=NoticeDao.class.getResource("/sql/admin_notice_sql.properties").getPath();
			prop.load(new FileReader(fileName));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Notice> selectNoticeList(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Notice> list = new ArrayList();
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectNoticeList"));
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Notice n = new Notice();
				n.setNoticeNo(rs.getInt("notice_no"));
				n.setNoticeSep(rs.getString("notice_division"));
				n.setNoticeTitle(rs.getString("notice_title"));
				n.setNoticeWriter(rs.getString("notice_writer"));
				n.setNoticeContent(rs.getString("notice_content"));
				n.setNoticeDate(rs.getDate("notice_date"));
				n.setFile(rs.getString("filepath"));
				n.setNoticeCount(rs.getInt("readcount"));
				list.add(n);
			}
		}catch(SQLException e) {
				e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;

	}
	public int selectNoticeCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count=0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectNoticeCount"));
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
	
	public Notice selectNoticeOne(Connection conn, int no) {
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		Notice n = null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectNoticeOne"));
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				n=new Notice();
				n.setNoticeNo(rs.getInt("notice_no"));
				n.setNoticeSep(rs.getString("notice_division"));
				n.setNoticeTitle(rs.getString("notice_title"));
				n.setNoticeWriter(rs.getString("notice_writer"));
				n.setNoticeContent(rs.getString("notice_content"));
				n.setNoticeDate(rs.getDate("notice_date"));
				n.setFile(rs.getString("filepath"));
				n.setNoticeCount(rs.getInt("readCount"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return n;
	}
	public int updateReadCount(Connection conn, int no) {
		PreparedStatement pstmt=null;
		int result =0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("updateReadCount"));
			pstmt.setInt(1, no);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public int modifyNotice(Connection conn, Notice n) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("modifyNotice"));
			pstmt.setString(1, n.getNoticeSep());
			pstmt.setString(2, n.getNoticeTitle());
			pstmt.setString(3, n.getNoticeWriter());
			pstmt.setString(4, n.getNoticeContent());
			pstmt.setString(5, n.getFile());
			pstmt.setInt(6,n.getNoticeNo());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}

	public int deleteNoticeWrite(Connection conn, int no) {
		PreparedStatement pstmt = null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("deleteNoticeWrite"));
			pstmt.setInt(1, no);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
		
	}
	
	public int insertNotice(Connection conn, Notice n) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertNotice"));
			pstmt.setString(1, n.getNoticeSep());
			pstmt.setString(2, n.getNoticeTitle());
			pstmt.setString(3, n.getNoticeWriter());
			pstmt.setString(4, n.getNoticeContent());
			pstmt.setString(5, n.getFile());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
}
