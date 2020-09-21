package com.semi.recommand.model.dao;

import static com.semi.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.semi.mypage.dao.PtnStoreListDao;
import com.semi.store.model.vo.Store;


public class StoreRandomDao {
	
private Properties prop=new Properties();
	
	public StoreRandomDao() {
		try {
			String path=PtnStoreListDao.class.getResource("/sql/random_store_sql.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}

	public Store selectRandomStore(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Store m = null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectRandomStore"));
			System.out.println("dao");
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m = new Store();
				m.setStoreId(rs.getInt(1));
				m.setStoreCategory(rs.getString(2));
				m.setStoreDtlCtgry(rs.getString(3));
				m.setStoreName(rs.getString(4));
				m.setStorePhone(rs.getString(5)); 
				m.setStorePost(rs.getString(6));
				m.setStoreAddress(rs.getString(7));
				m.setStoreDtlAddr(rs.getString(8));
				m.setStoreExtraAddr(rs.getString(9));
				m.setStoreContent(rs.getString(10));
				m.setStorePage(rs.getString(11));
				m.setStoreProfit(rs.getString(12));
				m.setStoreTarget(rs.getString(13));
				m.setStoreMainImg(rs.getString("main_img"));
				m.setStorePostImg(rs.getString("post_img"));
				m.setStoreDtlImg(rs.getString("detail_img"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}
	
	
	public Store selectRandomPub(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Store m2 = null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectRandomPub"));
			System.out.println("dao");
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m2 = new Store();
				m2.setStoreId(rs.getInt(1));
				m2.setStoreCategory(rs.getString(2));
				m2.setStoreDtlCtgry(rs.getString(3));
				m2.setStoreName(rs.getString(4));
				m2.setStorePhone(rs.getString(5));
				m2.setStorePost(rs.getString(6));
				m2.setStoreAddress(rs.getString(7));
				m2.setStoreDtlAddr(rs.getString(8));
				m2.setStoreExtraAddr(rs.getString(9));
				m2.setStoreContent(rs.getString(10));
				m2.setStorePage(rs.getString(11));
				m2.setStoreProfit(rs.getString(12));
				m2.setStoreTarget(rs.getString(13));
				m2.setStoreMainImg(rs.getString("main_img"));
				m2.setStorePostImg(rs.getString("post_img"));
				m2.setStoreDtlImg(rs.getString("detail_img"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return m2;
	}
	
	
	public Store selectRandomRes(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Store m3 = null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectRandomRes"));
			System.out.println("dao");
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m3 = new Store();
				m3.setStoreId(rs.getInt(1));
				m3.setStoreCategory(rs.getString(2));
				m3.setStoreDtlCtgry(rs.getString(3));
				m3.setStoreName(rs.getString(4));
				m3.setStorePhone(rs.getString(5));
				m3.setStorePost(rs.getString(6));
				m3.setStoreAddress(rs.getString(7));
				m3.setStoreDtlAddr(rs.getString(8));
				m3.setStoreExtraAddr(rs.getString(9));
				m3.setStoreContent(rs.getString(10));
				m3.setStorePage(rs.getString(11));
				m3.setStoreProfit(rs.getString(12));
				m3.setStoreTarget(rs.getString(13));
				m3.setStoreMainImg(rs.getString("main_img"));
				m3.setStorePostImg(rs.getString("post_img"));
				m3.setStoreDtlImg(rs.getString("detail_img"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return m3;
	}
	
	
	
}
