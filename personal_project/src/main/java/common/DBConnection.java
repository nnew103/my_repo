package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBConnection {
	//오라클 JDBC파일(ojdbc6.jar)을 WEB-INF의 lib폴더에 복사해서 붙여넣기
	private static final String DRIVER ="oracle.jdbc.driver.OracleDriver";
	private static final String URL="jdbc:oracle:thin:@localhost:1521:myoracle";
	private static final String USER="web_dev";
	private static final String PW="1234";
	
	public Connection conn;
	public PreparedStatement pstmt;
	public ResultSet rs;
	
	public DBConnection() {
		try {
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL, USER, PW);
			System.out.println("DB연결 성공");
		}catch(Exception e) {
			System.out.println("DB연결 중 에러 발생");
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
			System.out.println("DB자원 정리");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//연결 테스트를 위한 구문
//	public static void main(String[] args) {
//		DBConnection dbConn = new DBConnection();
//		dbConn.close();
//	}

}
