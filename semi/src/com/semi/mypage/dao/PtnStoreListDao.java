package com.semi.mypage.dao;

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

public class PtnStoreListDao {

	private Properties prop = new Properties();

	public PtnStoreListDao() {
		try {
			String path = PtnStoreListDao.class.getResource("/sql/partner_sql.properties").getPath();
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public List<Store> selectPtnStoreList(Connection conn, int cPage, int numPerPage, int storeId) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Store> list = new ArrayList();

		try {
			pstmt = conn.prepareStatement("SELECT * FROM (SELECT ROWNUM AS RNUM, B.* FROM (SELECT * FROM STORE WHERE PTN_NUM=? ORDER BY request_date DESC) B ) WHERE RNUM BETWEEN ? AND ?");
			pstmt.setInt(1, storeId);
			pstmt.setInt(2, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(3, cPage * numPerPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Store store = new Store();
///잠시만여 제가 저거 ptn을 불러온거라 고쳐햐해요 아닌데 맞는데 뭐징 ㅎ
				store.setStoreId(rs.getInt(2));
				store.setStoreCategory(rs.getString(3));
				store.setStoreDtlCtgry(rs.getString(4));
				store.setStoreName(rs.getString(5));
				store.setStorePhone(rs.getString(6));
				store.setStorePost(rs.getString(7));
				store.setStoreAddress(rs.getString(8));
				store.setStoreDtlAddr(rs.getString(9));
				store.setStoreExtraAddr(rs.getString(10));
				store.setStoreContent(rs.getString(11));
				store.setStorePage(rs.getString(12));
				store.setStoreProfit(rs.getString(13));
				store.setStoreTarget(rs.getString(14));
				store.setStoreMainImg(rs.getString(15));
				store.setStorePostImg(rs.getString(16));
				store.setStoreDtlImg(rs.getString(17));
				store.setPtnNum(rs.getInt(18));
				store.setStoreStatus(rs.getString(19));
				store.setRequestDate(rs.getDate(20));
				store.setPromoText(rs.getString(21));
				
				list.add(store);
				System.out.println("list in (select ptn)dao: " + list);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	// store 객체랑 겹쳐서 store 객체로 수정했어요!
	public List<Store> selectPtnStoreList(Connection conn, int cPage, int numPerPage) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Store> list = new ArrayList();

		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectPtnStoreList"));
			pstmt.setInt(1, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(2, cPage * numPerPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Store store = new Store();

				store.setStoreNumber(rs.getInt(1));
				store.setStoreId(rs.getInt(2));
				store.setStoreCategory(rs.getString(3));
				store.setStoreDtlCtgry(rs.getString(4));
				store.setStoreName(rs.getString(5));
				store.setStorePhone(rs.getString(6));
				store.setStorePost(rs.getString(7));
				store.setStoreAddress(rs.getString(8));
				store.setStoreDtlAddr(rs.getString(9));
				store.setStoreExtraAddr(rs.getString(10));
				store.setStoreContent(rs.getString(11));
				store.setStorePage(rs.getString(12));
				store.setStoreProfit(rs.getString(13));
				store.setStoreTarget(rs.getString(14));
				store.setStoreStatus(rs.getString(19));

				list.add(store);
				System.out.println("list in dao: " + list);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public int PtnStoreListCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("ptnStoreListCount"));
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	public List<Store> selectPtnStoreList(Connection conn) {

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
				store.setStoreMainImg(rs.getString(14));
				store.setStorePostImg(rs.getString(15));
				store.setStoreDtlImg(rs.getString(16));
				store.setPtnNum(rs.getInt(17));
				store.setStoreStatus(rs.getString(18));
				store.setRequestDate(rs.getDate(19));
				store.setPromoText(rs.getString(20));
				
				list.add(store);
				System.out.println("list in (select ptn)dao: " + list);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	public int selectWaitingCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		int count=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("mypageCount"));
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
	
	public int selectWaitingCount2(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		int count=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("mypageCount2"));
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
}
