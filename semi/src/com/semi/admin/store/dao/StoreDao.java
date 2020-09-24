package com.semi.admin.store.dao;

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

import com.semi.store.model.vo.Store;


public class StoreDao {

	private Properties prop = new Properties();
	
	public StoreDao() {
		// TODO Auto-generated constructor stub
		try {
			String path=StoreDao.class.getResource("/sql/admin_store_status_sql.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Store> selectStoreList(Connection conn,int page,int numPerPage){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Store> list = new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectStoreList"));
			pstmt.setInt(1, (page-1)*numPerPage+1);
			pstmt.setInt(2, page*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Store s = new Store();
				s.setStoreId(rs.getInt("store_id"));
				s.setStoreCategory(rs.getString("category"));
				s.setStoreDtlCtgry(rs.getString("dtl_category"));
				s.setStoreName(rs.getString("storeName"));
				s.setStorePhone(rs.getString("phone"));
				s.setStorePost(rs.getString("store_post"));
				s.setStoreAddress(rs.getString("store_addr"));
				s.setStoreDtlAddr(rs.getString("store_dtl_addr"));
				s.setStoreExtraAddr(rs.getString("store_extra_addr"));
				s.setStoreContent(rs.getString("store_content"));
				s.setStorePage(rs.getString("homepage"));
				s.setStoreProfit(rs.getString("store_profit"));
				s.setStoreTarget(rs.getString("store_target"));
				s.setStoreMainImg(rs.getString("main_img"));
				s.setStorePostImg(rs.getString("post_img"));
				s.setStoreDtlImg(rs.getString("detail_img"));
				s.setPtnNum(rs.getInt("ptn_num"));
				s.setStoreStatus(rs.getString("join_status"));
				s.setRequestDate(rs.getDate("request_date"));
				s.setPromoText(rs.getString("promo_text"));
				list.add(s);
			}
			System.out.println("storelist"+list);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	public int selectStoreCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectStoreCount"));
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return count;
	}
	
	public int selectWaitingCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectWaitingCount"));
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return count;
	}
	
	public int updateStoreStatus(Connection conn, String id) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("updateStoreStatus").replace("$value", id));
			result=pstmt.executeUpdate();
			System.out.println("storedao"+result);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	public int updateStoreHold(Connection conn, String id) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("updateStoreHold").replace("$value", id));
			result=pstmt.executeUpdate();
			System.out.println("storedao"+result);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	public int updateStoreDecline(Connection conn, String id) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("updateStoreDecline").replace("$value", id));
			result=pstmt.executeUpdate();
			System.out.println("storedao"+result);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
}
