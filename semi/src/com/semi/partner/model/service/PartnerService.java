package com.semi.partner.model.service;

import static com.semi.common.JDBCTemplate.close;
import static com.semi.common.JDBCTemplate.getConnection;
import static com.semi.common.JDBCTemplate.commit;
import static com.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.semi.partner.model.dao.PartnerDao;
public class PartnerService {

	private PartnerDao dao = new PartnerDao();

	public int deleteMember2(String id) {
		Connection conn = getConnection();
		int result = dao.deleteMember2(conn,id);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
}
