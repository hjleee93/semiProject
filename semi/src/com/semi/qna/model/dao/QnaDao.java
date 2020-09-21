package com.semi.qna.model.dao;

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

import com.semi.qna.model.vo.Qna;
import com.semi.qna.model.vo.QnaComment;


public class QnaDao {

	private Properties prop = new Properties();
	
	public QnaDao() {
		// TODO Auto-generated constructor stub
		try {
			String fileName=QnaDao.class.getResource("/sql/qna_sql.properties").getPath();
			prop.load(new FileReader(fileName));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Qna> selectQnaList(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Qna> list = new ArrayList();
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectQnaList"));
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Qna n = new Qna();
				n.setQnaNo(rs.getInt("Qna_no"));
				n.setQnaSep(rs.getString("Qna_sep"));
				n.setQnaTitle(rs.getString("Qna_title"));
				n.setQnaWriter(rs.getString("Qna_writer"));
				n.setQnaContent(rs.getString("Qna_content"));
				n.setQnaDate(rs.getDate("QNA_DATE"));
//				n.setQnaOriginalFileName(rs.getString("QNA_ORIGINAL_FILENAME"));
//				n.setQnaRenamedFileName(rs.getString("QNA_RENAMED_FILENAME"));
				n.setQnaCount(rs.getInt("Qna_count"));
				list.add(n);
			}
		}catch(SQLException e) {
				e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;

	}
	public int selectQnaCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count=0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectQnaCount"));
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
	
	public Qna selectQnaOne(Connection conn, int no) {
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		Qna n = null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectQnaOne"));
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				n=new Qna();
				n.setQnaNo(rs.getInt("Qna_no"));
				n.setQnaSep(rs.getString("Qna_sep"));
				n.setQnaTitle(rs.getString("Qna_title"));
				n.setQnaWriter(rs.getString("Qna_writer"));
				n.setQnaContent(rs.getString("Qna_content"));
				n.setQnaDate(rs.getDate("Qna_date"));
//				n.setQnaOriginalFileName("Qna_original_filename");
//				n.setQnaRenamedFileName("Qna_renamed_filename");
				n.setQnaCount(rs.getInt("Qna_count"));
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
			System.out.println(prop.getProperty("updateReadCount"));
			pstmt=conn.prepareStatement(prop.getProperty("updateReadCount"));
			
			pstmt.setInt(1, no);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public int modifyQna(Connection conn, Qna n) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("modifyQna"));
//			pstmt.setString(1, n.getQnaSep());
			pstmt.setString(1, n.getQnaTitle());
			pstmt.setString(2, n.getQnaWriter());
			pstmt.setString(3, n.getQnaContent());
			pstmt.setInt(4,n.getQnaNo());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}

	
	public List<Qna> selectQnaSearch(Connection conn, String type, 
			String keyword, int cPage, int numPerpage){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Qna> list = new ArrayList();
		try {
			String sql=prop.getProperty("selectQnaSearch");
			pstmt=conn.prepareStatement(sql.replace("$type", type));
			pstmt.setString(1, "%"+keyword+"%");
			//페이징 처리 
			pstmt.setInt(2, (cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Qna n = new Qna();
				n.setQnaNo(rs.getInt("Qna_no"));
				n.setQnaSep(rs.getString("Qna_sep"));
				n.setQnaTitle(rs.getString("Qna_title"));
				n.setQnaWriter(rs.getString("Qna_writer"));
				n.setQnaContent(rs.getString("Qna_content"));
				n.setQnaDate(rs.getDate("Qna_date"));
				n.setQnaCount(rs.getInt("Qna_count"));
				list.add(n);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
		
	}
	public int deleteQnaWrite(Connection conn, int no) {
		PreparedStatement pstmt = null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("deleteQnaWrite"));
			pstmt.setInt(1, no);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
		
	}
	
	public int insertQna(Connection conn, Qna n) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
//			System.out.println("file name : " + n.getQnaOriginalFileName());
			pstmt=conn.prepareStatement(prop.getProperty("insertQna"));
			pstmt.setString(1, n.getQnaSep());
			pstmt.setString(2, n.getQnaTitle());
			pstmt.setString(3, n.getQnaWriter());
			pstmt.setString(4, n.getQnaContent());
//			pstmt.setString(5, n.getQnaOriginalFileName());			
//			pstmt.setString(6, n.getQnaRenamedFileName());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public int selectQnaSearchCount(Connection conn, String type, String keyword) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		String sql=prop.getProperty("selectQnaSearchCount");
		try {
			pstmt=conn.prepareStatement(sql.replace("$type", type));
			pstmt.setString(1,"%"+keyword+"%");
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			
			close(pstmt);
		}return count;
	}

	
	public int insertQnaComment(Connection conn, QnaComment bc) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertQnaComment"));
			pstmt.setInt(1,bc.getQnacommentLevel());
			pstmt.setNString(2,bc.getQnaCommentWriter());
			pstmt.setNString(3, bc.getQnaCommentContent());
			pstmt.setInt(4, bc.getQnaRef());
			//pstmt.setInt(5, null);
			pstmt.setString(5, bc.getCommentRef()==0?null:String.valueOf(bc.getCommentRef()));
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	
	public List<QnaComment> selectQnaCommentList(Connection conn, int no){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<QnaComment> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectQnaCommentList"));
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				QnaComment bc=new QnaComment();
				bc.setQnaCommentNo(rs.getInt(1));
				bc.setQnacommentLevel(rs.getInt(2));
				bc.setQnaCommentWriter(rs.getString(3));
				bc.setQnaCommentContent(rs.getNString(4));
				bc.setQnaRef(rs.getInt(5));
				bc.setCommentRef(rs.getInt(6));
				bc.setQnaCommentDate(rs.getDate(7));
				list.add(bc);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	
	
	
	
	
}
