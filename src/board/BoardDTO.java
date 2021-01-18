package board;

import java.io.Serializable;

public class BoardDTO implements Serializable {

	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private String boardDate;
	private int boardReadcount;

	public BoardDTO(int boardNo, String boardTitle, String boardContent, String boardDate, int boardReadcount) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardDate = boardDate;
		this.boardReadcount = boardReadcount;
	}

	public BoardDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}

	public int getBoardReadcount() {
		return boardReadcount;
	}

	public void setBoardReadcount(int boardReadcount) {
		this.boardReadcount = boardReadcount;
	}

	@Override
	public String toString() {
		return "BoardDTO [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", boardDate=" + boardDate + ", boardReadcount=" + boardReadcount + "]";
	}

}
