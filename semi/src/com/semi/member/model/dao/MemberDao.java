package com.semi.member.model.dao;


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

import com.semi.member.model.vo.Customer;
import com.semi.member.model.vo.Member;




public class MemberDao {

	private Properties prop = new Properties();
	
	public MemberDao() {
		// TODO Auto-generated constructor stub
		try {
			String fileName=MemberDao.class.getResource("/sql/member_sql.properties").getPath();
			prop.load(new FileReader(fileName));
			System.out.println("fileName :" + fileName);
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
			System.out.println("id in dao: " + id + ": " + pw);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m = new Member();
				m.setMemberNum(rs.getInt(1));
				m.setMemberId(rs.getString(2));
				m.setMemberName(rs.getString(3));
				m.setMemberSep(rs.getString(4));
				m.setMemberPw(rs.getString(5));
				m.setMemberEmail(rs.getString(6));
				m.setMemberPhone(rs.getString(7));
				m.setMemPostcode(rs.getString(8));
				m.setMemAddress(rs.getString(9));
				m.setMemDetailAddress(rs.getString(10));
				m.setMemExtraAddress(rs.getString(11));
				m.setMemberEnrolldate(rs.getDate(12));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}
	
	
	public Member selectPartnerModify(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = null;
		try {
			pstmt= conn.prepareStatement(prop.getProperty("selectPartnerOne"));
			
			pstmt.setString(1, id);
			System.out.println("id in dao: " + id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=new Member();
				System.out.println("membernum : "+ rs.getInt(1));
				m.setMemberNum(rs.getInt(1));
				m.setMemberId(rs.getString(2));
				m.setMemberName(rs.getString(3));
				m.setMemberSep(rs.getString(4));
				m.setMemberPw(rs.getString(5));
				m.setMemberEmail(rs.getString(6));
				m.setMemberPhone(rs.getString(7));
				m.setMemPostcode(rs.getString(8));
				m.setMemAddress(rs.getString(9));
				m.setMemDetailAddress(rs.getString(10));
				m.setMemExtraAddress(rs.getString(11));
				m.setMemberEnrolldate(rs.getDate(12));
				
				
				System.out.println("m in dao: " + m);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return m;
	}
	public Member selectCustomerModify(Connection conn, int seq) {
		Customer c = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = null;
		try {
			pstmt= conn.prepareStatement(prop.getProperty("selectCustomerOne"));
			pstmt.setInt(1, seq);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m =new Member();
				c= new Customer();
				System.out.println("rs.getInt(1): " + rs.getInt(1));
				
				m.setMemberNum(rs.getInt(1));
				m.setMemberId(rs.getString(2));
				m.setMemberName(rs.getString(3));
				m.setMemberSep(rs.getString(4));
				m.setMemberPw(rs.getString(5));
				m.setMemberEmail(rs.getString(6));
				m.setMemberPhone(rs.getString(7));
				m.setMemPostcode(rs.getString(8));
				m.setMemAddress(rs.getString(9));
				m.setMemDetailAddress(rs.getString(10));
				m.setMemExtraAddress(rs.getString(11));
				m.setMemberEnrolldate(rs.getDate(12));
				c.setCustomerNum(rs.getInt(13));
				c.setGender(rs.getString(14));
				c.setBirthday(rs.getString(15));
				c.setCategory(rs.getString(16));
				
				m.customer = c;
				
				System.out.println("c in dao: " + m.customer);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return m;
	}
//	private Member inputData(ResultSet rs) {
//		Member m=new Member();
//		try {
//			m.setMemberNum(rs.getInt(1));
//			m.setMemberId(rs.getString(2));
//			m.setMemberName(rs.getString(3));
//			m.setMemberSep(rs.getString(4));
//			m.setMemberPw(rs.getString(5));
//			m.setMemberEmail(rs.getString(6));
//			m.setMemberPhone(rs.getString(7));
//			m.setMemPostcode(rs.getString(8));
//			m.setMemAddress(rs.getString(9));
//			m.setMemDetailAddress(rs.getString(10));
//			m.setMemExtraAddress(rs.getString(11));
//			m.setMemberEnrolldate(rs.getDate(12));
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}
//		return m;
//	}
//	
//	
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
	
	public int partnerUpdate(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("updatePartner"));
			pstmt.setString(1, m.getMemberName());
			pstmt.setString(2, m.getMemberPw());
			pstmt.setString(3, m.getMemberEmail());
			pstmt.setString(4, m.getMemberPhone());
			pstmt.setString(5, m.getMemPostcode());
			pstmt.setString(6, m.getMemAddress());
			pstmt.setString(7, m.getMemDetailAddress());
			pstmt.setString(8, m.getMemExtraAddress());
			pstmt.setString(9, m.getMemberId());
			result=pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public int memberUpdate(Connection conn, Customer c) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("updateMember"));
			pstmt.setString(1, c.getMember().getMemberName());
			pstmt.setString(2, c.getMember().getMemberPw());
			pstmt.setString(3, c.getMember().getMemberEmail());
			pstmt.setString(4, c.getMember().getMemberPhone());
			pstmt.setString(5, c.getMember().getMemPostcode());
			pstmt.setString(6, c.getMember().getMemAddress());
			pstmt.setString(7, c.getMember().getMemDetailAddress());
			pstmt.setString(8, c.getMember().getMemExtraAddress());
			pstmt.setString(9, c.getGender());
			pstmt.setString(10, c.getBirthday());
			pstmt.setString(11, c.getCategory());
			pstmt.setInt(12, c.getCustomerNum());
			result=pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}

}
