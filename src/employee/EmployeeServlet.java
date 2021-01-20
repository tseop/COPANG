package employee;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.interceptors.SessionAssociationInterceptor;

@WebServlet("*.ep")
public class EmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EmployeeDTO empDTO;
	private EmployeeDAO empDAO;
	private int cnt;
	private ResultSet rs = null;
	private ArrayList<EmployeeDTO> empList;

	public EmployeeServlet() {
		empDTO = new EmployeeDTO();
		empDAO = new EmployeeDAO();
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

		HttpSession session = request.getSession();

		if (command.equals("/employeeRegister.ep")) {

			String c1 = request.getParameter("c1");
			String c2 = request.getParameter("c2");
			String c = c1.concat("-");
			c = c.concat(c2);
			empDTO.setDeptNo(Integer.parseInt((request.getParameter("dep"))));
			empDTO.setEmpNo(Integer.parseInt((request.getParameter("no"))));
			empDTO.setEmpPw(request.getParameter("pw"));
			empDTO.setEmpName(request.getParameter("name"));
			empDTO.setEmpSecurity(c);
			empDTO.setEmpTel(request.getParameter("tel"));
			empDTO.setEmpAddr(request.getParameter("addr"));
			empDTO.setEmpRank(Integer.parseInt(request.getParameter("rank")));
			try {
				cnt = empDAO.employeeRegister(empDTO);
				out.print(cnt + "명 사원이 등록되었습니다.");
				response.sendRedirect("index.jsp");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		else if (command.equals("/noDupleCheck.ep")) {
			int noSearch = Integer.parseInt(request.getParameter("no"));
			int no;
			try {
				rs = empDAO.idDupleCheck(noSearch);
				if (rs.next()) {
					no = rs.getInt("EMP_NO");
					if (no == noSearch) {
						out.print("이미 있는 사원번호입니다.<br>");
					}
				} else {
					out.print("사용가능합니다.<br>");
				}
				out.print("<input type = 'button' value ='종료' onClick='self.close()'>");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if (command.equals("/login.ep")) {
			int empNo = Integer.parseInt(request.getParameter("no"));
			String empPw = request.getParameter("pw");

			try {
				rs = empDAO.idDupleCheck(empNo);
				if (!(rs.next())) {
					out.print("없는 아이디입니다.");
				} else {
					rs = empDAO.pwCheck(empNo);
					if (rs.next()) {
						if (empPw.equals(rs.getString("EMP_PW"))) {
							session.setAttribute("empNo", empNo);
							out.print(empNo + "님 환영합니다.");
							response.sendRedirect("index.jsp");
						} else {
							out.print("비밀번호가 일치하지않습니다.");
						}
					}
					// empDTO = empDAO.empLogin(empNo, empPw);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if (command.equals("/logout.ep")) {
			Login.session.invalidate();
			response.sendRedirect("login.jsp");
		} 
		else if (command.equals("/empDelete.ep")) {
			int empNo = (int) Login.session.getAttribute("EMP_NO");
			String deletePw = request.getParameter("pw");
			try {
				rs = empDAO.pwFind(empNo);
				if (rs.next()) {
					if (deletePw.equals(rs.getString("EMP_PW"))) {
						empDAO.empDelete(empNo);
						out.print("<script>");
						out.print("alert('회원탈퇴되었습니다.');");
						out.print("</script>");
						Login.session.invalidate();
						response.sendRedirect("index.jsp");
					} else {
						out.print("<script>");
						out.print("alert('잘못입력하셨습니다.');");
						out.print("</script>");
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 
		
		else if (command.equals("/empDelete1.ep")) {
			int empNo = Integer.parseInt(request.getParameter("empNo"));
			out.print(empNo);
			try {
				cnt = empDAO.empDelete(empNo);
				out.print(empNo);
				response.sendRedirect("empList.ep");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		else if (command.equals("/empList.ep")) {
			int curPage = 1;
			if (request.getParameter("curPage") != null) {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}
			PageTo empList = empDAO.page(curPage);
			RequestDispatcher dis = request.getRequestDispatcher("index.jsp?page=employee/list");
			request.setAttribute("page", empList);
			request.setAttribute("empList", empList.getList());
			dis.forward(request, response);
		} else if (command.equals("/idFind.ep")) {
			String c1 = request.getParameter("c1");
			String c2 = request.getParameter("c2");
			String c = c1.concat("-");
			int empNo;
			c = c.concat(c2);
			try {
				rs = empDAO.idFind(c);
				if (rs.next()) {
					empNo = rs.getInt("EMP_NO");
					out.print("<script>");
					out.print("alert('찾으시는 사원번호는 " + empNo + "입니다.');");
					out.print("window.close();");
					out.print("</script>");
				} else {
					out.print("<script>");
					out.print("alert('해당 주민등록번호로 가입된 사원번호는 없습니다.');");
					out.print("window.open('employee/idFind.jsp','사원번호찾기','width=500,height=300','top=200,left=500');");
					out.print("</script>");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if (command.equals("/pwFind.ep")) {
			int empNo = Integer.parseInt(request.getParameter("no"));
			empDTO.setEmpNo(Integer.parseInt((request.getParameter("no"))));
			String pw = null;
			try {
				rs = empDAO.pwFind(empNo);
				if (rs.next()) {
					pw = rs.getString("EMP_PW");
					out.print("<script>");
					out.print("alert('찾으시는 비밀번호는 " + pw + "입니다.');");
					out.print("window.close();");
					out.print("</script>");
				} else {
					out.print("<script>");
					out.print("alert('존재하지 않는 사원번호입니다.');");
					out.print("window.open('employee/pwFind.jsp','비밀번호찾기','width=500,height=300','top=200,left=500');");
					out.print("</script>");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if (command.equals("/mypage.ep")) {
			int empNo = (int) Login.session.getAttribute("EMP_NO");
			try {
				rs = empDAO.mypage(empNo);
				while (rs.next()) {
					empDTO.setDeptNo(rs.getInt("DEPT_NO"));
					empDTO.setEmpAddr(rs.getString("EMP_ADDR"));
					empDTO.setEmpName(rs.getString("EMP_NAME"));
					empDTO.setEmpNo(rs.getInt("EMP_NO"));
					empDTO.setEmpPw(rs.getString("EMP_PW"));
					empDTO.setEmpRank(rs.getInt("EMP_RANK"));
					empDTO.setEmpSecurity(rs.getString("EMP_SECURITY"));
					empDTO.setEmpTel(rs.getString("EMP_TEL"));
				}
				RequestDispatcher dis = request.getRequestDispatcher("index.jsp?page=employee/mypage");
				request.setAttribute("empDTO", empDTO);
				dis.forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		else if (command.equals("/empView.ep")) {
			int empNo = Integer.parseInt(request.getParameter("empNo"));
			try {
				rs = empDAO.empView(empNo);
				while(rs.next()) {
					empDTO.setEmpNo(rs.getInt("EMP_NO"));
					empDTO.setEmpName(rs.getString("EMP_NAME"));
					empDTO.setEmpTel(rs.getString("EMP_TEL"));
					empDTO.setEmpAddr(rs.getString("EMP_ADDR"));
					empDTO.setDeptNo(rs.getInt("DEPT_NO"));
					empDTO.setEmpRank(rs.getInt("EMP_RANK"));
				}
				RequestDispatcher dis = request.getRequestDispatcher("index.jsp?page=employee/empView");
				request.setAttribute("empDTO", empDTO);
				dis.forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		else if (command.equals("/empSearch.ep")) {
			String searchEmpName = request.getParameter("searchEmpName");
			try {
				empList = empDAO.empSearch(searchEmpName);
				RequestDispatcher dis = request.getRequestDispatcher("index.jsp?page=employee/employeeSearch");
				request.setAttribute("empList", empList);
				dis.forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 

		else if (command.equals("/updateConfirm.ep")) {
			String pwUp = request.getParameter("pw");
			out.print(pwUp + "<br>");
			int empNo = (int) Login.session.getAttribute("EMP_NO");
			out.print(empNo + "<br>");
			try {
				rs = empDAO.pwFind(empNo);
				if (rs.next()) {
					empDTO.setEmpPw(rs.getString("EMP_PW"));
					if (pwUp.equals(empDTO.getEmpPw())) {
						response.sendRedirect("index.jsp?page=employee/updateForm");
					} else {
						out.print("<script>alert('비밀번호가 일치하지 않습니다.');history.back();</script>");
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/updateConfirm1.ep")) {
			out.print("123");
			empDTO = (EmployeeDTO) session.getAttribute("updateDTO");
			out.print("456");
			int empNoUp = empDTO.getEmpNo();
			//int empNoUp = Integer.parseInt(request.getParameter("empNo"));
			out.print("123");
			String pwUp = request.getParameter("pw");
			int empNo = (int) Login.session.getAttribute("EMP_NO");
			try {
				rs = empDAO.pwFind(empNo);
				if(rs.next()) {
					if(pwUp.equals(rs.getString("EMP_PW"))){
						rs = empDAO.empView(empNoUp);
						while(rs.next()) {
							empDTO.setEmpNo(rs.getInt("EMP_NO"));
							empDTO.setEmpName(rs.getString("EMP_NAME"));
							empDTO.setEmpTel(rs.getString("EMP_TEL"));
							empDTO.setEmpAddr(rs.getString("EMP_ADDR"));
							empDTO.setDeptNo(rs.getInt("DEPT_NO"));
							empDTO.setEmpRank(rs.getInt("EMP_RANK"));
							empDTO.setEmpSecurity(rs.getString("EMP_SECURITY"));
							empDTO.setEmpRank(rs.getInt("EMP_RANK"));
						}
						RequestDispatcher dis = request.getRequestDispatcher("index.jsp?page=employee/updateForm1");
						request.setAttribute("empDTO", empDTO);
						dis.forward(request, response);
						
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		else if (command.equals("/update.ep")) {
			int empNo = (int) Login.session.getAttribute("EMP_NO");
			String c1 = request.getParameter("c1");
			String c2 = request.getParameter("c2");
			String c = c1.concat("-");
			c = c.concat(c2);
			empDTO.setDeptNo(Integer.parseInt((request.getParameter("dep"))));
			empDTO.setEmpNo(Integer.parseInt((request.getParameter("no"))));
			empDTO.setEmpPw(request.getParameter("pw"));
			empDTO.setEmpName(request.getParameter("name"));
			empDTO.setEmpSecurity(c);
			empDTO.setEmpTel(request.getParameter("tel"));
			empDTO.setEmpAddr(request.getParameter("addr"));
			try {
				empDAO.empUpdate(empDTO, empNo);
				Login.session.setAttribute("EMP_NO", empDTO.getEmpNo());
				response.sendRedirect("mypage.ep");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/update1.ep")) {
			int empNo = Integer.parseInt(request.getParameter("no"));
			String c1 = request.getParameter("c1");
			String c2 = request.getParameter("c2");
			String c = c1.concat("-");
			c = c.concat(c2);
			empDTO.setDeptNo(Integer.parseInt((request.getParameter("dep"))));
			empDTO.setEmpAddr(request.getParameter("addr"));
			empDTO.setEmpName(request.getParameter("name"));
			empDTO.setEmpNo(empNo);
			empDTO.setEmpPw(request.getParameter("pw"));
			empDTO.setEmpSecurity(c);
			empDTO.setEmpTel(request.getParameter("tel"));
			try {
				empDAO.empUpdate(empDTO, empNo);
				response.sendRedirect("empList.ep");

			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
	}
}
