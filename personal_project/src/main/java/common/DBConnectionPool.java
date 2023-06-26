package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBConnectionPool {
	public Connection conn;
	public PreparedStatement pstmt;
	public ResultSet rs;

	public DBConnectionPool() {

		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource) envContext.lookup("dbcp_myoracle");
			conn = ds.getConnection();

			System.out.println("DBCP 연결 성공");
		} catch (Exception e) {
			System.out.println("DBCP 연결 실패");
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
			System.out.println("DB자원 정리");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 연결 테스트를 위한 구문
	//	public static void main(String[] args) {
	//		DBConnection dbConn = new DBConnection();
	//		dbConn.close();
	//	}
}
