package com.semi.member.model.service;

import static com.semi.common.JDBCTemplate.close;
import static com.semi.common.JDBCTemplate.commit;
import static com.semi.common.JDBCTemplate.getConnection;
import static com.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.semi.member.model.dao.MemberDao;
import com.semi.member.model.vo.Customer;
import com.semi.member.model.vo.Member;
import com.semi.member.model.vo.Partner;
import com.semi.member.model.vo.TotalMember;

public class MemberService {

	private MemberDao dao = new MemberDao();
	
	
	public Member loginMember(String id,String pw) {
		System.out.println("login in service: " + id + " :" + pw);
		Connection conn= getConnection();
		
		Member m = dao.loginMember(conn,id,pw);
		close(conn);
		return m;
	}
	
	public TotalMember selectMemberOne(String id) {
		Connection conn=getConnection();
		TotalMember m1 = dao.selectMemberOne(conn,id);
		close(conn);
		return m1;
	}
	
	public Member selectPartnerModify(String id) {
		Connection conn=getConnection();
		System.out.println("id in service : " + id);
		Member m = dao.selectPartnerModify(conn,id);
		close(conn);
		return m;
	}
	
	public int insertMember1(TotalMember m) {
		System.out.println("service m : "+m);
		Connection conn=getConnection();
		int result=dao.insertMember1(conn,m);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int insertMember2(TotalMember m1,Customer m2) {
		System.out.println("service m2 : "+m2);
		Connection conn=getConnection();
		int result2=dao.insertMember2(conn,m1,m2);
		if(result2>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result2;
	}
	
	
	public int insertPartner(TotalMember m) {
		System.out.println("service partner m : "+m);
		Connection conn=getConnection();
		int result=dao.insertPartner(conn,m);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	
	public int insertPartner2(Partner m) {
		System.out.println("service partner m : "+m);
		Connection conn=getConnection();
		int result=dao.insertPartner2(conn,m);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	

	public TotalMember selectCustomerModify(int seq) {
		Connection conn=getConnection();
		TotalMember t = dao.selectCustomerModify(conn,seq);
		close(conn);
		return t; 
	}
	public int memberUpdate(TotalMember t) {
		Connection conn=getConnection();
		int memresult = dao.memberUpdate(conn,t);
		if(memresult>0) commit(conn);
		else rollback(conn);
		close(conn);
		return memresult;
	}
	public int customerUpdate(Customer c) {
		Connection conn=getConnection();
		int ctmresult = dao.customerUpdate(conn,c);
		if(ctmresult>0) commit(conn);
		else rollback(conn);
		close(conn);
		System.out.println("ctmresult in service : "+ctmresult);
		return ctmresult;
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
