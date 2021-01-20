package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import board.BoardDTO;
import board.PageTo;

public class BoardDAO {

	private Connection conn;
	private BoardDTO boardDTO;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private String sql;
	private int cnt;
	
	private ArrayList<BoardDTO> boardSearchList;

	public BoardDAO() {
		boardDTO = new BoardDTO();
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

	public void boardClose() {
		try {
			conn.close();
			rs.close();
			pstmt.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	//게시글 등록
	public int boardWrite(BoardDTO boardDTO) throws SQLException { 

		conn = getConnection();

		sql = "INSERT INTO BOARD(BOARD_TITLE, BOARD_CONTENT, BOARD_READCOUNT) VALUES(?, ?, ?)";

		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, boardDTO.getBoardTitle());
		pstmt.setString(2, boardDTO.getBoardContent());
		pstmt.setInt(3, boardDTO.getBoardReadcount());
//		pstmt.setString(4, "now()");
		cnt = pstmt.executeUpdate();

		return cnt;
	}

	//페이징
	public int totalCount() { 
		int count = 0;

		try {
			conn = getConnection();
			sql = "SELECT COUNT(*) FROM BOARD";
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

	//전체게시판
	public PageTo page(int curPage) { 

		PageTo pageTo = new PageTo();
		int totalCount = totalCount();
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();

		try {
			conn = getConnection();
			sql = "SELECT BOARD_NO, BOARD_TITLE, DATE_FORMAT(BOARD_DATE, '%m/%d') AS BOARD_DATE, BOARD_READCOUNT FROM BOARD ORDER BY BOARD_NO DESC";
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs = pstmt.executeQuery();

			int perPage = pageTo.getPerPage();
			int skip = (curPage - 1) * perPage;

			if (skip > 0) {
				rs.absolute(skip);
			}

			for (int i = 0; i < perPage && rs.next(); i++) {
				int boardNo = rs.getInt("BOARD_NO");
				String boardTitle = rs.getString("BOARD_TITLE");
				String boardDate = rs.getString("BOARD_DATE");
				int boardReadcount = rs.getInt("BOARD_READCOUNT");

				BoardDTO board = new BoardDTO();

				board.setBoardNo(boardNo);
				board.setBoardTitle(boardTitle);
				board.setBoardDate(boardDate);
				board.setBoardReadcount(boardReadcount);
				list.add(board);
			}

			pageTo.setList(list);
			pageTo.setTotalCount(totalCount);
			pageTo.setCurPage(curPage);

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return pageTo;
	}

	//게시글 클릭 후 내용보는 창
	public BoardDTO boardView(int viewBoardNo) throws SQLException { 

		conn = getConnection();
		sql = "SELECT BOARD_NO, BOARD_TITLE, BOARD_CONTENT, DATE_FORMAT(BOARD_DATE, '%Y-%m-%d %H시 %i분') AS BOARD_DATE, BOARD_READCOUNT FROM BOARD WHERE BOARD_NO = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, viewBoardNo);
		rs = pstmt.executeQuery();

		if (rs.next()) {
			boardDTO.setBoardNo(rs.getInt("BOARD_NO"));
			boardDTO.setBoardTitle(rs.getString("BOARD_TITLE"));
			boardDTO.setBoardContent(rs.getString("BOARD_CONTENT"));
			boardDTO.setBoardDate(rs.getString("BOARD_DATE"));
			boardDTO.setBoardReadcount(rs.getInt("BOARD_READCOUNT"));
		}

		return boardDTO;
	}

	//게시물 검색
	public ArrayList<BoardDTO> boardSearch(String searchTitle) throws SQLException { 

		conn = getConnection();
		sql = "SELECT BOARD_NO, BOARD_TITLE, BOARD_CONTENT, DATE_FORMAT(BOARD_DATE, '%m/%d') AS BOARD_DATE, BOARD_READCOUNT FROM BOARD WHERE BOARD_TITLE LIKE ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, "%" + searchTitle + "%");
		rs = pstmt.executeQuery();
		boardSearchList = new ArrayList<BoardDTO>();

		while (rs.next()) {
			boardDTO = new BoardDTO();
			boardDTO.setBoardNo(rs.getInt("BOARD_NO"));
			boardDTO.setBoardTitle(rs.getString("BOARD_TITLE"));
			boardDTO.setBoardContent(rs.getString("BOARD_CONTENT"));
			boardDTO.setBoardDate(rs.getString("BOARD_DATE"));
			boardDTO.setBoardReadcount(Integer.parseInt(rs.getString("BOARD_READCOUNT")));
			boardSearchList.add(boardDTO);
		}

		return boardSearchList;
	}
	
	//게시물 클릭 시 조회수 증가
	public void boardReadCount(BoardDTO boardDTO) throws SQLException { 
		conn = getConnection();
		sql = "UPDATE BOARD SET BOARD_READCOUNT=? WHERE BOARD_NO=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, boardDTO.getBoardReadcount() + 1);
		pstmt.setInt(2, boardDTO.getBoardNo());
		cnt = pstmt.executeUpdate();
	}

	//게시물 삭제
	public int boardDelete(int no) throws SQLException { 
		conn = getConnection();
		sql = "DELETE FROM BOARD WHERE BOARD_NO=?";
		pstmt =conn.prepareStatement(sql);
		pstmt.setInt(1, no);
		cnt = pstmt.executeUpdate();
		
		
		
		return cnt;
	}
}
