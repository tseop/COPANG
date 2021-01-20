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

@WebServlet("*.co")
public class MainBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private RequestDispatcher dis;

	private MainDAO mainDAO;
	private ArrayList<BoardDTO> list;
	
	public MainBoardServlet() {

	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		request.setAttribute("list", list);
		dis = request.getRequestDispatcher("index.jsp?page=test");
		dis.forward(request, response);
	}

}
