package product;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;

import customer.CustomerDTO;

public class ProductDAO {
	private ProductDTO productDTO;
	private CustomerDTO customerDTO;
	private ArrayList<ProductDTO> productList;
	private ArrayList<ProductDTO> productSearchList;
	private ArrayList<CustomerDTO> customerList;
	private ArrayList<CustomerDTO> customerSearchList;
	private Connection conn;
	private PreparedStatement pstmt;
	private String sql;
	private String sql1;
	private int cnt;
	private ResultSet rs;
	private RequestDispatcher dis;

	public ProductDAO() {
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

	public void productClose() {
		try {
			conn.close();
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public int totalCount() {
		int count = 0;
		try {
			sql = "SELECT COUNT(*) FROM PRODUCT";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	public PageTo page(int curPage) {
		PageTo pageTo = new PageTo();
		int totalCount = totalCount();
		productList = new ArrayList<ProductDTO>();
		try {
			sql = "SELECT P.PRO_NO, P.PRO_NAME, FORMAT(P.PRO_COST, 0) AS PRO_COST, FORMAT(P.PRO_PRICE, 0) AS PRO_PRICE, DATE_FORMAT(P.PRO_FIRST_DATE, '%m/%d') AS PRO_FIRST_DATE, DATE_FORMAT(P.PRO_LAST_DATE, '%m/%d') AS PRO_LAST_DATE, FORMAT(P.PRO_STOCK, 0) AS PRO_STOCK ,C.CUS_NAME, FORMAT(P.PRO_STORING ,0) AS PRO_STORING FROM PRODUCT P LEFT JOIN CUSTOMER C ON P.CUS_NO=C.CUS_NO ORDER BY PRO_NO ASC";
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs = pstmt.executeQuery();
			int perPage = pageTo.getPerPage();
			int skip = (curPage - 1) * perPage;
			if (skip > 0) {
				rs.absolute(skip);
			}
			for (int i = 0; i < perPage && rs.next(); i++) {
				int proNo = rs.getInt("PRO_NO");
				productDTO = new ProductDTO();
				productDTO.setProNo(proNo);
				productDTO.setProName(rs.getString("PRO_NAME"));
				productDTO.setProCost(rs.getString("PRO_COST"));
				productDTO.setProPrice(rs.getString("PRO_PRICE"));
				productDTO.setProFirstNal(rs.getString("PRO_FIRST_DATE"));
				productDTO.setProLastNal(rs.getString("PRO_LAST_DATE"));
				productDTO.setProStock(rs.getString("PRO_STOCK"));
				productDTO.setCusName(rs.getString("CUS_NAME"));
				productDTO.setProStoring(rs.getString("PRO_STORING"));
				productList.add(productDTO);
			}
			pageTo.setList(productList);
			pageTo.setTotalCount(totalCount);
			pageTo.setCurPage(curPage);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pageTo;
	}

	public int productRegister(ProductDTO productDTO) throws SQLException {
		sql1 = "select CUS_NO from CUSTOMER where CUS_NAME=?";
		pstmt = conn.prepareStatement(sql1);
		pstmt.setString(1, productDTO.getCusName());
		rs = pstmt.executeQuery();
		while (rs.next()) {
			productDTO.setCusNo(rs.getInt("CUS_NO"));
		}
		sql = "insert into PRODUCT(PRO_NAME, CUS_NO, PRO_STORING, PRO_COST, PRO_PRICE, PRO_FIRST_DATE, PRO_LAST_DATE, PRO_STOCK) values(?,?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, productDTO.getProNo());
		pstmt.setString(1, productDTO.getProName());
		pstmt.setInt(2, productDTO.getCusNo());
		pstmt.setString(3, productDTO.getProStoring());
		pstmt.setString(4, productDTO.getProCost());
		pstmt.setString(5, productDTO.getProPrice());
		pstmt.setString(6, productDTO.getProFirstNal());
		pstmt.setString(7, productDTO.getProLastNal());
		pstmt.setString(8, productDTO.getProStock());
		cnt = pstmt.executeUpdate();
		return cnt;
	}

	public int productDelete(int no) throws SQLException {
		sql = "delete from PRODUCT where PRO_NO=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, no);
		cnt = pstmt.executeUpdate();
		return cnt;

	}

	public ArrayList<ProductDTO> productSearch(String searchData, String colum) throws SQLException {
		if (colum.equals("제품명")) {
			sql = "SELECT P.PRO_NO, P.PRO_NAME, P.PRO_COST, P.PRO_PRICE, DATE_FORMAT(P.PRO_FIRST_DATE, '%m/%d') AS PRO_FIRST_DATE, DATE_FORMAT(P.PRO_LAST_DATE, '%m/%d') AS PRO_LAST_DATE, P.PRO_STOCK, C.CUS_NAME, P.PRO_STORING FROM PRODUCT P LEFT JOIN CUSTOMER C ON P.CUS_NO=C.CUS_NO WHERE P.PRO_NAME=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchData);
			rs = pstmt.executeQuery();
			productSearchList = new ArrayList<ProductDTO>();
			while (rs.next()) {
				productDTO = new ProductDTO();
				productDTO.setProNo(rs.getInt("PRO_NO"));
				productDTO.setProName(rs.getString("PRO_NAME"));
				productDTO.setProCost(rs.getString("PRO_COST"));
				productDTO.setProPrice(rs.getString("PRO_PRICE"));
				productDTO.setProFirstNal(rs.getString("PRO_FIRST_DATE"));
				productDTO.setProLastNal(rs.getString("PRO_LAST_DATE"));
				productDTO.setProStock(rs.getString("PRO_STOCK"));
				productDTO.setCusName(rs.getString("CUS_NAME"));
				productDTO.setProStoring(rs.getString("PRO_STORING"));
				productSearchList.add(productDTO);
			}
		} else if (colum.equals("거래처명")) {
			sql = "SELECT P.PRO_NO, P.PRO_NAME, P.PRO_COST, P.PRO_PRICE, DATE_FORMAT(P.PRO_FIRST_DATE, '%m/%d') AS PRO_FIRST_DATE, DATE_FORMAT(P.PRO_LAST_DATE, '%m/%d') AS PRO_LAST_DATE, P.PRO_STOCK, C.CUS_NAME, P.PRO_STORING FROM PRODUCT P LEFT JOIN CUSTOMER C ON P.CUS_NO=C.CUS_NO WHERE C.CUS_NAME=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchData);
			rs = pstmt.executeQuery();
			productSearchList = new ArrayList<ProductDTO>();
			while (rs.next()) {
				productDTO = new ProductDTO();
				productDTO.setProNo(rs.getInt("PRO_NO"));
				productDTO.setProName(rs.getString("PRO_NAME"));
				productDTO.setProCost(rs.getString("PRO_COST"));
				productDTO.setProPrice(rs.getString("PRO_PRICE"));
				productDTO.setProFirstNal(rs.getString("PRO_FIRST_DATE"));
				productDTO.setProLastNal(rs.getString("PRO_LAST_DATE"));
				productDTO.setProStock(rs.getString("PRO_STOCK"));
				productDTO.setCusName(rs.getString("CUS_NAME"));
				productDTO.setProStoring(rs.getString("PRO_STORING"));
				productSearchList.add(productDTO);
			}
		}
		return productSearchList;
	}
	
	public ProductDTO productUpdateConfirm(int proNo)throws SQLException{
		sql = "SELECT P.PRO_NO, P.PRO_NAME, P.PRO_COST, P.PRO_PRICE, P.PRO_FIRST_DATE, P.PRO_LAST_DATE, P.PRO_STOCK ,C.CUS_NAME, P.PRO_STORING FROM PRODUCT P LEFT JOIN CUSTOMER C ON P.CUS_NO=C.CUS_NO WHERE P.PRO_NO=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, proNo);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			productDTO.setProNo(rs.getInt("PRO_NO"));
			productDTO.setProName(rs.getString("PRO_NAME"));
			productDTO.setProCost(rs.getString("PRO_COST"));
			productDTO.setProPrice(rs.getString("PRO_PRICE"));
			productDTO.setProFirstNal(rs.getString("PRO_FIRST_DATE"));
			productDTO.setProLastNal(rs.getString("PRO_LAST_DATE"));
			productDTO.setProStock(rs.getString("PRO_STOCK"));
			productDTO.setCusName(rs.getString("CUS_NAME"));
			productDTO.setProStoring(rs.getString("PRO_STORING"));
		}
		
		return productDTO;
	}

	public int proUpdate(ProductDTO productDTO, int proNo) throws SQLException {
		sql = "UPDATE PRODUCT SET PRO_NAME=?,PRO_STORING=?,PRO_COST=?,PRO_PRICE=?,PRO_LAST_DATE=?,PRO_STOCK=? WHERE PRO_NO=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productDTO.getProName());
		pstmt.setString(2, productDTO.getProStoring());
		pstmt.setString(3, productDTO.getProCost());
		pstmt.setString(4, productDTO.getProPrice());
		pstmt.setString(5, productDTO.getProLastNal());
		pstmt.setString(6, productDTO.getProStock());
		pstmt.setInt(7, proNo);
		cnt = pstmt.executeUpdate();
		
		return cnt;
	}

	public ArrayList<CustomerDTO> customerSearch(String searchCusName) throws SQLException {
		sql = "SELECT * FROM CUSTOMER WHERE CUS_NAME LIKE ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, "%" + searchCusName + "%");
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

	public int stockUpdate(int todayValue, int num) throws SQLException {
		sql = "UPDATE PRODUCT SET PRO_STOCK =(SELECT PRO_STOCK - ?) WHERE PRO_NO = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, todayValue);
		pstmt.setInt(2, num);
		cnt = pstmt.executeUpdate();
		productList = new ArrayList<ProductDTO>();
		while (rs.next()) {
			productDTO = new ProductDTO();
			productDTO.setProStock(rs.getString("PRO_STOCK"));
			productList.add(productDTO);
		}
		return cnt;
	}
	
	public int totalCount1() {
		int count = 0;
		try {
			sql = "SELECT COUNT(*) FROM CUSTOMER";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	public PageTo page1(int curPage) {
		PageTo pageTo1 = new PageTo();
		int totalCount1 = totalCount1();
		customerList = new ArrayList<CustomerDTO>();
		try {
			sql = "SELECT * FROM CUSTOMER";
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs = pstmt.executeQuery();
			int perPage1 = pageTo1.getPerPage();// 5
			int skip1 = (curPage - 1) * perPage1;
			if (skip1 > 0) {
				rs.absolute(skip1);
			}
			for (int i = 0; i < perPage1 && rs.next(); i++) {
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
				customerList.add(data);
			}
			pageTo1.setList1(customerList);
			pageTo1.setTotalCount(totalCount1);
			pageTo1.setCurPage(curPage);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pageTo1;
	}
}
