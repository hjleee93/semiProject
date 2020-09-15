package com.semi.store.service;

import static com.semi.common.JDBCTemplate.close;
import static com.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.semi.store.model.dao.StoreDao;
import com.semi.store.model.vo.Store;

import static com.semi.common.JDBCTemplate.rollback;
import static com.semi.common.JDBCTemplate.commit;


public class StoreService {
	
	private StoreDao dao = new StoreDao();
	
	public List<Store> selectStoreList(){
		
		Connection conn = getConnection();
		List<Store> list = dao.selectStoreList(conn);
		close(conn);
		return list;
	}
	
	public List<Store> selectAllStoreList(int cPage, int numPerpage){
		
		Connection conn = getConnection();
		List<Store> list = dao.selectStoreList(conn,cPage,numPerpage);
		close(conn);
		return list;
	}
	
	public List<Store> selectStoreCtgry(String category){
		Connection conn = getConnection();
		List<Store> list = dao.selectStoreCtgry(conn,category);
		for(Store s: list) {
			System.out.println("list in service: " + list);
		}
		close(conn);
		return list;
	}
	
	public int insertStore(Store s){
		Connection conn=getConnection();
		int result=dao.insertStore(conn,s);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}


	public Store selectStoreDtl(int storeId) {
		Connection conn = getConnection();
		Store s = dao.selectStoreDtl(conn,storeId);
		close(conn);
		return s;
	}
	
	public int updateStoreImg(Store s) {
		Connection conn=getConnection();
		int result=dao.updateStoreImg(conn,s);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int selectAllStoreCount() {
		Connection conn=getConnection();
		int count=dao.selectAllStoreCount(conn);
		close(conn);
		return count;
	}
	
	

}
