package com.semi.member.model.service;

import static com.semi.common.JDBCTemplate.commit;
import static com.semi.common.JDBCTemplate.rollback;
import static com.semi.common.JDBCTemplate.close;
import static com.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.semi.member.model.dao.MemberDao;
import com.semi.member.model.vo.Customer;
import com.semi.member.model.vo.Member;

public class MemberService {

	private MemberDao dao = new MemberDao();
	
	
	public Member loginMember(String id,String pw) {
		System.out.println("login in service: " + id + " :" + pw);
		Connection conn= getConnection();
		
		Member m = dao.loginMember(conn,id,pw);
		close(conn);
		return m;
	}
	
	public Member selectMemberModify(String id) {
		Connection conn=getConnection();
		Member m = dao.selectMemberModify(conn,id);
		close(conn);
		return m;
	}
	public Customer selectCustomerModify(int seq) {
		Connection conn=getConnection();
		Customer c = dao.selectCustomerModify(conn,seq);
		close(conn);
		return c;
	}
	public int memberUpdate(Member m,Customer c) {
		Connection conn=getConnection();
		int result = dao.memberUpdate(conn,m,c);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int partnerUpdate(Member m) {
		Connection conn=getConnection();
		int result = dao.partnerUpdate(conn,m);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int deleteMember(String id) {
		// TODO Auto-generated constructor stub
		Connection conn =getConnection();
		int result=dao.deleteMember(conn,id);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
		
	
}
