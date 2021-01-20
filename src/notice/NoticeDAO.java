package notice;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import employee.Login;
import notice.NoticeDTO;
import notice.PageTo;

public class NoticeDAO {

	private Connection conn;
	private ResultSet rs;
	private NoticeDTO noticeDTO;
	private PreparedStatement pstmt;
	private String sql;
	private int cnt;
	private String empName;

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

	// 게시글 등록
	public int noticeWrite(NoticeDTO noticeDTO) throws SQLException {
		conn = getConnection();
		sql = "INSERT INTO NOTICE(NOTI_TITLE, NOTI_CONTENT, EMP_NO, FILE_NAME) VALUES(?, ?, ?, ?)";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, noticeDTO.getNotiTitle());
		pstmt.setString(2, noticeDTO.getNotiContent());
		pstmt.setInt(3, noticeDTO.getEmpNo());
		pstmt.setString(4, noticeDTO.getFileName());

		cnt = pstmt.executeUpdate();

		return cnt;
	}

	// 페이징
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

	// 전체게시판
	public PageTo page(int curPage) {
		PageTo pageTo = new PageTo();
		int totalCount = totalCount();
		ArrayList<NoticeDTO> list = new ArrayList<NoticeDTO>();
		try {
			conn = getConnection();			
			sql = "SELECT N.NOTI_NO, N.NOTI_TITLE, DATE_FORMAT(N.NOTI_DATE, '%m/%d') AS NOTI_DATE, E.EMP_NAME FROM NOTICE N LEFT JOIN EMPLOYEE E ON N.EMP_NO = E.EMP_NO ORDER BY NOTI_NO DESC";
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
				String notiAuthor = rs.getString("EMP_NAME");
				String notiDate = rs.getString("NOTI_DATE");

				NoticeDTO data = new NoticeDTO();

				data.setNotiNo(notiNo);
				data.setNotiTitle(notiTitle);
				data.setNotiDate(notiDate);
				data.setEmpName(notiAuthor);
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

	// 공지 내용 보기 화면
	public NoticeDTO noticeView(int notiNo) throws SQLException {
		conn = getConnection();		
		sql = "SELECT N.NOTI_NO, N.NOTI_TITLE, N.NOTI_CONTENT, DATE_FORMAT(N.NOTI_DATE, '%Y-%m-%d %H시 %i분') AS NOTI_DATE, E.EMP_NAME, N.FILE_NAME FROM NOTICE N LEFT JOIN EMPLOYEE E ON N.EMP_NO = E.EMP_NO WHERE N.NOTI_NO = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, notiNo);
		rs = pstmt.executeQuery();

		if (rs.next()) {
			noticeDTO.setNotiNo(rs.getInt("NOTI_NO"));
			noticeDTO.setNotiTitle(rs.getString("NOTI_TITLE"));
			noticeDTO.setNotiDate(rs.getString("NOTI_DATE"));
			noticeDTO.setEmpName(rs.getString("EMP_NAME"));
			noticeDTO.setFileName(rs.getString("FILE_NAME"));
			noticeDTO.setNotiContent(rs.getString("NOTI_CONTENT"));
		}

		return noticeDTO;
	}

	// 게시물 삭제
	public int noticeDelete(int no) throws SQLException {
		conn = getConnection();
		sql = "DELETE FROM NOTICE WHERE NOTI_NO = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, no);
		cnt = pstmt.executeUpdate();

		return cnt;
	}

	// 게시물 검색
	public ArrayList<NoticeDTO> noticeSearch(String searchTitle) throws SQLException {
		conn = getConnection();
		sql = "SELECT N.NOTI_NO, N.NOTI_TITLE, N.NOTI_CONTENT, DATE_FORMAT(N.NOTI_DATE, '%m/%d') AS NOTI_DATE, E.EMP_NAME FROM NOTICE N LEFT JOIN EMPLOYEE E ON N.EMP_NO = E.EMP_NO WHERE N.NOTI_TITLE LIKE ?"; 

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
			noticeDTO.setEmpName(rs.getString("EMP_NAME"));

			noticeSearchList.add(noticeDTO);
		}

		return noticeSearchList;
	}

	// 게시물 수정
	public int noticeUpdate(NoticeDTO noticeDTO) throws SQLException {
		conn = getConnection();
		sql = "UPDATE NOTICE SET NOTI_TITLE=?,NOTI_CONTENT=? WHERE NOTI_NO=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, noticeDTO.getNotiTitle());
		pstmt.setString(2, noticeDTO.getNotiContent());
		pstmt.setInt(3, noticeDTO.getNotiNo());
		cnt = pstmt.executeUpdate();

		return cnt;
	}

	// 수정할 게시물 찾기
	public NoticeDTO noticeUpdateSearch(int searchNo) throws SQLException {
		conn = getConnection();
		sql = "SELECT * FROM NOTICE WHERE NOTI_NO = ? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, searchNo);
		rs = pstmt.executeQuery();

		while (rs.next()) {
			noticeDTO.setNotiNo(rs.getInt("NOTI_NO"));
			noticeDTO.setNotiTitle(rs.getString("NOTI_TITLE"));
			noticeDTO.setNotiContent(rs.getString("NOTI_CONTENT"));
			noticeDTO.setFileName(rs.getString("FILE_NAME"));
		}
		return noticeDTO;
	}
}
