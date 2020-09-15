package com.semi.partner.model.service;

import static com.semi.common.JDBCTemplate.close;
import static com.semi.common.JDBCTemplate.commit;
import static com.semi.common.JDBCTemplate.getConnection;
import static com.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.semi.partner.model.dao.PartnerDao;
import com.semi.partner.model.vo.PartnerMember;
public class PartnerService {

	private PartnerDao dao = new PartnerDao();
	
	public PartnerMember loginMember(String id,String pw) {
		System.out.println("id in service: " + id +pw);
		Connection conn= getConnection();
		PartnerMember pm = dao.loginMember(conn,id,pw);
		close(conn);
		return pm;
	}
	
	public PartnerMember selectMember(String id) {
		System.out.println("id in service: " + id);
		Connection conn=getConnection();
		PartnerMember pm = dao.selectMember(conn,id);
		close(conn);
		return pm;
	}
//	public int memberUpdate(PartnerMember pm) {
//		Connection conn=getConnection();
//		int result = dao.memberUpdate(conn,pm);
//		if(result>0) commit(conn);
//		else rollback(conn);
//		close(conn);
//		return result;
//	}
//	public int deleteMember(String id) {
//		Connection conn = getConnection();
//		int result = dao.deleteMember(conn,id);
//		if(result>0) commit(conn);
//		else rollback(conn);
//		close(conn);
//		return result;
//	}
//	
//	public int deleteMember2(String mypagedelete) {
//		Connection conn = getConnection();
//		int result = dao.deleteMember(conn,mypagedelete);
//		if(result>0) commit(conn);
//		else rollback(conn);
//		close(conn);
//		return result;
//	}
	
}
