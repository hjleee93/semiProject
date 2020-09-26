package com.semi.admin.service;

import static com.semi.common.JDBCTemplate.close;
import static com.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.semi.admin.dao.AdminDao;
import com.semi.member.model.vo.Member;
import com.semi.member.model.vo.SearchMember;
import com.semi.member.model.vo.TotalMember;
import com.semi.rsv.model.vo.Reservation;

public class AdminService {

	private AdminDao dao = new AdminDao();
	
//	public List<TotalMember> selectPartnerList(int page, int numPerPage){
//		Connection conn = getConnection();
//		List<TotalMember> clist = dao.selectPartnerList(conn,page,numPerPage);
//		close(conn);
//		return clist;
//	}
//	public List<TotalMember> selectMemberList(int page, int numPerPage){
//		Connection conn = getConnection();
//		List<TotalMember> list = dao.selectMemberList(conn,page,numPerPage);
//		close(conn);
//		return list;
//	}
	public List<Member> selectMemberList(int page, int numPerPage){
		//totalmember 파트너
		Connection conn = getConnection();
		List<Member> list = dao.selectMemberList(conn,page,numPerPage);
		close(conn);
		System.out.println("파트너왜도대체 servlet"+list);
		return list;
	}
	public List<SearchMember> selectTotalList(int page, int numPerPage){
		//join 멤버
		Connection conn = getConnection();
		List<SearchMember> customer = dao.selectTotalList(conn,page,numPerPage);
		close(conn);
		return customer;
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
//	public List<Qna> selectQnaList() {
//		Connection conn = getConnection();
//		List<Qna> list = dao.selectQnaList(conn);
//		close(conn);
//		return list;
//	}
	public int selectqnaCount() {
		Connection conn = getConnection();
		int count= dao.selectqnaCount(conn);
		close(conn);
		return count;
	}
	public int selectrsvCount() {
		Connection conn = getConnection();
		int count= dao.selectrsvCount(conn);
		close(conn);
		return count;
	}
	
	
	//RESERVATION SERVICE
	public List<Reservation> selectReservationList(int storeId) {
		Connection conn = getConnection();
		List<Reservation> list = dao.selectReservationList(conn,storeId);
		close(conn);
		System.out.println("service orrrrrrder"+storeId);
		System.out.println("list"+list);
		return list;
	}
		
}

