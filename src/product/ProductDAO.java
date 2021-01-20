package product;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;

import customer.CustomerDTO;
import product.ProductDTO;
import product.PageTo;

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
	
//	public ProductDAO() {
//		productDTO = new ProductDTO();
//		productList = new ArrayList<ProductDTO>();
//		try {
//			Class.forName("com.mysql.jdbc.Driver");
//		} catch (ClassNotFoundException e) {
//			e.printStackTrace();
//		}
//
//	}
//
//	public Connection getConnection() throws SQLException {
//		conn = DriverManager.getConnection("jdbc:mysql://bbr123.cafe24.com:3306/bbr123", "bbr123", "alstjr95!");
//		// Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bbr123", "bbr123", "alstjr95!");
//		return conn;
//	}

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
//			conn = getConnection();
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
//			conn = getConnection();
			sql = "SELECT P.PRO_NO, P.PRO_NAME, P.PRO_COST, P.PRO_PRICE, DATE_FORMAT(P.PRO_FIRST_DATE, '%m/%d') AS PRO_FIRST_DATE, DATE_FORMAT(P.PRO_LAST_DATE, '%m/%d') AS PRO_LAST_DATE, P.PRO_STOCK, C.CUS_NAME, P.PRO_STORING FROM PRODUCT P LEFT JOIN CUSTOMER C ON P.CUS_NO=C.CUS_NO ORDER BY PRO_NO ASC";
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
				productDTO.setProCost(Integer.parseInt(rs.getString("PRO_COST")));
				productDTO.setProPrice(Integer.parseInt(rs.getString("PRO_PRICE")));
				productDTO.setProFirstNal(rs.getString("PRO_FIRST_DATE"));
				productDTO.setProLastNal(rs.getString("PRO_LAST_DATE"));
				productDTO.setProStock(Integer.parseInt(rs.getString("PRO_STOCK")));
				productDTO.setCusName(rs.getString("CUS_NAME"));
				productDTO.setProStoring(Integer.parseInt(rs.getString("PRO_STORING")));
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
//		conn = getConnection();
		sql1 = "select CUS_NO from CUSTOMER where CUS_NAME=?";
		pstmt = conn.prepareStatement(sql1);
		pstmt.setString(1, productDTO.getCusName());
		rs = pstmt.executeQuery();
		while (rs.next()) {
			productDTO.setCusNo(rs.getInt("CUS_NO"));
		}
		sql = "insert into PRODUCT(PRO_NAME, CUS_NO, PRO_STORING, PRO_COST, PRO_PRICE, PRO_FIRST_DATE, PRO_LAST_DATE, PRO_STOCK) values(?,?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
