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
	private ArrayList<ProductDTO> productList;
	private ArrayList<ProductDTO> productSearchList;

	private Connection conn;
	private PreparedStatement pstmt;
	private String sql;
	private String sql1;
	private int cnt;
	private ResultSet rs;
	private RequestDispatcher dis;

	public ProductDAO() {
		productDTO = new ProductDTO();
		productList = new ArrayList<ProductDTO>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

	}

	public Connection getConnection() throws SQLException {
		conn = DriverManager.getConnection("jdbc:mysql://bbr123.cafe24.com:3306/bbr123", "bbr123", "alstjr95!");
		// Connection conn =
		// DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bbr123", "bbr123",
		// "alstjr95!");
		return conn;
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
	public int totalCount(){//페이징처리:전체레코드개수
		int count=0;
		try {
			conn = getConnection();
			sql = "SELECT COUNT(*) FROM PRODUCT";
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
	      productList = new ArrayList<ProductDTO>();
	      try {
	         conn = getConnection();
	         sql = "SELECT * FROM PRODUCT";
	         pstmt = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
	         rs = pstmt.executeQuery();
	         int perPage = pageTo.getPerPage();//5
	         int skip = (curPage-1) * perPage;
	         if(skip>0){
	            rs.absolute(skip);
	         }
	         for(int i=0;i<perPage && rs.next();i++){
	            int proNo = rs.getInt("PRO_NO");
	            productDTO = new ProductDTO();
				productDTO.setProNo(proNo);
				productDTO.setProName(rs.getString("PRO_NAME"));
				productDTO.setProCost(Integer.parseInt(rs.getString("PRO_COST")));
				productDTO.setProPrice(Integer.parseInt(rs.getString("PRO_PRICE")));
				productDTO.setProFirstNal(rs.getString("PRO_FIRST_DATE"));
				productDTO.setProLastNal(rs.getString("PRO_LAST_DATE"));
				productDTO.setProStock(Integer.parseInt(rs.getString("PRO_STOCK")));
				productDTO.setCusName(rs.getString("CUS_NO"));
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
	   }//페이지구현
	
	public int productRegister(ProductDTO productDTO) throws SQLException {
		conn = getConnection();
		sql1 = "select CUS_NO from CUSTOMER where CUS_NAME=?";
		pstmt = conn.prepareStatement(sql1);
		pstmt.setString(1, productDTO.getCusName());
		rs = pstmt.executeQuery();
		while (rs.next()) {
			productDTO.setCusNo(rs.getInt("CUS_NO"));
		}

		// 8개
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
		conn = getConnection();
		sql = "delete from PRODUCT where PRO_NO=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, no);
		cnt = pstmt.executeUpdate();
		return cnt;

	}

	public ArrayList<ProductDTO> productSearch(String searchProName) throws SQLException {
		conn = getConnection();
		sql = "select * from PRODUCT where PRO_NAME=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, searchProName);
		rs = pstmt.executeQuery();
		productSearchList = new ArrayList<ProductDTO>();
		while (rs.next()) {
//			productDTO = new ProductDTO();
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
		return productSearchList;

	}
	public void proUpdate(ProductDTO productDTO,int proNo) throws SQLException {
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
