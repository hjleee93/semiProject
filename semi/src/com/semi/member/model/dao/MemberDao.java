package com.semi.member.model.dao;


import static com.semi.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.semi.member.model.vo.Customer;
import com.semi.member.model.vo.Member;
import com.semi.member.model.vo.TotalMember;




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
	public TotalMember selectCustomerModify(Connection conn, int seq) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		TotalMember t = null;
		try {
			pstmt= conn.prepareStatement(prop.getProperty("selectCustomerOne"));
			pstmt.setInt(1, seq);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				t =new TotalMember();
				System.out.println("rs.getInt(1): " + rs.getInt(1));
				
				t.setMemberNum(rs.getInt(1));
				t.setMemberId(rs.getString(2));
				t.setMemberName(rs.getString(3));
				t.setMemberSep(rs.getString(4));
				t.setMemberPw(rs.getString(5));
				t.setMemberEmail(rs.getString(6));
				t.setMemberPhone(rs.getString(7));
				t.setMemPostcode(rs.getString(8));
				t.setMemAddress(rs.getString(9));
				t.setMemDetailAddress(rs.getString(10));
				t.setMemExtraAddress(rs.getString(11));
				t.setMemberEnrolldate(rs.getDate(12));
				t.setCustomerNum(rs.getInt(13));
				t.setGender(rs.getString(14));
				t.setBirthday(rs.getString(15));
				t.setCategory(rs.getString(16));
				
				System.out.println("c in dao: " + t);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return t;
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
	
	public int memberUpdate(Connection conn, TotalMember t) {
		PreparedStatement pstmt = null;
		int memresult = 0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("updatetotalMember"));
			pstmt.setString(1, t.getMemberName());
			pstmt.setString(2, t.getMemberPw());
			pstmt.setString(3, t.getMemberEmail());
			pstmt.setString(4, t.getMemberPhone());
			pstmt.setString(5, t.getMemPostcode());
			pstmt.setString(6, t.getMemAddress());
			pstmt.setString(7, t.getMemDetailAddress());
			pstmt.setString(8, t.getMemExtraAddress());
			pstmt.setString(9, t.getMemberId());
			memresult=pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return memresult;
	}
	public int customerUpdate(Connection conn, Customer c) {
		PreparedStatement pstmt = null;
		int ctmresult = 0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("updatecustomer"));
			pstmt.setString(1, c.getCategory());
			pstmt.setInt(2, c.getCustomerNum());
			ctmresult=pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return ctmresult;
	}

}
