package employee;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EmployeeDTO empDTO;
	private EmployeeDAO empDAO;
	public HttpSession session;
	
    public Login() {
        empDTO = new EmployeeDTO();
        empDAO = new EmployeeDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		session = request.getSession();
		
		int empNo = Integer.parseInt(request.getParameter("EMP_NO"));
		String empPw = request.getParameter("EMP_PW");
		
		try {
			empDTO = empDAO.empLogin(empNo, empPw);
			
			if(!(empNo == empDTO.getEmpNo()) || !(empPw.equals(empDTO.getEmpPw()))) {
				out.print("<script>alert('사원정보가 일치하지 않습니다.');history.back();</script>");
			} else {
				session.setAttribute("empDTO", empDTO);
				session.setAttribute("EMP_NO", empNo);
				session.setAttribute("EMP_RANK",empDTO.getEmpRank());
				session.setAttribute("EMP_DEPT", empDTO.getDeptNo());
				response.sendRedirect("index.jsp");				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
