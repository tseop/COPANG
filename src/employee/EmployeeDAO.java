package employee;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class EmployeeDAO {
	private EmployeeDTO empDTO;
	private Connection conn;
	private String sql;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private int cnt;
	
	public EmployeeDAO() {
		empDTO = new EmployeeDTO();
		
		String dbURL = "jdbc:mysql://bbr123.cafe24.com:3306/bbr123?characterEncoding=utf8";
		String dbID = "bbr123";
		String dbPWD = "alstjr95!";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPWD);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public EmployeeDTO empLogin(int empNo, String empPw) throws SQLException {
		sql = "SELECT EMP_NO, EMP_PW FROM EMPLOYEE WHERE EMP_NO = ? AND EMP_PW = ?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, empNo);
		pstmt.setString(2, empPw);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			empDTO.setEmpNo(rs.getInt("EMP_NO"));
			empDTO.setEmpPw(rs.getString("EMP_PW"));
		}
		
		return empDTO;
	}
}
