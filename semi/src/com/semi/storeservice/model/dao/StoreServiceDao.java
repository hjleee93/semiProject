package com.semi.storeservice.model.dao;

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
import com.semi.storeservice.model.vo.StoreSvc;




public class StoreServiceDao {
	private Properties prop = new Properties();
	
	public StoreServiceDao() {
		System.out.println("디비연결 dao");
		try {
			String fileName = StoreServiceDao.class.getResource("/sql/store_sql.properties").getPath();
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	

	
	public int insertStoreService(Connection conn, StoreSvc ss) {
		PreparedStatement pstmt=null;
		int result=0;
		
		int openTime = ss.getOpenTime();
		
		
		
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertStoreService"));
			
			
			pstmt.setInt(1, ss.getStoreId());
			pstmt.setInt(2, ss.getPtnNum());
			pstmt.setString(3, ss.getStoreDay());
			pstmt.setInt(4, ss.getOpenTime());
			pstmt.setInt(5, ss.getBreakStart());
			pstmt.setInt(6, ss.getBreakEnd());
			pstmt.setInt(7, ss.getCloseTime());
			pstmt.setString(8, ss.getStoreOff());
			pstmt.setInt(9, ss.getMinPpl());
			pstmt.setInt(10, ss.getMaxPpl());
			
			result=pstmt.executeUpdate();
			
			System.out.println("dao: " + result);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}



	public List<StoreSvc> selectService(Connection conn, int storeId, int ptnNum) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StoreSvc ss=null;
		List<StoreSvc> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectService"));
			pstmt.setInt(1, storeId);
			pstmt.setInt(2, ptnNum);
			
			System.out.println("2: " + storeId+": " + ptnNum);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ss=new StoreSvc();
				ss.setStoreId(rs.getInt(1));
				ss.setPtnNum(rs.getInt(2));
				ss.setStoreDay(rs.getString(3));
				ss.setOpenTime(rs.getInt(4));				
				ss.setBreakStart(rs.getInt(5));
				ss.setBreakEnd(rs.getInt(6));
				ss.setCloseTime(rs.getInt(7));
				ss.setStoreOff(rs.getString(8));
				ss.setMinPpl(rs.getInt(9));
				ss.setMaxPpl(rs.getInt(10));
				list.add(ss);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}



	public int updateStoreService(Connection conn, StoreSvc ss) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("updateStoreService"));
			pstmt.setInt(1, ss.getOpenTime());
			pstmt.setInt(2, ss.getBreakStart());
			pstmt.setInt(3, ss.getBreakEnd());
			pstmt.setInt(4, ss.getCloseTime());
			pstmt.setString(5, ss.getStoreOff());
			pstmt.setInt(6, ss.getMinPpl());
			pstmt.setInt(7, ss.getMaxPpl());
			pstmt.setInt(8, ss.getStoreId());
			pstmt.setInt(9, ss.getPtnNum());
			pstmt.setString(10, ss.getStoreDay());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}



	public List<StoreSvc> selectService(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StoreSvc ss=null;
		List<StoreSvc> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectAllStoreService"));
		
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ss=new StoreSvc();
				ss.setStoreId(rs.getInt(1));
				ss.setPtnNum(rs.getInt(2));
				ss.setStoreDay(rs.getString(3));
				ss.setOpenTime(rs.getInt(4));				
				ss.setBreakStart(rs.getInt(5));
				ss.setBreakEnd(rs.getInt(6));
				ss.setCloseTime(rs.getInt(7));
				ss.setStoreOff(rs.getString(8));
				ss.setMinPpl(rs.getInt(9));
				ss.setMaxPpl(rs.getInt(10));
				list.add(ss);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}




}
