package notice;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class FileDAO {
	private FileDTO fileDTO;
	private Connection conn;
	private int cnt;
	
	public FileDAO() {
		fileDTO = new FileDTO();
		try {
			Class.forName("com.mysql.jdbc.Driver");

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}	
	
	public Connection getConnection() throws SQLException {
		conn = DriverManager.getConnection("jdbc:mysql://bbr123.cafe24.com:3306/bbr123", "bbr123", "alstjr95!");

		return conn;
	}
	
	public int fileUpload(FileDTO fileDTO) throws SQLException {
		conn = getConnection();
		
		return cnt;
	}
}
