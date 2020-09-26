package com.semi.rsv.model.dao;

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
import com.semi.rsv.model.vo.Reservation;
import com.semi.store.model.dao.StoreDao;
import com.semi.store.model.vo.Store;


public class ReservationDao {
	private Properties prop = new Properties();

	public ReservationDao() {
		try {
			System.out.println("예약 dao실행");
			String fileName = StoreDao.class.getResource("/sql/reservation_sql.properties").getPath();
			
			System.out.println("fileName" + fileName);
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
 
	
	public int insertStoreReservation(Connection conn, Reservation r) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("insertReservation"));
			
			pstmt.setInt(1, r.getCustomerNum());
			pstmt.setInt(2, r.getStoreId());
			pstmt.setString(3,r.getRsvDate());
			pstmt.setInt(4, r.getRsvTime());
			pstmt.setString(5, r.getRsvRequire());
			pstmt.setInt(6,r.getRsvPpl());
			
			System.out.println("예약" + r);
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;

	}

	public List<Reservation> selecetReservation(Connection conn, int ptnNum) {
		System.out.println("ptn in dao: " +ptnNum);
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		List<Reservation> list = new ArrayList();
		
		System.out.println();
		
		try {
			
			pstmt = conn.prepareStatement(prop.getProperty("selectReservation"));
			pstmt.setInt(1, ptnNum);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Reservation r = new Reservation();
				Store store = new Store();
				TotalMember tm =new TotalMember();
				
				store.setStoreName(rs.getString(1));
				tm.setMemberName(rs.getString(2));
				r.setRsvDate(rs.getString(3));
				r.setRsvTime(rs.getInt(4));
				tm.setMemberPhone(rs.getString(5));
				r.setRsvPpl(rs.getInt(6));
				r.setRsvRequire(rs.getString(7));
				
				r.setStore(store);
				r.setTm(tm);
				
			
								
				list.add(r);
				
			}
			
			
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}


	public List<Reservation> selecetAllReservation(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Reservation> list = new ArrayList();
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectAllReservation"));
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Reservation r = new Reservation();
				Store store = new Store();
				TotalMember tm =new TotalMember();
				
				store.setStoreName(rs.getString(2));
				tm.setMemberName(rs.getString(3));
				r.setRsvDate(rs.getString(4));
				r.setRsvTime(rs.getInt(5));
				tm.setMemberPhone(rs.getString(6));
				r.setRsvPpl(rs.getInt(7));
				r.setRsvRequire(rs.getString(8));
				
				r.setStore(store);
				r.setTm(tm);
				
			
								
				list.add(r);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}


	public int selectRsvCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectRsvCount"));
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
}
