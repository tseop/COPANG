package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MainDAO {
	
	private Connection conn ;
	
	public MainDAO() throws ClassNotFoundException, SQLException {
		String dbURL = "jdbc:mysql://bbr123.cafe24.com:3306/bbr123?characterEncoding=utf8";
		String dbID = "bbr123";
		String dbPWD = "alstjr95!";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(dbURL, dbID, dbPWD);
	}
	
	public ResultSet mainBoardList() throws SQLException {
		String sql = "SELECT * FROM BOARD order by BOARD_DATE DESC limit 0, 5";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		return rs;
		}

	
	
}
