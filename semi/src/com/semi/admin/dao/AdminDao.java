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
import com.semi.partner.model.vo.PartnerMember;
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
				m.setMemberPw(rs.getString("member_pw"));
				m.setGender(rs.getString("gender"));
				m.setMemberAge(rs.getString("member_age"));
				m.setMemberEmail(rs.getString("member_email"));
				m.setMemberPhone(rs.getString("member_phone"));
				m.setMemPostcode(rs.getString("mem_postcode"));
				m.setMemAddress(rs.getString("mem_address"));
				m.setMemDetailAddress(rs.getString("mem_detailAddress"));
				m.setMemExtraAddress(rs.getString("mem_extraAddress"));
				m.setCategory(rs.getString("category"));
				m.setMemberEnrolldate(rs.getDate("member_enrolldate"));
				list.add(m);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	public List<PartnerMember> selectPartnerList(Connection conn,int cPage, int numPerPage){
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		List<PartnerMember> listpm = new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectPartnerList"));
			rs = pstmt.executeQuery();
			while(rs.next()) {
				PartnerMember pm = new PartnerMember();
				pm.setPartnerNum(rs.getInt("partner_num"));
				pm.setPartnerId(rs.getString("partner_id"));
				pm.setPartnerName(rs.getString("partner_name"));
				pm.setPartnerPw(rs.getString("partner_pw"));
				pm.setPartnerEmail(rs.getString("partner_email"));
				pm.setPartnerPhone(rs.getString("partner_phone"));
				pm.setPostcode(rs.getString("postcode"));
				pm.setAddress(rs.getString("address"));
				pm.setDetailAddress(rs.getString("detailAddress"));
				pm.setExtraAddress(rs.getString("extraAddress"));
				pm.setPartnerEnrolldate(rs.getDate("partner_enrolldate"));
				listpm.add(pm);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return listpm;
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
