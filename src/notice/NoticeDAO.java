package notice;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import board.BoardDTO;
import notice.NoticeDTO;
import notice.PageTo;

public class NoticeDAO {

	private Connection conn;
	private ResultSet rs;
	private NoticeDTO noticeDTO;
	private PreparedStatement pstmt;
	private String sql;
	private int cnt;
	private ArrayList<NoticeDTO> noticeList;
	private ArrayList<NoticeDTO> noticeSearchList;

	public NoticeDAO() {
		noticeDTO = new NoticeDTO();
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

	public void noticeClose() {
		try {
			conn.close();
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public String getDate() { // 현재 서버시간을 가져옴
		sql = "SELECT NOW()";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(); // 실제로 실행했을때 가져올 수 있는 결과
			if (rs.next()) {
				return rs.getString(1); // 현재의 날짜를 그대로 반환
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ""; // 데이터베이스 오류
	}

	public int getNext() { // 다음 게시물 번호 생성
		sql = "SELECT NOTI_NO FROM NOTICE ORDER BY NOTI_NO DESC";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(); // 실제로 실행했을때 가져올 수 있는 결과
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // 첫번째 게시물인 경우
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

	public int noticeWrite(NoticeDTO noticeDTO) throws SQLException {
		conn = getConnection();
		sql = "INSERT INTO NOTICE(NOTI_TITLE, NOTI_CONTENT) VALUES(?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, noticeDTO.getNotiTitle());
		pstmt.setString(2, noticeDTO.getNotiContent());
		cnt = pstmt.executeUpdate();
		return cnt;
	}

	public int totalCount() {
		int count = 0;
		try {
			conn = getConnection();
			sql = "SELECT COUNT(*) FROM NOTICE";
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
		ArrayList<NoticeDTO> list = new ArrayList<NoticeDTO>();
		try {
			conn = getConnection();
			sql = "SELECT NOTI_NO, NOTI_TITLE, NOTI_DATE, EMP_NO FROM NOTICE";
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs = pstmt.executeQuery();
			int perPage = pageTo.getPerPage();
			int skip = (curPage - 1) * perPage;

			if (skip > 0) {
				rs.absolute(skip);
			}

			for (int i = 0; i < perPage && rs.next(); i++) {
				int notiNo = rs.getInt("NOTI_NO");
				String notiTitle = rs.getString("NOTI_TITLE");
				int notiAuthor = rs.getInt("EMP_NO");
				String notiDate = rs.getString("NOTI_DATE");

				NoticeDTO data = new NoticeDTO();
				data.setNotiNo(notiNo);
				data.setNotiTitle(notiTitle);
				data.setNotiDate(notiDate);
				data.setEmpNo(notiAuthor);
				list.add(data);
			}
			pageTo.setList(list);
			pageTo.setTotalCount(totalCount);
			pageTo.setCurPage(curPage);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pageTo;
	}

	/*public ArrayList<NoticeDTO> noticeList() throws SQLException {
		sql = "SELECT NOTI_NO, NOTI_TITLE, NOTI_DATE, EMP_NO FROM NOTICE ORDER BY NO ASC";
		noticeList = new ArrayList<NoticeDTO>();
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery(); // 실제로 실행했을때 가져올 수 있는 결과
		while (rs.next()) {
			noticeDTO = new NoticeDTO();
			noticeDTO.setNotiNo(rs.getInt("NOTI_NO")); // ()안에 위에 sql문에 써있는 컬럼명을 써야하는지 아니면 DTO에 있는 get변수명을 넣어야하는지,,,?
			noticeDTO.setNotiTitle(rs.getString("NOTI_TITLE"));
			noticeDTO.setNotiDate(rs.getString("NOTI_DATE"));
			noticeDTO.setEmpNo(rs.getInt("EMP_NO"));
			noticeList.add(noticeDTO);
		}
		return noticeList;
	}*/

	public NoticeDTO noticeView(int notiNo) throws SQLException  { 
		conn = getConnection();
		sql = "SELECT * FROM NOTICE WHERE NOTI_NO = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, notiNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				noticeDTO.setNotiNo(rs.getInt("NOTI_NO"));
				noticeDTO.setNotiTitle(rs.getString("NOTI_TITLE"));
				noticeDTO.setNotiDate(rs.getString("NOTI_DATE"));
				noticeDTO.setEmpNo(rs.getInt("EMP_NO")); 
				noticeDTO.setNotiContent(rs.getString("NOTI_CONTENT"));
			}
		
			return noticeDTO;
	}

	public int noticeDelete(int notiNo) throws SQLException {
		conn = getConnection();
		sql = "delete from NOTICE where NOTI_NO = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, notiNo);
		cnt = pstmt.executeUpdate();
		return cnt;
	}

	public ArrayList<NoticeDTO> noticeSearch(String searchTitle) throws SQLException {
		conn = getConnection();
		sql = "SELECT NOTI_NO, NOTI_TITLE, NOTI_CONTENT, NOTI_DATE, EMP_NO FROM NOTICE WHERE NOTI_TITLE=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, "%" + searchTitle + "%");
		rs = pstmt.executeQuery();
		noticeSearchList = new ArrayList<NoticeDTO>();
		
		while (rs.next()) {
			noticeDTO = new NoticeDTO();
			noticeDTO.setNotiNo(rs.getInt("NOTI_NO"));
			noticeDTO.setNotiTitle(rs.getString("NOTI_TITLE"));
			noticeDTO.setNotiContent(rs.getString("NOTI_CONTENT"));
			noticeDTO.setNotiDate(rs.getString("NOTI_DATE"));
			noticeSearchList.add(noticeDTO);
		}
		return noticeSearchList;
	}

	public int noticeUpdateFinal(NoticeDTO noticeDTO, String titleSearch) throws SQLException {
		conn = getConnection();
		sql = "UPDATE NOTICE SET NOTI_TITLE=?, NOTI_CONTENT=?, NOTI_DATE=? WHERE TITLE=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, noticeDTO.getNotiTitle());
		pstmt.setString(2, noticeDTO.getNotiContent());
		pstmt.setString(3, noticeDTO.getNotiDate());
		pstmt.setString(4, titleSearch);
		cnt = pstmt.executeUpdate();
		return cnt;
	}
}
