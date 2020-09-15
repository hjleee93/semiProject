package com.semi.member.model.service;



import static com.semi.common.JDBCTemplate.close;
import static com.semi.common.JDBCTemplate.commit;
import static com.semi.common.JDBCTemplate.getConnection;
import static com.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.semi.member.model.dao.MemberDao;
import com.semi.member.model.vo.Member;
import com.semi.partner.model.vo.PartnerMember;

public class MemberService {

	private MemberDao dao = new MemberDao();
	
	
	public Member loginMember(String id,String pw) {
		Connection conn= getConnection();
		Member m = dao.loginMember(conn,id,pw);
		close(conn);
		return m;
	}
	
	public Member selectMember(String id) {
		Connection conn=getConnection();
		Member m = dao.selectMember(conn,id);
		close(conn);
		return m;
	}
	public int memberUpdate(Member m) {
		Connection conn=getConnection();
		int result = dao.memberUpdate(conn,m);
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
