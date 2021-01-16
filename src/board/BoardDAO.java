package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import board.BoardDTO;

public class BoardDAO {

	private Connection conn;
	private BoardDTO boardDTO;
	private BoardDAO boardDAO;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private String sql;
	private int cnt;
	private ArrayList<BoardDTO> boardList;
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

	public int boardWrite(BoardDTO boardDTO) throws SQLException {

		conn = getConnection();

		sql = "INSERT INTO BOARD(BOARD_TITLE, BOARD_CONTENT, BOARD_READCOUNT) VALUES(?, ?, ?)";

		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, boardDTO.getBoardTitle());
		pstmt.setString(2, boardDTO.getBoardContent());
		pstmt.setInt(3, boardDTO.getBoardReadcount());
//		pstmt.setString(4, boardDTO.getFILE_NO());
		cnt = pstmt.executeUpdate();

		return cnt;
	}

	public ArrayList<BoardDTO> boardList() throws SQLException {

		conn = getConnection();
		sql = "SELECT * FROM BOARD";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		boardList = new ArrayList<BoardDTO>();

		while (rs.next()) {
			boardDTO = new BoardDTO();
			boardDTO.setBoardNo(rs.getInt("BOARD_NO"));
			boardDTO.setBoardTitle(rs.getString("BOARD_TITLE"));
			boardDTO.setBoardContent(rs.getString("BOARD_CONTENT"));
			boardDTO.setBoardDate(rs.getString("BOARD_DATE"));
			boardDTO.setBoardReadcount(Integer.parseInt(rs.getString("BOARD_READCOUNT")));
			boardList.add(boardDTO);
		}
		return boardList;
	}

	public BoardDTO boardView(int viewBoardNo) throws SQLException {

		conn = getConnection();
		sql = "SELECT * FROM BOARD WHERE BOARD_NO= ?";
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

	public ArrayList<BoardDTO> boardSearch(String searchTitle) throws SQLException {

		conn = getConnection();
		sql = "select * from BOARD where BOARD_TITLE LIKE ?";
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
}
