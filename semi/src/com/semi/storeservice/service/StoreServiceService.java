package com.semi.storeservice.service;

import static com.semi.common.JDBCTemplate.close;
import static com.semi.common.JDBCTemplate.commit;
import static com.semi.common.JDBCTemplate.getConnection;
import static com.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.semi.storeservice.model.dao.StoreServiceDao;
import com.semi.storeservice.model.vo.StoreService;

public class StoreServiceService {

	private StoreServiceDao dao = new StoreServiceDao();
	
	public List<StoreService> selectService(int storeId, int ptnNum) {
		Connection conn=getConnection();
		List<StoreService> list=dao.selectService(conn,storeId,ptnNum);
		close(conn);
		return list;
	}
	
	

	public int insertStoreService(StoreService ss) {
		Connection conn=getConnection();
		int result=dao.insertStoreService(conn,ss);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}


	
}
