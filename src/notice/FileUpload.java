package notice;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/FileUpload")
@MultipartConfig
public class FileUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIR = "filefolder";
	private FileDTO fileDTO;
	private FileDAO fileDAO;

    public FileUpload() {
        fileDTO = new FileDTO();
        fileDAO = new FileDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
				
		String realPath = request.getServletContext().getRealPath("");
		String uploadPath = realPath + UPLOAD_DIR;
		
		File fileSaveDir = new File(uploadPath);
		Part filePart = request.getPart("file");
		String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
//		System.out.println(realPath);
//		System.out.println(uploadPath);
		
		// 파일 경로 없으면 생성
		if(!fileSaveDir.exists()) {
			fileSaveDir.mkdirs();
		}
		
		request.setAttribute("fileName", fileName);
		getServletContext().getRequestDispatcher("/notice/uploadlist.jsp").forward(request, response);
	}

}
