package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBConnectionPool {
	// 오라클 JDBC파일(ojdbc6.jar)을 WEB-INF의 lib폴더에 복사해서 붙여넣기
	public Connection conn;
	public PreparedStatement pstmt;
	public ResultSet rs;

	public DBConnectionPool() {

		try {
			// 커넥션 풀(DataSource:물리적인 데이터소스와의 연결을 생성해주는 자바 표준 인터페이스) 얻기
			Context initContext = new InitialContext();// 톰캣 자체의 Context 정보를 얻어오는 부분
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			// java:/comp/env: server.xml의 Context까지 접근하는 정해진 이름
			DataSource ds = (DataSource) envContext.lookup("dbcp_myoracle");
			// server.xml에서 정의한 Resource태그의 이름으로 DataSource객체를 얻어오는 부분

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
