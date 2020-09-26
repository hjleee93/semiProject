package com.semi.admin.order.service;

import static com.semi.common.JDBCTemplate.close;
import static com.semi.common.JDBCTemplate.commit;
import static com.semi.common.JDBCTemplate.getConnection;
import static com.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.semi.admin.notice.vo.Notice;
import com.semi.admin.order.dao.OrderDao;
import com.semi.admin.order.vo.Order;

public class OrderService {

	private OrderDao dao = new OrderDao();
	
	public List<Order> selectTotalOrderList(int page, int numPerPage) {
		Connection conn = getConnection();
		List<Order> list = dao.selectTotalOrderList(conn,page,numPerPage);
		close(conn);
		return list;
	}
	public int selectOrderCount() {
		Connection conn = getConnection();
		int count = dao.selectOrderCount(conn);
		close(conn);	
		return count;
	}
	
//	public Order selectOrderOne(int no) {
//		Connection conn = getConnection();
//		Order r = dao.selectOrderOne(conn,no);
//		close(conn);
//		System.out.println("Orderservice"+r);
//		return r;
//	}
//	public int OrderDelete(int no) {
//		Connection conn = getConnection();
//		int result = dao.OrderDelete(conn,no);
//		if(result>0) commit(conn);
//		else rollback(conn);
//		close(conn);
//		return result;
//	}
//	public int modifyOrder(Order r) {
//		Connection conn = getConnection();
//		int result = dao.modifyOrder(conn,r);
//		if(result>0) commit(conn);
//		else rollback(conn);
//		close(conn);
//		return result;
//	}
//	public int insertOrder(Order r) {
//		Connection conn = getConnection();
//		int result = dao.insertOrder(conn,r);
//		if(result>0) commit(conn);
//		else rollback(conn);
//		close(conn);
//		return result;
//	}
}
