package product;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;

public class ProductDAO {
	private ProductDTO productDTO;
	private ArrayList<ProductDTO> productList;

	private Connection conn;
	private PreparedStatement pstmt;
	private String sql;
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

	public int productRegister(ProductDTO productDTO) throws SQLException {
		conn = getConnection();
		sql = "select CUS_NO from CUSTOMER where CUS_NAME=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productDTO.getCusName());
		rs = pstmt.executeQuery();
		while (rs.next()) {
			productDTO.setCusNo(rs.getInt("CUS_NO"));
		}

		// 8개
		sql = "insert into PRODUCT(PRO_NAME, CUS_NO, PRO_STORING, PRO_COST, PRO_PRICE, PRO_FIRST_DATE, PRO_LAST_DATE, PRO_STOCK) values(?,?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
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

	public ArrayList<ProductDTO> productList() throws SQLException {
		conn = getConnection();
		sql = "select * from PRODUCT order by PRO_NO asc";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		productList = new ArrayList<ProductDTO>();
//    	while(rs.next()) {
//    		productDTO=new ProductDTO();
//    	productDTO.setProNo(rs.getInt("no"));
//    	productDTO.setProName(rs.getString("proName"));
//    	productDTO.setProCost(Integer.parseInt(rs.getString("proCost")));
//    	productDTO.setProPrice(Integer.parseInt(rs.getString("proPrice")));
//    	productDTO.setProFirstNal(rs.getString("proFirstNal"));
//    	productDTO.setProLastNal(rs.getString("proLastNal"));
//    	productDTO.setProStock(Integer.parseInt(rs.getString("proStock")));
//    	productDTO.setCusName(rs.getString("cusName"));
//    	productDTO.setProStoring(Integer.parseInt(rs.getString("proStoring")));
//    	productList.add(productDTO);
//    	}
		return productList; // 그냥 배열에 담아버려서 리턴으로 돌려주겠다.
	}

	public int productDelete(int proName) throws SQLException {
		conn = getConnection();
		sql = "delete from PRODUCT where PRO_NO=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, proName);
		cnt = pstmt.executeUpdate();
		return cnt;

	}

	public ProductDTO productSearch(String proNo) throws SQLException {
		conn = getConnection();
		sql = "select * from PRODUCT where PRO_NAME=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, proNo);
		rs = pstmt.executeQuery();

		while (rs.next()) {
//			productDTO = new ProductDTO();
			productDTO.setProNo(rs.getInt("no"));
			productDTO.setProName(rs.getString("proName"));
			productDTO.setProCost(Integer.parseInt(rs.getString("proCost")));
			productDTO.setProPrice(Integer.parseInt(rs.getString("proPrice")));
			productDTO.setProFirstNal(rs.getString("proFirstNal"));
			productDTO.setProLastNal(rs.getString("proLastNal"));
			productDTO.setProStock(Integer.parseInt(rs.getString("proStock")));
			productDTO.setCusName(rs.getString("cusName"));
			productDTO.setProStoring(Integer.parseInt(rs.getString("proStoring")));
			productList.add(productDTO);
		}
		return productDTO;

	}

	// public void boardReadcount(ProductDTO productDTO) throws SQLException {
//		conn = getConnection();
//		sql = "update BoardA set readcount=? where no=?";
//		pstmt = conn.prepareStatement(sql);
//		pstmt.setInt(1, productDTO.getReadcount() + 1);
//		pstmt.setInt(2, productDTO.getNo());
//		cnt = pstmt.executeUpdate();
	// }

	// public int boardUpdateFinal(String searchTitle, ProductDTO productDTO) throws
	// SQLException {
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
