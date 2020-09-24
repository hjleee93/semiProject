package com.semi.admin.service;

import static com.semi.common.JDBCTemplate.close;
import static com.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.semi.admin.dao.AdminDao;
import com.semi.member.model.vo.TotalMember;

public class AdminService {

	private AdminDao dao = new AdminDao();
	
//	public List<TotalMember> selectPartnerList(int page, int numPerPage){
//		Connection conn = getConnection();
//		List<TotalMember> clist = dao.selectPartnerList(conn,page,numPerPage);
//		close(conn);
//		return clist;
//	}
	public List<TotalMember> selectTotalMemberList(int page, int numPerPage){
		Connection conn = getConnection();
		List<TotalMember> list = dao.selectTotalMemberList(conn,page,numPerPage);
		close(conn);
		return list;
	}
	
	public int selectMemberCount() {
		Connection conn = getConnection();
		int count= dao.selectMemberCount(conn);
		close(conn);
		return count;
	}
	
	
	public List<String> selectSearchId(String key){
		Connection conn=getConnection();
		List<String> list = dao.selectSearchId(conn,key);
		close(conn);
		return list;
	}
	
		
		
	}

