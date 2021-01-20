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
	private int cnt;
	private String sql;
	private CustomerDTO customerDTO;
	private ArrayList<CustomerDTO> customerSearchList;
	private ArrayList<CustomerDTO> list;
	
	public CustomerDAO() {
		String dbURL = "jdbc:mysql://bbr123.cafe24.com:3306/bbr123?characterEncoding=utf8";
		String dbID = "bbr123";
		String dbPWD = "alstjr95!";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPWD);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}

	public int customerRegister(CustomerDTO customerDTO) throws SQLException {
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
	      list = new ArrayList<CustomerDTO>();
	      try {
	         sql = "SELECT * FROM CUSTOMER";
	         pstmt = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
	         rs = pstmt.executeQuery();
	         int perPage = pageTo.getPerPage();//5
	         int skip = (curPage-1) * perPage;
	         if(skip>0){
	            rs.absolute(skip);
	         }
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
	
	public ArrayList<CustomerDTO> customerSearch(String searchCusName) throws SQLException {
		sql = "SELECT * FROM CUSTOMER WHERE CUS_NAME LIKE ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,"%"+searchCusName+"%");
		rs = pstmt.executeQuery();
		customerSearchList = new ArrayList<CustomerDTO>();
		while (rs.next()) {
			customerDTO = new CustomerDTO();
			customerDTO.setCusNo(rs.getInt("CUS_NO"));
			customerDTO.setCusName(rs.getString("CUS_NAME"));
			customerDTO.setCusManager(rs.getString("CUS_MANAGER"));
			customerDTO.setCusTel(rs.getString("CUS_TEL"));
			customerDTO.setBusinessNo(rs.getString("BUSINESS_NO"));
			customerSearchList.add(customerDTO);
		}
		return customerSearchList;
	}
	
	public CustomerDTO customerDetail(int detailNo) throws SQLException {
		CustomerDTO customerDTO = null;
		sql = "SELECT * FROM CUSTOMER WHERE CUS_NO = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, detailNo);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			customerDTO = new CustomerDTO();
			customerDTO.setCusNo(rs.getInt("CUS_NO"));
			customerDTO.setCusName(rs.getString("CUS_NAME"));
			customerDTO.setCusManager(rs.getString("CUS_MANAGER"));
			customerDTO.setCusTel(rs.getString("CUS_TEL"));
			customerDTO.setBusinessNo(rs.getString("BUSINESS_NO"));
		}
		return customerDTO;
	}//상세보기
	
	public int customerUpdate(int detailNo, CustomerDTO customerDTO) throws SQLException {
		sql = "UPDATE CUSTOMER SET CUS_NAME=?, CUS_MANAGER=?, CUS_TEL=?, BUSINESS_NO=? WHERE CUS_NO = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, customerDTO.getCusName());
		pstmt.setString(2, customerDTO.getCusManager());
		pstmt.setString(3, customerDTO.getCusTel());
		pstmt.setString(4, customerDTO.getBusinessNo());
		pstmt.setInt(5, detailNo);
		cnt = pstmt.executeUpdate();
		return cnt;
	}//수정하기
	
	public int customerDelete(int deleteNo) throws SQLException {
		sql = "DELETE FROM CUSTOMER WHERE CUS_NO = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, deleteNo);
		cnt = pstmt.executeUpdate();
		return cnt;
	}
}