//		pstmt.setInt(1, productDTO.getProNo());
		pstmt.setString(1, productDTO.getProName());
		pstmt.setInt(2, productDTO.getCusNo());
		pstmt.setInt(3, productDTO.getProStoring());
		pstmt.setInt(4, productDTO.getProCost());
		pstmt.setInt(5, productDTO.getProPrice());
		pstmt.setString(6, productDTO.getProFirstNal());
		pstmt.setString(7, productDTO.getProLastNal());
		pstmt.setInt(8, productDTO.getProStock());
		cnt = pstmt.executeUpdate();
		return cnt;
	}

	public int productDelete(int no) throws SQLException {
//		conn = getConnection();
		sql = "delete from PRODUCT where PRO_NO=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, no);
		cnt = pstmt.executeUpdate();
		return cnt;

	}

	public ArrayList<ProductDTO> productSearch(String searchData, String colum) throws SQLException {
//		conn = getConnection();
		if (colum.equals("제품명")) {
			sql = "select * from PRODUCT where PRO_NAME=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchData);
			rs = pstmt.executeQuery();
			productSearchList = new ArrayList<ProductDTO>();
			while (rs.next()) {
				productDTO = new ProductDTO();
				productDTO.setProNo(rs.getInt("PRO_NO"));
				productDTO.setProName(rs.getString("PRO_NAME"));
				productDTO.setProCost(Integer.parseInt(rs.getString("PRO_COST")));
				productDTO.setProPrice(Integer.parseInt(rs.getString("PRO_PRICE")));
				productDTO.setProFirstNal(rs.getString("PRO_FIRST_DATE"));
				productDTO.setProLastNal(rs.getString("PRO_LAST_DATE"));
				productDTO.setProStock(Integer.parseInt(rs.getString("PRO_STOCK")));
				productDTO.setCusNo(Integer.parseInt(rs.getString("CUS_NO")));
				productDTO.setProStoring(Integer.parseInt(rs.getString("PRO_STORING")));
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
				productDTO.setProCost(Integer.parseInt(rs.getString("PRO_COST")));
				productDTO.setProPrice(Integer.parseInt(rs.getString("PRO_PRICE")));
				productDTO.setProFirstNal(rs.getString("PRO_FIRST_DATE"));
				productDTO.setProLastNal(rs.getString("PRO_LAST_DATE"));
				productDTO.setProStock(Integer.parseInt(rs.getString("PRO_STOCK")));
				productDTO.setCusName(rs.getString("CUS_NAME"));
				productDTO.setProStoring(Integer.parseInt(rs.getString("PRO_STORING")));
				productSearchList.add(productDTO);
			}
		}
		return productSearchList;
	}

	public void proUpdate(ProductDTO productDTO, int proNo) throws SQLException {
		sql = "UPDATE PRODUCT SET PRO_NAME=?,PRO_STORING=?,PRO_COST=?,PRO_PRICE=?,PRO_FIRST_DATE=?,PRO_LAST_DATE=?,PRO_STOCK=? WHERE PRO_NO=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productDTO.getProName());
		pstmt.setInt(2, productDTO.getProStoring());
		pstmt.setInt(3, productDTO.getProCost());
		pstmt.setInt(4, productDTO.getProPrice());
		pstmt.setString(5, productDTO.getProFirstNal());
		pstmt.setString(6, productDTO.getProLastNal());
		pstmt.setInt(7, productDTO.getProStock());
		pstmt.setInt(8, proNo);
		pstmt.executeUpdate();
	}

	public ArrayList<CustomerDTO> customerSearch(String searchCusName) throws SQLException {
//		conn = getConnection();
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

	public int totalCount1() {// 페이징처리:전체레코드개수
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

	public PageTo page1(int curPage) {// 페이지구현
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
			pageTo1.setList1(customerList);// ArrayList 저장
			pageTo1.setTotalCount(totalCount1);// 전체레코드개수
			pageTo1.setCurPage(curPage);// 현재페이지
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pageTo1;
	}// 페이지구현

	public int stockUpdate(int todayValue, int num) throws SQLException {
//		conn = getConnection();
		sql = "UPDATE PRODUCT SET PRO_STOCK =(SELECT PRO_STOCK - ?) WHERE PRO_NO = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, todayValue);
		pstmt.setInt(2, num);
		cnt = pstmt.executeUpdate();
		productList = new ArrayList<ProductDTO>();
		while (rs.next()) {
			productDTO = new ProductDTO();
			productDTO.setProStock(rs.getInt("PRO_STOCT"));
			productList.add(productDTO);
		}
		return cnt;
	}

//	public void cusNameUpdate(ProductDTO productDTO,String cusName) throws SQLException {
//		sql = "UPDATE CUSTOMER SET CUS_NAME = ? WHERE CUS_NAME = ?";
//		pstmt = conn.prepareStatement(sql);
//		pstmt.setString(1, productDTO.getCusName());
//		pstmt.setString(2, cusName);
//		pstmt.executeUpdate();
//	}

// public int boardUpdateFinal(String searchTitle, ProductDTO productDTO) throws
//	 SQLException {
//		conn = getConnection();
//		sql = "update BoardA set title=?, content=?, author=?, nal=?, readcount=? where title=?";
//		pstmt = conn.prepareStatement(sql);
//		pstmt.setString(1, productDTO.getTitle());
//		pstmt.setString(2, productDTO.getContent());
//		pstmt.setString(3, productDTO.getAuthor());
//		pstmt.setString(4, productDTO.getNal());
//		pstmt.setInt(5, productDTO.getReadcount());
//		pstmt.setString(6, searchTitle);
//		cnt = pstmt.executeUpdate();
//
//		return cnt;
	// }

}
