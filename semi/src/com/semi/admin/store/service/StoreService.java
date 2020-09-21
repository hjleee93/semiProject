package com.semi.admin.store.service;

import java.sql.Connection;
import java.util.List;

import com.semi.admin.store.dao.StoreDao;
import com.semi.admin.store.vo.Store;
import static com.semi.common.JDBCTemplate.getConnection;
import static com.semi.common.JDBCTemplate.rollback;
import static com.semi.common.JDBCTemplate.close;
import static com.semi.common.JDBCTemplate.commit;

public class StoreService {

	private StoreDao dao = new StoreDao();
	
	public List<Store> selectStoreList(int cPage, int numPerPage){
		Connection conn = getConnection();
		List<Store> list = dao.selectStoreList(conn, cPage, numPerPage);
		close(conn);
		return list;	
	}

	public int selectStoreCount() {
		Connection conn = getConnection();
		int count = dao.selectStoreCount(conn);
		close(conn);
		return count;
	}
	
	public int selectWaitingCount() {
		Connection conn = getConnection();
		int count = dao.selectWaitingCount(conn);
		close(conn);
		return count;
	}
	public int updateStoreStatus(int id) {
		Connection conn = getConnection();
		int result = dao.updateStoreStatus(conn,id);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	/*
	 * public List<Store> updateListStatus(){ Connection conn = getConnection();
	 * List<Store> updateList = dao.updateListStatus(conn);
	 * 
	 * }
	 */

}
