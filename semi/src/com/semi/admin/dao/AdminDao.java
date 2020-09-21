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

import com.semi.member.model.vo.Member;
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
	
	
	public List<Member> selectMemberList(Connection conn,int cPage, int numPerPage){
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		List<Member> list = new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectMemberList"));
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Member m = new Member();
				m.setMemberNum(rs.getInt("member_num"));
				m.setMemberId(rs.getString("member_id"));
				m.setMemberName(rs.getString("member_name"));
				m.setMemberSep(rs.getString("member_sep"));
				m.setMemberPw(rs.getString("member_pw"));
				m.setMemberEmail(rs.getString("member_email"));
				m.setMemberPhone(rs.getString("member_phone"));
				m.setMemPostcode(rs.getString("postcode"));
				m.setMemAddress(rs.getString("address"));
				m.setMemDetailAddress(rs.getString("detailAddress"));
				m.setMemExtraAddress(rs.getString("extraAddress"));
				m.setMemberEnrolldate(rs.getDate("enrolldate"));
				m.getCustomer().setCustomerNum(rs.getInt("seq_customer_num"));
				m.getCustomer().setGender(rs.getString("gender"));
				m.getCustomer().setBirthday(rs.getString("birthday"));
				m.getCustomer().setCategory(rs.getString("category"));
				
				list.add(m);
				System.out.println("admindao selectMemlist: "+list);
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
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectMemberCount"));
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

	public int selectPartnerCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectPartnerCount"));
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
	public List<String> selectSearchId(Connection conn, String key){
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		List<String> list = new ArrayList();
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
