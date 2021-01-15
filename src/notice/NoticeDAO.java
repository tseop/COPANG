package notice;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class NoticeDAO {
	private Connection conn;
	private ResultSet rs;
	
	public NoticeDAO() {
		try {
			String dbURL = "jdbc:mysql://bbr123.cafe24.com:3306/bbr123?characterEncoding=utf8";
			String dbID = "bbr123";
			String dbPWD = "alstjr95!";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPWD);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
		PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery(); //실제로 실행했을때 가져올 수 있는 결과
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ""; //데이터베이스 오류
	}
	public int getNext() {
		String SQL = "SELECT NOTI_NO FROM NOTICE ORDER BY NOTI_NO DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery(); //실제로 실행했을때 가져올 수 있는 결과
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
			return 1; // 첫번째 게시물인 경우 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	public int write (String notiTitle, int empNo, String notiContent) {
		String SQL = "INSERT INTO NOTICE VALUES (?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, notiTitle);
			pstmt.setInt(3, empNo);
			pstmt.setString(4, getDate());
			pstmt.setString(5, notiContent);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate(); //INSERT문에서는 executeQuery() 사용 안하고 Update()사용
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	}

