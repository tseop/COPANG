package notice;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/FileDown")
public class FileDown extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FileDown() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		String fileName = request.getParameter("fileName");

		ServletContext context = getServletContext();
		String uploadPath = context.getRealPath("filefolder");
		String filePath = uploadPath + File.separator + fileName;

		byte[] b = new byte[4096];

		FileInputStream in = new FileInputStream(filePath);

		String type = getServletContext().getMimeType(filePath);

		if (type == null) {
			type = "application/octet-stream";
		}
		response.setContentType(type);

		// 파일명이 한글일 경우
		String type2 = new String(fileName.getBytes("UTF-8"));
		response.setHeader("Content-Disposition", "attachment; fileName= " + type2);

		// 파일 쓰기
		ServletOutputStream out = response.getOutputStream();

		int read;
		while ((read = in.read(b, 0, b.length)) != -1) {
			out.write(b, 0, read);
		}
		
		out.flush();
		out.close();
		in.close();
	}

}
