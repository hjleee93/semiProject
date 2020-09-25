package com.semi.rsv.service;

import static com.semi.common.JDBCTemplate.close;
import static com.semi.common.JDBCTemplate.commit;
import static com.semi.common.JDBCTemplate.getConnection;
import static com.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.semi.rsv.model.vo.Reservation;
import com.semi.rsv.model.dao.ReservationDao;

public class ReservationService {
	
	private ReservationDao dao = new ReservationDao();
	
	public int insertReservation(Reservation r) {
		System.out.println("예약 서비스 실행");
		Connection conn=getConnection();
		int result=dao.insertStoreReservation(conn,r);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

}
