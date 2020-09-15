package com.semi.mypage.model.service;

import static com.semi.common.JDBCTemplate.close;
import static com.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.semi.mypage.dao.PtnStoreListDao;
import com.semi.store.model.vo.Store;

public class PtnStoreListService {

	private PtnStoreListDao dao=new PtnStoreListDao();
	
	public List<Store> selectPtnStoreList(int cPage, int numPerPage){
		Connection conn=getConnection();
		List<Store> list=dao.selectPtnStoreList(conn,cPage,numPerPage);
		close(conn);
		return list;
		
	}
	
	public int PtnStoreListCount() {
		Connection conn=getConnection();
		int count=dao.PtnStoreListCount(conn);
		close(conn);
		return count;
	}
	
	
}
