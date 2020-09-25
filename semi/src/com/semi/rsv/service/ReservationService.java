package com.semi.rsv.service;

import static com.semi.common.JDBCTemplate.close;
import static com.semi.common.JDBCTemplate.commit;
import static com.semi.common.JDBCTemplate.getConnection;
import static com.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.semi.rsv.model.dao.ReservationDao;
import com.semi.rsv.model.vo.Reservation;
import com.semi.rsv.model.vo.ReservationPtnView;

public class ReservationService {
	
	private ReservationDao dao = new ReservationDao();
	
	public int insertReservation(Reservation r) {
		
		Connection conn=getConnection();
		int result=dao.insertStoreReservation(conn,r);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public List<Reservation> selectReservation(int ptnNum){
		Connection conn=getConnection();
		List<Reservation> list = dao.selecetReservation(conn,ptnNum);
		close(conn);
		return list;	
	}
	public List<Reservation> selectAllReservation(int cPage, int numPerPage){
		Connection conn=getConnection();
		List<Reservation> list = dao.selecetAllReservation(conn,cPage, numPerPage);
		close(conn);
		return list;	
	}

	public int selectRsvCount() {
		Connection conn = getConnection();
		int count = dao.selectRsvCount(conn);
		close(conn);
		return count;
	}


}
