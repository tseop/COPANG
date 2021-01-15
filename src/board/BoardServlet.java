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

import board.BoardDTO;

@WebServlet("*.bo")
public class BoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private BoardDTO boardDTO;
	private BoardDAO boardDAO;
	private int cnt;
	private RequestDispatcher dis;
	private ArrayList<BoardDTO> boardList;
	private String viewBoardTitle;
	private int viewBoardNo;
	
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

		if (command.equals("/boardRegister.bo")) {
			boardDTO.setBoardTitle(request.getParameter("title"));
			boardDTO.setBoardContent(request.getParameter("content"));
			boardDTO.setBoardReadcount(Integer.parseInt(request.getParameter("readcount")));

			try {
				cnt = boardDAO.boardWrite(boardDTO);
				out.print(cnt);
				response.sendRedirect("boardList.bo");

			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if (command.equals("/boardList.bo")) {

			try {
				boardList = boardDAO.boardList();
				dis = request.getRequestDispatcher("index.jsp?page=board/board");
				request.setAttribute("boardList", boardList);
				dis.forward(request, response);

			} catch (SQLException e) {
				e.printStackTrace();
			}

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

		}

	}

}
