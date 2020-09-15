package com.semi.common;
//db connection pool
//디비연결 

import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCTemplate {
	
	public static Connection getConnection() {
		System.out.println("디비 템플릿 실행");
		
		Connection conn=null;
		Properties prop = new Properties();
		
		try {
			String fileName=JDBCTemplate.class.getResource("/driver/driver.properties").getPath();
			System.out.println(fileName);
			prop.load(new FileReader(fileName));
			Class.forName(prop.getProperty("driver")); //Properties에 있는 key값 호출
			conn=DriverManager.getConnection(prop.getProperty("url"), prop.getProperty("user"), prop.getProperty("pw"));
			conn.setAutoCommit(false); //autoCommit 안되게
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return conn;
		
		
		
	}

	//db connection 종료
	public static void close(Connection conn) {
		try {
			if(conn != null&& !conn.isClosed()) { //커넥션이 열려있으면
				conn.close();//닫기
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	public static void close(Statement stmt) {
		try {
			if(stmt != null && !stmt.isClosed()) {
				stmt.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void close(ResultSet rs) {
		try {
			if(rs!=null&&!rs.isClosed()) {
				rs.close();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void commit(Connection conn) {
		try {
			if(conn!=null && !conn.isClosed()) {
				conn.commit();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	public static void rollback(Connection conn) {
		try {
			if(conn!=null&&!conn.isClosed()) {
				conn.rollback();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
