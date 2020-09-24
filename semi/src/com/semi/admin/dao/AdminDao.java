package com.semi.admin.dao;

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

import com.semi.member.model.vo.TotalMember;
public class AdminDao {

	private Properties prop = new Properties();
	
	public AdminDao() {
		// TODO Auto-generated constructor stub
		try {
			String path=AdminDao.class.getResource("/sql/admin_sql.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	
//	public List<TotalMember> selectPartnerList(Connection conn,int page, int numPerPage){
//		PreparedStatement pstmt=null;
//		ResultSet rs = null;
//		List<TotalMember> clist = new ArrayList();
//		TotalMember m = new TotalMember();
//		try {
//			pstmt=conn.prepareStatement(prop.getProperty("selectPartnerList"));
//			
//			rs = pstmt.executeQuery();
//			while(rs.next()) {
//				m.setMemberNum(rs.getInt("seq_member_num"));
//				m.setMemberId(rs.getString("member_id"));
//				m.setMemberName(rs.getString("member_name"));
//				m.setMemberSep(rs.getString("member_sep"));
//				m.setMemberPw(rs.getString("member_pw"));
//				m.setMemberEmail(rs.getString("member_email"));
//				m.setMemberPhone(rs.getString("member_phone"));
//				m.setMemPostcode(rs.getString("postcode"));
//				m.setMemAddress(rs.getString("address"));
//				m.setMemDetailAddress(rs.getString("detailAddress"));
//				m.setMemExtraAddress(rs.getString("extraAddress"));
//				m.setMemberEnrolldate(rs.getDate("enrolldate"));
//				clist.add(m);
//				System.out.println("admindao selectptnlist: "+clist);
//			}
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close(rs);
//			close(pstmt);
//		}return clist;
//	}
	public List<TotalMember> selectTotalMemberList(Connection conn,int page, int numPerPage){
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		List<TotalMember> list = new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectTotalMemberList"));
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				TotalMember t = new TotalMember();
				t.setMemberNum(rs.getInt("seq_member_num"));
				t.setMemberId(rs.getString("member_id"));
				t.setMemberName(rs.getString("member_name"));
				t.setMemberSep(rs.getString("member_sep"));
				t.setMemberPw(rs.getString("member_pw"));
				t.setMemberEmail(rs.getString("member_email"));
				t.setMemberPhone(rs.getString("member_phone"));
				t.setMemPostcode(rs.getString("postcode"));
				t.setMemAddress(rs.getString("address"));
				t.setMemDetailAddress(rs.getString("detailAddress"));
				t.setMemExtraAddress(rs.getString("extraAddress"));
				t.setMemberEnrolldate(rs.getDate("enrolldate"));
				t.setCustomerNum(rs.getInt("seq_customer_num"));
				t.setGender(rs.getString("gender"));
				t.setBirthday(rs.getString("birthday"));
				t.setCategory(rs.getString("category"));
				list.add(t);
				System.out.println("admindao selectMemlist: "+t);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	public int selectMemberCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		int count=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectMemberCount"));
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
//
//	public int selectPartnerCount(Connection conn) {
//		PreparedStatement pstmt = null;
//		ResultSet rs= null;
//		int result=0;
//		try {
//			pstmt=conn.prepareStatement(prop.getProperty("selectPartnerCount"));
//			rs=pstmt.executeQuery();
//			if(rs.next()) {
//				result=rs.getInt(1);
//			}
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close(rs);
//			close(pstmt);
//		}return result;
//	}
	public List<String> selectSearchId(Connection conn, String key){
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		List<String> list = new ArrayList();
		System.out.println("searchId:"+list);
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectSearchId"));
			pstmt.setString(1,"%"+key+"%");
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(rs.getString(1));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
}
