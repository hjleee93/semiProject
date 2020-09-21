package com.semi.recommand.service;

import static com.semi.common.JDBCTemplate.close;
import static com.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.semi.recommand.model.dao.StoreRandomDao;
import com.semi.store.model.vo.Store;

public class StoreRandomService {

	
	private StoreRandomDao dao = new StoreRandomDao();
	
	
	public Store selectRandomStore() {
		Connection conn=getConnection();
		Store m=dao.selectRandomStore(conn);
		System.out.println("m in service: " + m);
		close(conn);
		return m;
	}
	
	public Store selectRandomPub() {
		Connection conn=getConnection();
		Store m2=dao.selectRandomPub(conn);
		System.out.println("m2 in service: " + m2);
		close(conn);
		return m2;
	}
	

	public Store selectRandomRes() {
		Connection conn=getConnection();
		Store m3=dao.selectRandomRes(conn);
		System.out.println("m3 in service: " + m3);
		close(conn);
		return m3;
	}
	

}