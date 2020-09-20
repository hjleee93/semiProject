package com.semi.partner.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;


import static com.semi.common.JDBCTemplate.close;

import com.semi.member.model.vo.Member;

public class PartnerDao {

	private Properties prop = new Properties();
	
	public PartnerDao() {
		// TODO Auto-generated constructor stub
		try {
			String fileName = PartnerDao.class.getResource("/sql/partner_sql.properties").getPath();
			System.out.println("fileName: " + fileName);
			prop.load(new FileReader(fileName));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
//	public PartnerMember loginMember(Connection conn, String id, String pw) {
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		PartnerMember pm = null;
//		System.out.println("id: " + id + " pw: " + pw);
//		try {
//			pstmt = conn.prepareStatement(prop.getProperty("selectMember"));
//			pstmt.setString(1, id);
//			pstmt.setString(2, pw);
//			rs=pstmt.executeQuery();
//			
//			if(rs.next()) {
//				
//				pm = new PartnerMember();
//				pm.setPartnerNum(rs.getInt(1));
//				pm.setPartnerId(rs.getString(2));
//				pm.setPartnerName(rs.getString(3));
//				pm.setPartnerPw(rs.getString(4));
//				pm.setPartnerEmail(rs.getString(5));
//				pm.setPartnerPhone(rs.getString(6));
//				pm.setPostcode(rs.getString(7));
//				pm.setAddress(rs.getString(8));
//				pm.setDetailAddress(rs.getString(9));
//				pm.setExtraAddress(rs.getString(10));
//				pm.setPartnerEnrolldate(rs.getDate(11));
//				
//			}
//			System.out.println("login member in dao : " + pm);
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close(rs);
//			close(pstmt);
//		}
//		return pm;
//	}
//	
//	public PartnerMember selectMember(Connection conn, String id) {
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		PartnerMember pm = null;
//		try {
//			pstmt= conn.prepareStatement(prop.getProperty("selectMemberOne"));
//			pstmt.setString(1, id);
//			rs=pstmt.executeQuery();
//			if(rs.next()) {
////				pm=inputData(rs);
//				pm = new PartnerMember();
//				pm.setPartnerNum(rs.getInt("partner_num"));
//				pm.setPartnerId(rs.getString("partner_id"));
//				pm.setPartnerName(rs.getString("partner_name"));
//				pm.setPartnerPw(rs.getString("partner_pw"));
//				pm.setPartnerEmail(rs.getString("partner_email"));
//				pm.setPartnerPhone(rs.getString("partner_phone"));
//				pm.setPostcode(rs.getString("postcode"));
//				pm.setAddress(rs.getString("address"));
//				pm.setDetailAddress(rs.getString("detailAddress"));
//				pm.setExtraAddress(rs.getString("extraAddress"));
//				pm.setPartnerEnrolldate(rs.getDate("partner_enrolldate"));
//			}
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}
//		return pm;
//	}
//	private PartnerMember inputData(ResultSet rs) {
//		PartnerMember pm=new PartnerMember();
//		try {
//		pm.setPartner_num(rs.getInt("partner_num"));
//		pm.setPartner_id(rs.getString("partner_id"));
//		pm.setPartner_name(rs.getString("partner_name"));
//		pm.setPartner_pw(rs.getString("partner_pw"));
//		pm.setPartner_email(rs.getString("partner_email"));
//		pm.setPartner_phone(rs.getString("partner_phone"));
//		pm.setPostcode(rs.getString("postcode"));
//		pm.setAddress(rs.getString("address"));
//		pm.setDetailAddress(rs.getString("detailAddress"));
//		pm.setExtraAddress(rs.getString("extraAddress"));
//		pm.setPartner_enrolldate(rs.getDate("partner_enrolldate"));
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}
//		return pm;
//	}
//	
//	
//	public int memberUpdate(Connection conn, PartnerMember pm) {
//		PreparedStatement pstmt = null;
//		int result = 0;
//		try {
//			pstmt=conn.prepareStatement(prop.getProperty("updateMember"));
//			pstmt.setString(1, pm.getPartner_name());
//			pstmt.setString(2, pm.getPartner_pw());
//			pstmt.setString(3, pm.getPartner_email());
//			pstmt.setString(4, pm.getPartner_phone());
//			pstmt.setString(5, pm.getPostcode());
//			pstmt.setString(6, pm.getAddress());
//			pstmt.setString(7, pm.getDetailAddress());
//			pstmt.setString(8, pm.getExtraAddress());
//			pstmt.setString(9, pm.getPartner_id());
//			result=pstmt.executeUpdate();
//		}catch(SQLException e){
//			e.printStackTrace();
//		}finally {
//			close(pstmt);
//		}return result;
//	}
//	
//	public int deleteMember(Connection conn, String id) {
//		PreparedStatement pstmt = null;
//		int result = 0;
//		try {
//			pstmt = conn.prepareStatement(prop.getProperty("deleteMember"));
//			pstmt.setString(1, id);
//			result = pstmt.executeUpdate();
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close(pstmt);
//		}return result;
//	}
//	
//	public int deleteMember2(Connection conn, String mypagedelete) {
//		PreparedStatement pstmt = null;
//		int result = 0;
//		try {
//			pstmt = conn.prepareStatement(prop.getProperty("deleteMember2"));
//			pstmt.setString(1, mypagedelete);
//			result = pstmt.executeUpdate();
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close(pstmt);
//		}return result;
//	}
	
	
	
}
