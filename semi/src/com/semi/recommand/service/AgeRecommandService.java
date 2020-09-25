package com.semi.recommand.service;

import static com.semi.common.JDBCTemplate.close;
import static com.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.semi.recommand.model.dao.AgeRecommandDao;
import com.semi.store.model.vo.Store;

public class AgeRecommandService {

	
	private AgeRecommandDao dao = new AgeRecommandDao();
	
	
	public Store selectTarget0() {
		Connection conn=getConnection();
		Store r0=dao.selectTarget0(conn);
		System.out.println("r0 in service: " + r0);
		close(conn);
		return r0;
	}
	
	public Store selectTarget1() {
		Connection conn=getConnection();
		Store r1=dao.selectTarget1(conn);
		System.out.println("r1 in service: " + r1);
		close(conn);
		return r1;
	}
	

	public Store selectTarget2() {
		Connection conn=getConnection();
		Store r2=dao.selectTarget2(conn);
		System.out.println("r2 in service: " + r2);
		close(conn);
		return r2;
	}
	
	

	public Store selectTarget3() {
		Connection conn=getConnection();
		Store r3=dao.selectTarget3(conn);
		System.out.println("r3 in service: " + r3);
		close(conn);
		return r3;
	}
	

	public Store selectTarget4() {
		Connection conn=getConnection();
		Store r4=dao.selectTarget4(conn);
		System.out.println("r4 in service: " + r4);
		close(conn);
		return r4;
	}
	
	

}