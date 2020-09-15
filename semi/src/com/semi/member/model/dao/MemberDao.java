package com.semi.member.model.dao;


import static com.semi.common.JDBCTemplate.close;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.semi.member.model.vo.Member;
import com.semi.partner.model.vo.PartnerMember;




public class MemberDao {

	private Properties prop = new Properties();
	
	public MemberDao() {
		// TODO Auto-generated constructor stub
		try {
			String fileName=MemberDao.class.getResource("/member/member_sql.properties").getPath();
			prop.load(new FileReader(fileName));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public Member loginMember(Connection conn, String id, String pw) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectMember"));
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m = new Member();
				m.setMember_num(rs.getInt("member_num"));
				m.setMember_id(rs.getString("member_id"));
				m.setMember_name(rs.getString("member_name"));
				m.setMember_pw(rs.getString("member_pw"));
				m.setGender(rs.getString("gender"));
				m.setMember_age(rs.getString("member_age"));
				m.setMember_email(rs.getString("member_email"));
				m.setMember_phone(rs.getString("member_phone"));
				m.setMem_postcode(rs.getString("mem_postcode"));
				m.setMem_address(rs.getString("mem_address"));
				m.setMem_detailAddress(rs.getString("mem_detailAddress"));
				m.setMem_extraAddress(rs.getString("mem_extraAddress"));
				m.setMember_enrolldate(rs.getDate("member_enrolldate"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}
	
	public Member selectMember(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = null;
		try {
			pstmt= conn.prepareStatement(prop.getProperty("selectMemberOne"));
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=inputData(rs);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return m;
	}
	private Member inputData(ResultSet rs) {
		Member m=new Member();
		try {
			m.setMember_num(rs.getInt("member_num"));
			m.setMember_id(rs.getString("member_id"));
			m.setMember_name(rs.getString("member_name"));
			m.setMember_pw(rs.getString("member_pw"));
			m.setGender(rs.getString("gender"));
			m.setMember_age(rs.getString("member_age"));
			m.setMember_email(rs.getString("member_email"));
			m.setMember_phone(rs.getString("member_phone"));
			m.setMem_postcode(rs.getString("mem_postcode"));
			m.setMem_address(rs.getString("mem_address"));
			m.setMem_detailAddress(rs.getString("mem_detailAddress"));
			m.setMem_extraAddress(rs.getString("mem_extraAddress"));
			m.setCategory(rs.getString("category"));
			m.setMember_enrolldate(rs.getDate("member_enrolldate"));
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return m;
	}
	
	
	public int deleteMember(Connection conn,String id) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("deleteMember"));
			pstmt.setString(1,id);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public int memberUpdate(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("updateMember"));
			pstmt.setString(1, m.getMember_name());
			pstmt.setString(2, m.getMember_pw());
			pstmt.setString(3, m.getGender());
			pstmt.setString(4, m.getMember_age());
			pstmt.setString(5, m.getMember_email());
			pstmt.setString(6, m.getMember_phone());
			pstmt.setString(7, m.getMem_postcode());
			pstmt.setString(8, m.getMem_address());
			pstmt.setString(9, m.getMem_detailAddress());
			pstmt.setString(10, m.getMem_extraAddress());
			pstmt.setString(11, m.getCategory());
			pstmt.setString(12, m.getMember_id());
			result=pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}

}
