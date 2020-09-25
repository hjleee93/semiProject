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


public class AgeRecommandDao {
	
private Properties prop=new Properties();
	
	public AgeRecommandDao() {
		try {
			String path=PtnStoreListDao.class.getResource("/sql/age_store_sql.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}

	public Store selectTarget0(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Store r0 = null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectTarget0"));
			System.out.println("dao");
			rs=pstmt.executeQuery();
			if(rs.next()) {
				r0 = new Store();
				r0.setStoreId(rs.getInt(1));
				r0.setStoreCategory(rs.getString(2));
				r0.setStoreDtlCtgry(rs.getString(3));
				r0.setStoreName(rs.getString(4));
				r0.setStorePhone(rs.getString(5)); 
				r0.setStorePost(rs.getString(6));
				r0.setStoreAddress(rs.getString(7));
				r0.setStoreDtlAddr(rs.getString(8));
				r0.setStoreExtraAddr(rs.getString(9));
				r0.setStoreContent(rs.getString(10));
				r0.setStorePage(rs.getString(11));
				r0.setStoreProfit(rs.getString(12));
				r0.setStoreTarget(rs.getString(13));
				r0.setStoreMainImg(rs.getString("main_img"));
				r0.setStorePostImg(rs.getString("post_img"));
				r0.setStoreDtlImg(rs.getString("detail_img"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return r0;
	}
	
	public Store selectTarget1(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Store r1 = null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectTarget1"));
			System.out.println("dao");
			rs=pstmt.executeQuery();
			if(rs.next()) {
				r1 = new Store();
				r1.setStoreId(rs.getInt(1));
				r1.setStoreCategory(rs.getString(2));
				r1.setStoreDtlCtgry(rs.getString(3));
				r1.setStoreName(rs.getString(4));
				r1.setStorePhone(rs.getString(5));
				r1.setStorePost(rs.getString(6));
				r1.setStoreAddress(rs.getString(7));
				r1.setStoreDtlAddr(rs.getString(8));
				r1.setStoreExtraAddr(rs.getString(9));
				r1.setStoreContent(rs.getString(10));
				r1.setStorePage(rs.getString(11));
				r1.setStoreProfit(rs.getString(12));
				r1.setStoreTarget(rs.getString(13));
				r1.setStoreMainImg(rs.getString("main_img"));
				r1.setStorePostImg(rs.getString("post_img"));
				r1.setStoreDtlImg(rs.getString("detail_img"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return r1;
	}
	
	
	public Store selectTarget2(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Store r2 = null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectTarget2"));
			System.out.println("dao");
			rs=pstmt.executeQuery();
			if(rs.next()) {
				r2 = new Store();
				r2.setStoreId(rs.getInt(1));
				r2.setStoreCategory(rs.getString(2));
				r2.setStoreDtlCtgry(rs.getString(3));
				r2.setStoreName(rs.getString(4));
				r2.setStorePhone(rs.getString(5));
				r2.setStorePost(rs.getString(6));
				r2.setStoreAddress(rs.getString(7));
				r2.setStoreDtlAddr(rs.getString(8));
				r2.setStoreExtraAddr(rs.getString(9));
				r2.setStoreContent(rs.getString(10));
				r2.setStorePage(rs.getString(11));
				r2.setStoreProfit(rs.getString(12));
				r2.setStoreTarget(rs.getString(13));
				r2.setStoreMainImg(rs.getString("main_img"));
				r2.setStorePostImg(rs.getString("post_img"));
				r2.setStoreDtlImg(rs.getString("detail_img"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return r2;
	}
	
	
	public Store selectTarget3(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Store r3 = null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectTarget3"));
			System.out.println("dao");
			rs=pstmt.executeQuery();
			if(rs.next()) {
				r3 = new Store();
				r3.setStoreId(rs.getInt(1));
				r3.setStoreCategory(rs.getString(2));
				r3.setStoreDtlCtgry(rs.getString(3));
				r3.setStoreName(rs.getString(4));
				r3.setStorePhone(rs.getString(5));
				r3.setStorePost(rs.getString(6));
				r3.setStoreAddress(rs.getString(7));
				r3.setStoreDtlAddr(rs.getString(8));
				r3.setStoreExtraAddr(rs.getString(9));
				r3.setStoreContent(rs.getString(10));
				r3.setStorePage(rs.getString(11));
				r3.setStoreProfit(rs.getString(12));
				r3.setStoreTarget(rs.getString(13));
				r3.setStoreMainImg(rs.getString("main_img"));
				r3.setStorePostImg(rs.getString("post_img"));
				r3.setStoreDtlImg(rs.getString("detail_img"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return r3;
	}
	
	public Store selectTarget4(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Store r4 = null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectTarget4"));
			System.out.println("dao");
			rs=pstmt.executeQuery();
			if(rs.next()) {
				r4 = new Store();
				r4.setStoreId(rs.getInt(1));
				r4.setStoreCategory(rs.getString(2));
				r4.setStoreDtlCtgry(rs.getString(3));
				r4.setStoreName(rs.getString(4));
				r4.setStorePhone(rs.getString(5));
				r4.setStorePost(rs.getString(6));
				r4.setStoreAddress(rs.getString(7));
				r4.setStoreDtlAddr(rs.getString(8));
				r4.setStoreExtraAddr(rs.getString(9));
				r4.setStoreContent(rs.getString(10));
				r4.setStorePage(rs.getString(11));
				r4.setStoreProfit(rs.getString(12));
				r4.setStoreTarget(rs.getString(13));
				r4.setStoreMainImg(rs.getString("main_img"));
				r4.setStorePostImg(rs.getString("post_img"));
				r4.setStoreDtlImg(rs.getString("detail_img"));
				r4.setStoreDtlImg(rs.getString("detail_img"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return r4;
	}
	
}
