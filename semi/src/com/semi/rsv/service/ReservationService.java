package com.semi.rsv.service;

import static com.semi.common.JDBCTemplate.close;
import static com.semi.common.JDBCTemplate.commit;
import static com.semi.common.JDBCTemplate.getConnection;
import static com.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.semi.rsv.model.vo.Reservation;
import com.semi.rsv.model.dao.ReservationDao;

public class ReservationService {
	
	private Reservation dao = new Reservation();
	
	public int insertReservation(Reservation r) {
		Connection conn=getConnection();
		int result=dao.insertStoreService(conn,r);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

}
