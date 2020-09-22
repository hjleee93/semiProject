package com.semi.admin.store.service;

import static com.semi.common.JDBCTemplate.close;
import static com.semi.common.JDBCTemplate.commit;
import static com.semi.common.JDBCTemplate.getConnection;
import static com.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.semi.admin.store.dao.StoreDao;
import com.semi.store.model.vo.Store;

public class StoreService {

	private StoreDao dao = new StoreDao();
	
	public List<Store> selectStoreList(int page, int numPerPage){
		Connection conn = getConnection();
		List<Store> list = dao.selectStoreList(conn, page, numPerPage);
		close(conn);
		System.out.println("storelist in dao "+list);
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
	public int updateStoreStatus(int storeId) {
		Connection conn = getConnection();
		int result = dao.updateStoreStatus(conn,storeId);
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
