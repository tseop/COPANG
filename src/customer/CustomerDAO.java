package customer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CustomerDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private String sql;
	private int cnt;

	public CustomerDAO() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public Connection getConnection() throws SQLException {
		conn = DriverManager.getConnection("jdbc:mysql://bbr123.cafe24.com:3306/bbr123", "bbr123", "alstjr95!");
		return conn;
	}
	
	public int customerRegister(CustomerDTO customerDTO) throws SQLException {
		conn = getConnection();
		sql = "INSERT INTO CUSTOMER (CUS_NAME, CUS_MANAGER, CUS_TEL, BUSINESS_NO) VALUES (?, ?, ?, ?);";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, customerDTO.getCusName());
		pstmt.setString(2, customerDTO.getCusManager());
		pstmt.setString(3, customerDTO.getCusTel());
		pstmt.setString(4, customerDTO.getBusinessNo());
		cnt = pstmt.executeUpdate();
		return cnt;
	}
	
	public int totalCount(){//페이징처리:전체레코드개수
		int count=0;
		try {
			conn = getConnection();
			sql = "SELECT COUNT(*) FROM CUSTOMER";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public PageTo page(int curPage) {//페이지구현
	      PageTo pageTo = new PageTo();
	      int totalCount = totalCount();
	      ArrayList<CustomerDTO> list = new ArrayList<CustomerDTO>();
	      try {
	         conn=getConnection();
	         sql = "SELECT * FROM CUSTOMER";
	         pstmt = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
	         rs = pstmt.executeQuery();
	         int perPage = pageTo.getPerPage();//5
	         int skip = (curPage-1) * perPage;
	         if(skip>0){
	            rs.absolute(skip);
	         }
	         //ResultSet의 absolute메소드를 이용하여 해당 페이지의 Cursor 의 위치로 이동...
	         for(int i=0;i<perPage && rs.next();i++){
	            int cusNo = rs.getInt("CUS_NO");
	            String cusName = rs.getString("CUS_NAME");
	            String cusManager = rs.getString("CUS_MANAGER");
	            String cusTel = rs.getString("CUS_TEL");
	            String businessNo = rs.getString("BUSINESS_NO");
	            CustomerDTO data = new CustomerDTO();
	            data.setCusNo(cusNo);
	            data.setCusName(cusName);
	            data.setCusManager(cusManager);
	            data.setCusTel(cusTel);
	            data.setBusinessNo(businessNo);
	            list.add(data);         
	         }
	         pageTo.setList(list);//ArrayList 저장
	         pageTo.setTotalCount(totalCount);//전체레코드개수
	         pageTo.setCurPage(curPage);//현재페이지
	   } catch (SQLException e) {
	      e.printStackTrace();
	   }
	      return pageTo;        
	   }//페이지구현
}
