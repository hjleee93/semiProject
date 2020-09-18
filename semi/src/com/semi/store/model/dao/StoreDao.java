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

import com.semi.store.model.vo.Store;


public class StoreDao {

	private Properties prop = new Properties();

	public StoreDao() {
		System.out.println("디비연결 dao");
		try {
			String fileName = StoreDao.class.getResource("/sql/store_sql.properties").getPath();
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public List<Store> selectStoreList(Connection conn,int cPage, int numPerPage) {
		System.out.println("selectStore실행");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Store> list = new ArrayList();

		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectAllStoreList"));
			pstmt.setInt(1,(cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Store store = new Store();
				
				store.setStoreId(rs.getInt(1));
				store.setStoreCategory(rs.getString(2));
				store.setStoreDtlCtgry(rs.getString(3));
				store.setStoreName(rs.getString(4));
				store.setStorePhone(rs.getString(5));
				store.setStorePost(rs.getString(6));
				store.setStoreAddress(rs.getString(7));
				store.setStoreDtlAddr(rs.getString(8));
				store.setStoreExtraAddr(rs.getString(9));
				store.setStoreContent(rs.getString(10));
				store.setStorePage(rs.getString(11));
				store.setStoreProfit(rs.getString(12));
				store.setStoreTarget(rs.getString(13));
				store.setPtnNum(rs.getInt(14));
				//TODO:파트너 아이디 추가해야됨
				
				list.add(store);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public List<Store> selectStoreList(Connection conn) {
		System.out.println("selectStore실행");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Store> list = new ArrayList();
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectStoreList"));
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Store store = new Store();
				store.setStoreId(rs.getInt(1));
				store.setStoreCategory(rs.getString(2));
				store.setStoreDtlCtgry(rs.getString(3));
				store.setStoreName(rs.getString(4));
				store.setStorePhone(rs.getString(5));
				store.setStorePost(rs.getString(6));
				store.setStoreAddress(rs.getString(7));
				store.setStoreDtlAddr(rs.getString(8));
				store.setStoreExtraAddr(rs.getString(9));
				store.setStoreContent(rs.getString(10));
				store.setStorePage(rs.getString(11));
				store.setStoreProfit(rs.getString(12));
				store.setStoreTarget(rs.getString(13));
				
				//TODO:파트너 아이디 추가해야됨
				
				System.out.println("store: " + store);
				
				list.add(store);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	
	public List<Store> selectStoreCtgry(Connection conn, String category){
		System.out.println("selectStoreCtgry실행");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Store> list = new ArrayList();
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectStoreCtgry"));
			pstmt.setString(1, category);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Store store = new Store();
				store.setStoreId(rs.getInt(1));
				store.setStoreCategory(rs.getString(2));
				store.setStoreDtlCtgry(rs.getString(3));
				store.setStoreName(rs.getString(4));
				store.setStorePhone(rs.getString(5));
				store.setStorePost(rs.getString(6));
				store.setStoreAddress(rs.getString(7));
				store.setStoreDtlAddr(rs.getString(8));
				store.setStoreExtraAddr(rs.getString(9));
				store.setStoreContent(rs.getString(10));
				store.setStorePage(rs.getString(11));
				store.setStoreProfit(rs.getString(12));
				store.setStoreTarget(rs.getString(13));
				//store.setPtn_num(rs.getInt(12));
				
				list.add(store);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
		
		
	}

	public int insertStore(Connection conn, Store s) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertStore"));
			
			pstmt.setString(1, s.getStoreDtlCtgry());
			pstmt.setString(2, s.getStoreName());
			pstmt.setString(3, s.getStorePhone());
			pstmt.setString(4, s.getStorePost());
			pstmt.setString(5, s.getStoreAddress());
			pstmt.setString(6, s.getStoreDtlAddr());
			pstmt.setString(7, s.getStoreExtraAddr());
			pstmt.setString(8, s.getStoreContent());
			pstmt.setString(9, s.getStorePage());
			pstmt.setString(10, s.getStoreProfit());
			pstmt.setString(11, s.getStoreTarget());
			pstmt.setInt(12, s.getPtnNum());
			
			result=pstmt.executeUpdate();
			
			System.out.println("dao: " + result);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
		
	}

	public Store selectStoreDtl(Connection conn, int storeId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Store store = null;
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectStoreDtl"));
			pstmt.setInt(1, storeId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				store = new Store();
				store.setStoreId(rs.getInt(1));
				store.setStoreCategory(rs.getString(2));
				store.setStoreDtlCtgry(rs.getString(3));
				store.setStoreName(rs.getString(4));
				store.setStorePhone(rs.getString(5));
				store.setStorePost(rs.getString(6));
				store.setStoreAddress(rs.getString(7));
				store.setStoreDtlAddr(rs.getString(8));
				store.setStoreExtraAddr(rs.getString(9));
				store.setStoreContent(rs.getString(10));
				store.setStorePage(rs.getString(11));
				store.setStoreProfit(rs.getString(12));
				store.setStoreTarget(rs.getString(13));
				store.setPtnNum(rs.getInt(17));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return store;
	}

	
	
	public int updateStoreImg(Connection conn, Store s) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("updateStoreImg"));
			System.out.println("s.getStoreMainImg(): " + s.getStoreMainImg());
			System.out.println("s.getStoreId(): " + s.getStoreId());
			pstmt.setString(1, s.getStoreMainImg());
			pstmt.setString(2, s.getStorePostImg());
			pstmt.setString(3, s.getStoreDtlImg());
			pstmt.setString(4, s.getPromoText());
			pstmt.setInt(5, s.getStoreId());
			
			
			result=pstmt.executeUpdate();
			System.out.println("result in dao: " +result);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}

	public int selectAllStoreCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectAllStoreCount"));
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}return count;
	}
	
}
