package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MainDAO {
	private Connection conn;

	public MainDAO() throws ClassNotFoundException, SQLException {
		String dbURL = "jdbc:mysql://bbr123.cafe24.com:3306/bbr123?characterEncoding=utf8";
		String dbID = "bbr123";
		String dbPWD = "alstjr95!";

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(dbURL, dbID, dbPWD);
	}

	public ResultSet mainNoticeList() throws SQLException {
		String sql = "SELECT N.NOTI_NO, N.NOTI_TITLE, E.EMP_NAME, DATE_FORMAT(N.NOTI_DATE, '%m/%d') AS NOTI_DATE FROM NOTICE N LEFT JOIN EMPLOYEE E ON N.EMP_NO = E.EMP_NO ORDER BY NOTI_NO DESC LIMIT 0, 5";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();

		return rs;
	}
	
	public ResultSet mainProductList() throws SQLException {
		String sql = "SELECT P.PRO_NO, P.PRO_NAME, P.PRO_STOCK, P.PRO_STORING, C.CUS_NAME, DATE_FORMAT(P.PRO_LAST_DATE, '%m/%d') AS PRO_LAST_DATE FROM PRODUCT P LEFT JOIN CUSTOMER C ON P.CUS_NO = C.CUS_NO ORDER BY P.PRO_LAST_DATE DESC LIMIT 5";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		return rs;		
	}

}
