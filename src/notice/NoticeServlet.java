package notice;

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



@WebServlet("*.no")
public class NoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NoticeDTO noticeDTO;
	private NoticeDAO noticeDAO;
	private int cnt;
	private ArrayList<NoticeDTO> noticeList;
	private ArrayList<NoticeDTO> noticeSearchList;
	private String titleSearch;
	private String viewNoticeTitle;
	private RequestDispatcher dis;
	private String searchTitle;

	
	public NoticeServlet() {
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

		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());

		if (command.equals("/noticeRegister.no")) {
			noticeDTO.setNotiTitle(request.getParameter("notiTitle"));
			noticeDTO.setNotiContent(request.getParameter("notiContent"));
	
			try {
			    cnt=noticeDAO.noticeWrite(noticeDTO);
				out.print(cnt + "건 게시글이 등록되었습니다.");
				response.sendRedirect("noticeList.no");

			} catch (SQLException e) {
				e.printStackTrace();
			}

		} 
		else if (command.equals("/noticeList.no")) { 
			int curPage = 1; 
			if(request.getParameter("curPage")!=null) {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}
			PageTo noticeList = noticeDAO.page(curPage);
			RequestDispatcher dis = request.getRequestDispatcher("index.jsp?page=notice/listPage");
			request.setAttribute("page", noticeList);
			request.setAttribute("list", noticeList.getList());
			dis.forward(request, response);
		} 
		else if (command.equals("/noticeView.no")) {
			viewNoticeTitle = request.getParameter("no");
			int no = Integer.parseInt(viewNoticeTitle);
			try {
				noticeDTO = noticeDAO.noticeView(no);
				dis = request.getRequestDispatcher("index.jsp?page=notice/noticeView");
				request.setAttribute("noticeDTO", noticeDTO);
				dis.forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	
	else if (command.equals("/noticeDelete.no")) { 
			String no1 = request.getParameter("notiNo");
			int no = Integer.parseInt(no1);
			try {
				cnt = noticeDAO.noticeDelete(no); 
				response.sendRedirect("noticeList.no");
			} catch (SQLException e) {
				e.printStackTrace();
			}
} 
	else if (command.equals("/noticeSearch.no")) {
		searchTitle = request.getParameter("searchTitle");
	try {
		noticeSearchList = noticeDAO.noticeSearch(searchTitle);
		dis = request.getRequestDispatcher("index.jsp?page=notice/noticeSearch");
		request.setAttribute("noticeSearchList", noticeSearchList); //request라고 하는 서버객체에 넣겠다는 의미! 
		dis.forward(request, response);
	} catch (SQLException e) {
		e.printStackTrace();
	}
	}
	
/* else if(command.equals("/noticeUpdateSearch.no")) {
		titleSearch = request.getParameter("titleSearch");
		try {
			noticeDTO = noticeDAO.noticeSearch(titleSearch);
			RequestDispatcher dis = request.getRequestDispatcher("index.jsp?page=notice/noticeUpdateConfirm"); 
			request.setAttribute("noticeDTO", noticeDTO);
			dis.forward(request, Response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
} else if (command.equals("/noticeUpdateFinal.no")) {
	titleSearch = request.getParameter("titleSearch");
	noticeDTO.setNotiNo(Integer.parseInt(request.getParameter("notiNo")));
	noticeDTO.setNotiTitle(request.getParameter("notiTitle"));
	noticeDTO.setNotiContent(request.getParameter("notiContent"));
	noticeDTO.setNotiDate(request.getParameter("notiDate"));
	try {
		cnt = noticeDAO.noticeUpdateFinal(noticeDTO, titleSearch);
		noticeList = noticeDAO.boardList;
		RequestDispatcher dis = request.getRequestDispatcher("index.jsp?page=notice/noticeList");
		request.setAttribute("noticeList", noticeList);
		dis.forward(request, response);
	} catch (SQLException e) {
		e.printStackTrace();
	}
}*/
}

}


