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

}
