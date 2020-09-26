package com.semi.admin.order.dao;

import static com.semi.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.semi.admin.notice.vo.Notice;
import com.semi.admin.order.vo.Order;

public class OrderDao {

	private Properties prop = new Properties();
	
	public OrderDao() {
		// TODO Auto-generated constructor stub
		try {
			String fileName=OrderDao.class.getResource("/sql/admin_sql.properties").getPath();
			prop.load(new FileReader(fileName));
		}catch(IOException e) {
			e.printStackTrace();
		}
		
	}
	public List<Order> selectTotalOrderList(Connection conn, int page, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Order> list = new ArrayList();
		try {
			String sql = "select DISTINCT r.reservation_code,t.member_id,t.member_name,s.storename,sm.menu_name,r.resevation_date,r.reservation_time,r.reservation_requiry,r.payment_code,r.rsv_ppl,r.pay_date from (select rownum as rnum, r.* from (select * from reservation order by resevation_date desc)r)r,totalmember t, store s,storemenu sm where rnum between ? and ? and t.seq_member_num=r.customer_num";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (page-1)*numPerPage+1);
			pstmt.setInt(2, page*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Order r = new Order();
				r.setRsvCode(rs.getInt(1));
				r.setMemberId(rs.getString(2));
				r.setMemberName(rs.getString(3));
				r.setStoreName(rs.getString(4));
				r.setMenuName(rs.getString(5));
				r.setRsvDate(rs.getString(6));
				r.setRsvTime(rs.getInt(7));
				r.setRsvRequiry(rs.getString(8));
				r.setPaymentCode(rs.getInt(9));
				r.setRsvPPL(rs.getInt(10));
				r.setPayDate(rs.getDate(11));
				list.add(r);
			}
		}catch(SQLException e) {
				e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}System.out.println("orderdaolist"+list);
		return list;

	}
	public int selectOrderCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count=0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectOrderCount"));
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return count;
		
	}
//	public Order selectOrderOne(Connection conn, int no) {
//		PreparedStatement pstmt=null;
//		ResultSet rs = null;
//		Order r = null;
//		try {
//			pstmt=conn.prepareStatement(prop.getProperty("selectOrderOne"));
//			pstmt.setInt(1, no);
//			rs=pstmt.executeQuery();
//			if(rs.next()) {
//				r=new Order();
//				r.setOrderNum(rs.getInt(1));
//				r.setOrderTitle(rs.getString(2));
//				r.setOrderCategory(rs.getString(3));
//				r.setOrderWriter(rs.getString(4));
//				r.setOrderContent(rs.getString(5));
//				r.setOrderMark(rs.getString(6));
//				r.setEnrolldate(rs.getDate(7));
//				System.out.println("Order dao "+r);
//			}
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close(rs);
//			close(pstmt);
//		}return r;
//	}
//	public int OrderDelete(Connection conn, int no) {
//		PreparedStatement pstmt = null;
//		int result=0;
//		try {
//			pstmt=conn.prepareStatement(prop.getProperty("OrderDelete"));
//			pstmt.setInt(1, no);
//			result=pstmt.executeUpdate();
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close(pstmt);
//		}return result;
//		
//	}
//	public int modifyOrder(Connection conn, Order r) {
//		PreparedStatement pstmt = null;
//		int result = 0;
//		try {
//			pstmt=conn.prepareStatement(prop.getProperty("modifyOrder"));
//			pstmt.setString(1, r.getOrderTitle());
//			pstmt.setString(2, r.getOrderCategory());
//			pstmt.setString(3, r.getOrderWriter());
//			pstmt.setString(4, r.getOrderContent());
//			pstmt.setString(5, r.getOrderMark());
//			pstmt.setInt(6, r.getOrderNum());;
//			result=pstmt.executeUpdate();
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close(pstmt);
//		}return result;
//	}
//	public int insertOrder(Connection conn, Order r) {
//		PreparedStatement pstmt = null;
//		int result = 0;
//		try {
//			pstmt=conn.prepareStatement(prop.getProperty("insertOrder"));
//			pstmt.setString(1, r.getOrderTitle());
//			pstmt.setString(2, r.getOrderCategory());
//			pstmt.setString(3, r.getOrderWriter());
//			pstmt.setString(4, r.getOrderContent());
//			pstmt.setString(5, r.getOrderMark());
//			result = pstmt.executeUpdate();
//			System.out.println("result in Orderdao" +result);
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close(pstmt);
//		}return result;
//	}

	
}
