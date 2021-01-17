package board;

import java.io.Serializable;
import java.util.ArrayList;

public class PageTo implements Serializable{
	private ArrayList<BoardDTO> list;
	private int curPage;
	private int perPage;
	private int totalCount;

	public PageTo() {

		this.perPage = 10;
	}

	public ArrayList<BoardDTO> getList() {
		return list;
	}

	public void setList(ArrayList<BoardDTO> list) {
		this.list = list;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	@Override
	public String toString() {
		return "PageTo [list=" + list + ", curPage=" + curPage + ", perPage=" + perPage + ", totalCount=" + totalCount
				+ "]";
	}

}