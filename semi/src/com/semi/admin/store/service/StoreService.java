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
	public int updateStoreStatus(String[] idArr) {
		Connection conn = getConnection();
		 String ids="";
		  for(int i=0;i<idArr.length;i++) {
			  if(i==0) ids="(";
			  ids+="'"+idArr[i]+"'";
			  if(i!=idArr.length-1) ids+=",";
			  else ids+=")";
		  }
		  System.out.println("id값 : "+ids);
		int result = dao.updateStoreStatus(conn,ids);
		
		if(result>=idArr.length) commit(conn);
		else rollback(conn);
		close(conn);
		System.out.println("service in store"+result);
		return result;
	}
	public int updateStoreHold(String[] idArr) {
		Connection conn = getConnection();
		 String ids="";
		  for(int i=0;i<idArr.length;i++) {
			  if(i==0) ids="(";
			  ids+="'"+idArr[i]+"'";
			  if(i!=idArr.length-1) ids+=",";
			  else ids+=")";
		  }
		  System.out.println("id값 : "+ids);
		int result = dao.updateStoreHold(conn,ids);
		
		if(result>=idArr.length) commit(conn);
		else rollback(conn);
		close(conn);
		System.out.println("service in store"+result);
		return result;
	}
	public int updateStoreDecline(String[] idArr) {
		Connection conn = getConnection();
		 String ids="";
		  for(int i=0;i<idArr.length;i++) {
			  if(i==0) ids="(";
			  ids+="'"+idArr[i]+"'";
			  if(i!=idArr.length-1) ids+=",";
			  else ids+=")";
		  }
		  System.out.println("id값 : "+ids);
		int result = dao.updateStoreDecline(conn,ids);
		
		if(result>=idArr.length) commit(conn);
		else rollback(conn);
		close(conn);
		System.out.println("service in store"+result);
		return result;
	}
}
