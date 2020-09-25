package com.semi.rsv.model.dao;

import static com.semi.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.semi.rsv.model.vo.Reservation;
import com.semi.store.model.dao.StoreDao;

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

}
