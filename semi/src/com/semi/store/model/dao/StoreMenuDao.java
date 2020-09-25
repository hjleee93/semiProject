package com.semi.store.model.dao;

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

import com.semi.store.model.vo.StoreMenu;

public class StoreMenuDao {
	private Properties prop = new Properties();

	public StoreMenuDao() {
		try {
			String fileName = StoreDao.class.getResource("/sql/store_sql.properties").getPath();
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public int insertStoreMenu(Connection conn, StoreMenu sm) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("storeMenuInsert"));

			pstmt.setInt(1, sm.getStoreId());
			pstmt.setString(2, sm.getMenuName());
			pstmt.setInt(3, sm.getMenuPrice());
			pstmt.setInt(4, sm.getMenuAmount());
			pstmt.setString(5, sm.getMenuDetail());
			pstmt.setString(6, sm.getMenuImg());
			pstmt.setInt(7,  sm.getPtnId());
			
			System.out.println("메뉴: " + sm);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;

	}

	public StoreMenu selectStoreMenu(Connection conn, int storeId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StoreMenu sm = null;
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectStoreMenu"));
			pstmt.setInt(1, storeId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				sm = new StoreMenu();
				
				sm.setStoreId(rs.getInt(1));
				sm.setMenuName(rs.getString(2));
				sm.setMenuPrice(rs.getInt(3));
				sm.setMenuAmount(rs.getInt(4));
				sm.setMenuDetail(rs.getString(5));
				sm.setMenuImg(rs.getString(6));
				sm.setPtnId(rs.getInt(7));
				
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return sm;
	}

	public List<StoreMenu> selectStoreMenuList(Connection conn, int storeId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<StoreMenu> list= new ArrayList();
		
		try {
			
			
			pstmt = conn.prepareStatement(prop.getProperty("selectStoreMenu"));
			pstmt.setInt(1,storeId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				StoreMenu sm = new StoreMenu();
				
				sm.setStoreId(rs.getInt(1));
				sm.setMenuName(rs.getString(2));
				sm.setMenuPrice(rs.getInt(3));
				sm.setMenuAmount(rs.getInt(4));
				sm.setMenuDetail(rs.getString(5));
				sm.setMenuImg(rs.getString(6));
				sm.setPtnId(rs.getInt(7));
				
				list.add(sm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
}
