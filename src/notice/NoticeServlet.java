package notice;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import employee.Login;

@MultipartConfig(
		fileSizeThreshold=1024*1024, //전송하는 데이터가 1MG가 넘을경우 디스크를 사용하자
		maxFileSize=1024*1024*5, //하나의 파일 사이즈 ->5MG가 하나의 파일에 최대크기 
		maxRequestSize=1024*1024*5*5 //전체 파일 사이즈 -> 전체 용량은 25메가를 초과할 수 없다.
		)

@WebServlet("*.no")
public class NoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIR = "filefolder";

	private NoticeDTO noticeDTO;
	private NoticeDAO noticeDAO;
	private RequestDispatcher dis;

	private int cnt;
	private ArrayList<NoticeDTO> noticeSearchList;
	private String viewNoticeTitle;
	private String searchTitle;

	private String realPath;
	private String uploadPath;
	private File fileSaveDir;
	private Part filePart;
	private String fileName;
	private int empNo;
	
	public NoticeServlet() {
		noticeDTO = new NoticeDTO();
		noticeDAO = new NoticeDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());

		// 게시글 등록
		if (command.equals("/noticeRegister.no")) {
			noticeDTO.setNotiTitle(request.getParameter("title"));
			noticeDTO.setNotiContent(request.getParameter("content"));			
			noticeDTO.setEmpNo((int)Login.session.getAttribute("EMP_NO"));
			
			try {
				realPath = request.getServletContext().getRealPath("");
				uploadPath = realPath + UPLOAD_DIR;

				fileSaveDir = new File(uploadPath);
				filePart = request.getPart("file");

				// 파일 경로 없으면 생성
				if (!fileSaveDir.exists()) {
					fileSaveDir.mkdirs();
				}			

				fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
				filePart.write(uploadPath + File.separator + fileName);						
				
				noticeDTO.setFileName(fileName);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			
			try {
				cnt = noticeDAO.noticeWrite(noticeDTO);
				request.setAttribute("noticeDTO", noticeDTO);
				out.print(cnt + "건 게시글이 등록되었습니다.");
				response.sendRedirect("noticeList.no");
				//getServletContext().getRequestDispatcher("/index.jsp?page=notice/noticeView").forward(request, response);

			} catch (SQLException e) {
				e.printStackTrace();
			}

		}

		// 게시글 목록
		else if (command.equals("/noticeList.no")) {
			int curPage = 1;
			if (request.getParameter("curPage") != null) {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}
			PageTo noticeList = noticeDAO.page(curPage);
			dis = request.getRequestDispatcher("index.jsp?page=notice/listPage");
			request.setAttribute("page", noticeList);
			request.setAttribute("list", noticeList.getList());
			dis.forward(request, response);
		}

		// 공지 내용 볼수 있는 화면
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

		// 게시글 삭제
		else if (command.equals("/noticeDelete.no")) {
			String no1 = request.getParameter("no");
			int no = Integer.parseInt(no1);
			try {
				cnt = noticeDAO.noticeDelete(no);
				response.sendRedirect("noticeList.no");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 
		
		//  게시글 검색
		else if (command.equals("/noticeSearch.no")) {
			searchTitle = request.getParameter("searchTitle");
			try {
				noticeSearchList = noticeDAO.noticeSearch(searchTitle);
				dis = request.getRequestDispatcher("index.jsp?page=notice/noticeSearch");
				request.setAttribute("noticeSearchList", noticeSearchList); // request라고 하는 서버객체에 넣겠다는 의미!
				dis.forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}

		// 게시글 수정
		else if (command.equals("/noticeUpdate.no")) {

			String updateNotiNo = request.getParameter("no");
			int updateFinalNo = Integer.parseInt(updateNotiNo);

			noticeDTO.setNotiNo(updateFinalNo);
			noticeDTO.setNotiTitle(request.getParameter("title"));
			noticeDTO.setNotiContent(request.getParameter("content"));

			try {
				cnt = noticeDAO.noticeUpdate(noticeDTO);
				dis = request.getRequestDispatcher("noticeList.no");
				request.setAttribute("noticeDTO", noticeDTO);
				dis.forward(request, response);

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		// 수정할 게시물 찾기
		else if (command.equals("/noticeUpdateSearch.no")) {
			int searchNo = Integer.parseInt(request.getParameter("no"));
			try {
				noticeDTO = noticeDAO.noticeUpdateSearch(searchNo);
				dis = request.getRequestDispatcher("index.jsp?page=notice/noticeUpdateConfirm");
				request.setAttribute("noticeDTO", noticeDTO);
				dis.forward(request, response);

			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
	}	

}
