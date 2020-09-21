package com.semi.admin.store.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.semi.admin.store.vo.Store;

import oracle.jdbc.proxy.annotation.Pre;

import static com.semi.common.JDBCTemplate.close;


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
	
	public List<Store> selectStoreList(Connection conn,int cPage,int numPerPage){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Store> list = new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectStoreList"));
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Store s = new Store();
				s.setStoreId(rs.getInt("store_id"));
				s.setCategory(rs.getString("category"));
				s.setDetailCategory(rs.getString("dtl_category"));
				s.setStoreName(rs.getString("storeName"));
				s.setPhone(rs.getString("phone"));
				s.setStorePost(rs.getString("store_post"));
				s.setStoreAddr(rs.getString("store_addr"));
				s.setStoreDetailAddr(rs.getString("store_dtl_addr"));
				s.setStoreExtraAddr(rs.getString("store_extra_addr"));
				s.setStoreContent(rs.getString("store_content"));
				s.setHomepage(rs.getString("homepage"));
				s.setMainImg(rs.getString("main_img"));
				s.setPostImg(rs.getString("post_img"));
				s.setDetailImg(rs.getString("detail_img"));
				s.setPartnerNum(rs.getInt("ptn_num"));
				s.setJoinStatus(rs.getString("join_status"));
				list.add(s);
			}
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
	
	public int updateStoreStatus(Connection conn, int id) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("updateStoreStatus"));
			pstmt.setInt(1, id);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	
}
