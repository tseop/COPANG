package board;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.bo")
public class BoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private BoardDTO boardDTO;
	private BoardDAO boardDAO;
	private int cnt;
	private RequestDispatcher dis;
	private ArrayList<BoardDTO> boardSearchList;
	private ArrayList<BoardDTO> boardList;
	private String viewBoardTitle;
	private int viewBoardNo;
	private String searchTitle;

	public BoardServlet() {
		boardDTO = new BoardDTO();
		boardDAO = new BoardDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());

		// 게시글 등록
		if (command.equals("/boardRegister.bo")) {
			boardDTO.setBoardTitle(request.getParameter("title"));
			boardDTO.setBoardContent(request.getParameter("content"));
			boardDTO.setBoardReadcount(Integer.parseInt(request.getParameter("readcount")));
			try {
				cnt = boardDAO.boardWrite(boardDTO);
				response.sendRedirect("boardList.bo");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		// 전체게시판
		else if (command.equals("/boardList.bo")) {
			int curPage = 1;
			if (request.getParameter("curPage") != null) {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}
			PageTo boardList = boardDAO.page(curPage);
			dis = request.getRequestDispatcher("index.jsp?page=board/board");
			request.setAttribute("page", boardList);
			request.setAttribute("list", boardList.getList());
			dis.forward(request, response);

		// 게시글 클릭 후 내용볼 수 있는 게시글
		} else if (command.equals("/boardView.bo")) {
			viewBoardTitle = request.getParameter("no");
			int no = Integer.parseInt(viewBoardTitle);
			try {
				boardDTO = boardDAO.boardView(no);
				dis = request.getRequestDispatcher("index.jsp?page=board/boardView");
				request.setAttribute("boardDTO", boardDTO);
				dis.forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}

		// 검색 게시글 리스트
		} else if (command.equals("/boardSearch.bo")) {
			searchTitle = request.getParameter("searchTitle");
			try {
				boardSearchList = boardDAO.boardSearch(searchTitle);
				dis = request.getRequestDispatcher("index.jsp?page=board/boardSearch");
				request.setAttribute("boardSearchList", boardSearchList);
				dis.forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}

		// 게시글 삭제
		} else if (command.equals("/boardDelete.bo")) {
			String getNo = request.getParameter("no");
			int no = Integer.parseInt(getNo);
			try {
				cnt = boardDAO.boardDelete(no);
				response.sendRedirect("boardList.bo");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
