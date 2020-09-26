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
import com.semi.member.model.vo.SearchMember;
import com.semi.member.model.vo.TotalMember;
import com.semi.rsv.model.vo.Reservation;
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
	
	
	public List<Member> selectMemberList(Connection conn,int page, int numPerPage){
		//paging totalmember 파트너
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		List<Member> list = new ArrayList();
		Member m = new Member();
		try {
			String sql = "SELECT * FROM (SELECT ROWNUM AS RNUM, T.* FROM (SELECT * FROM TOTALMEMBER where member_sep='파트너' ORDER BY ENROLLDATE DESC) T) WHERE RNUM BETWEEN ? AND ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, (page-1)*numPerPage+1);
			pstmt.setInt(2, page*numPerPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				m.setMemberNum(rs.getInt("seq_member_num"));
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
				list.add(m);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}System.out.println("admindao selectptnlist: "+list.size());
		return list;
	}
	
	public List<SearchMember> selectTotalList(Connection conn,int page, int numPerPage){
		//join 회원
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		List<SearchMember> list = new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectTotalList"));
			pstmt.setInt(1, (page-1)*numPerPage+1);
			pstmt.setInt(2, page*numPerPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				SearchMember s = new SearchMember();
				s.setMemberId(rs.getString("member_id"));
				s.setMemberName(rs.getString("member_name"));
				s.setSep(rs.getString("member_sep"));
				s.setGender(rs.getString("gender"));
				s.setBirthday(rs.getString("birthday"));
				s.setEmail(rs.getString("member_email"));
				s.setPhone(rs.getString("member_phone"));
				s.setAddress(rs.getString("address"));
				s.setCategory(rs.getString("category"));
				s.setEnrolldate(rs.getDate("enrolldate"));
				list.add(s);
				System.out.println("admindao selectMemlist: "+s);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	
	public List<TotalMember> selectTotalMemberList(Connection conn,int page, int numPerPage){
		//totalmember 회원조회 x
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
//	public List<Qna> selectQnaList(Connection conn) {
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		List<Qna> list = new ArrayList();
//		try {
//			pstmt = conn.prepareStatement(prop.getProperty("selectQnaList"));
//			rs=pstmt.executeQuery();
//			while(rs.next()) {
//				Qna n = new Qna();
//				n.setQnaNo(rs.getInt("Qna_no"));
//				n.setQnaSep(rs.getString("Qna_sep"));
//				n.setQnaTitle(rs.getString("Qna_title"));
//				n.setQnaWriter(rs.getString("Qna_writer"));
//				n.setQnaContent(rs.getString("Qna_content"));
//				n.setQnaDate(rs.getDate("QNA_DATE"));
//				n.setQnaCount(rs.getInt("Qna_count"));
//				list.add(n);
//			}
//		}catch(SQLException e) {
//				e.printStackTrace();
//		}finally {
//			close(rs);
//			close(pstmt);
//		}return list;
//
//	}
	public int selectqnaCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		int count=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectqnaCount"));
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
	
	public int selectrsvCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		int count=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectrsvCount"));
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
	
	
	//주문예약dao
	public List<Reservation> selectReservationList(Connection conn, int storeId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Reservation> list= new ArrayList();
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectReservationList"));
			pstmt.setInt(1,storeId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Reservation r = new Reservation();
				
				r.setRsvCode(rs.getInt("reservation_code"));
				r.setCustomerNum(rs.getInt("customer_num"));
				r.setStoreId(rs.getInt("store_id"));
				r.setRsvDate(rs.getString("resevation_date"));
				r.setRsvTime(rs.getInt("reservation_time"));
				r.setRsvRequire(rs.getString("reservation_requiry"));
				r.setPaymentCode(rs.getInt("payment_code"));
				r.setRsvPpl(rs.getInt("rsv_ppl"));
				list.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
}
