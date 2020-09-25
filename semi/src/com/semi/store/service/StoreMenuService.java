package com.semi.store.service;

import static com.semi.common.JDBCTemplate.close;
import static com.semi.common.JDBCTemplate.commit;
import static com.semi.common.JDBCTemplate.getConnection;
import static com.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.semi.store.model.dao.StoreMenuDao;
import com.semi.store.model.vo.StoreMenu;


public class StoreMenuService {
	
	private StoreMenuDao dao = new StoreMenuDao();
	
	public int insertStoreMenu(StoreMenu sm) {
		Connection conn=getConnection();
		int result = dao.insertStoreMenu(conn,sm);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public List<StoreMenu> selectStoreMenu(int storeId) {
		Connection conn = getConnection();
		List<StoreMenu> list = dao.selectStoreMenuList(conn,storeId);
		close(conn);
		return list;
	}

}
