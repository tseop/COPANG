package notice;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MainNotice")
public class MainNotice extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NoticeDTO noticeDTO;
	private NoticeDAO noticeDAO;
	private ArrayList<NoticeDTO> list;
	private RequestDispatcher dis;
 
    public MainNotice() {
    	noticeDTO = new NoticeDTO();
    	noticeDAO = new NoticeDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		list = noticeDAO.mainNotice();
		request.setAttribute("list", list);
		dis = request.getRequestDispatcher("index.jsp?page=test");
		dis.forward(request, response);
	}

}
