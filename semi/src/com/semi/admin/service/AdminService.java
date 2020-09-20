package com.semi.admin.service;

import static com.semi.common.JDBCTemplate.close;
import static com.semi.common.JDBCTemplate.getConnection;
import static com.semi.common.JDBCTemplate.close;
import static com.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.semi.admin.dao.AdminDao;
import com.semi.member.model.vo.Member;
import com.semi.partner.model.vo.PartnerMember;

public class AdminService {

	private AdminDao dao = new AdminDao();
	
	public List<Member> selectMemberList(int cPage, int numPerPage){
		Connection conn = getConnection();
		List<Member> list = dao.selectMemberList(conn,cPage,numPerPage);
		close(conn);
		return list;
	}
	public List<PartnerMember> selectPartnerList(int cPage, int numPerPage){
		Connection conn = getConnection();
		List<PartnerMember> listpm = dao.selectPartnerList(conn,cPage,numPerPage);
		close(conn);
		return listpm;
	}
	
	public int selectMemberCount() {
		Connection conn = getConnection();
		int count= dao.selectMemberCount(conn);
		close(conn);
		return count;
	}
	public int selectPartnerCount() {
		Connection conn = getConnection();
		int count= dao.selectPartnerCount(conn);
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

