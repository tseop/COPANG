package notice;

import java.io.File;
import java.io.IOException;
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
	//private static final String UPLOAD_DIR = "filefolder";

	public FileUpload() {
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		String realPath = request.getServletContext().getRealPath("");
		//String uploadPath = realPath + UPLOAD_DIR;

		//File fileSaveDir = new File(uploadPath);
		Part filePart = request.getPart("file");
	
		String fileName = null;
		long fileSize = 0;

		// 파일 경로 없으면 생성
		//if (!fileSaveDir.exists()) {
		//	fileSaveDir.mkdirs();
		//}
		
		for (Part part : request.getParts()) {
			fileName = getFileName(part);
			fileSize = part.getSize();
			//part.write(uploadPath + File.separator + fileName);
		}

		request.setAttribute("fileName", fileName);
		request.setAttribute("fileSize", fileSize);
		getServletContext().getRequestDispatcher("/notice/uploadlist.jsp").forward(request, response);
	}	

	private String getFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		String[] tokens = contentDisp.split(";");

		for (String token : tokens) {
			if (token.trim().startsWith("filename")) {
				return token.substring(token.indexOf("=") + 2, token.length() - 1);
			}
		}

		return "";
	}

}
