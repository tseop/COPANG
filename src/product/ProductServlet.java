package product;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import customer.CustomerDAO;
import customer.CustomerDTO;
import employee.EmployeeDAO;
import employee.EmployeeDTO;
import employee.Login;
import product.PageTo;

//import org.eclipse.jdt.internal.compiler.env.IGenericField;


@WebServlet("*.pd")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDTO productDTO;
	private ProductDAO productDAO;
	private CustomerDAO customerDAO;
	private EmployeeDTO empDTO;
	private EmployeeDAO empDAO;
	
	private Connection conn;
	private int cnt;
	private ResultSet rs;
	private RequestDispatcher dis;
	private String searchData, searchCusName;
	private ArrayList<ProductDTO> productSearchList;
	private ArrayList<CustomerDTO> customerSearchList;
	public ProductServlet() {
		productDTO = new ProductDTO();
		productDAO = new ProductDAO();
		empDTO =new EmployeeDTO();
		empDAO =new EmployeeDAO();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      doPost(request, response);
	   }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		String requestURI = request.getRequestURI(); // URI가 는 "/프로젝트명/*.do" 를 가르킨다 ex)/KHProject2/*.do
		String contextPath = request.getContextPath(); // contextPath는 = "/프로젝트명" 을 가르킨다 ex) /KHProject2
		String command = requestURI.substring(contextPath.length()); // 길이만큼 잘른게 command 가 된다 ex)/studentList.do

		if (command.equals("/productRegister.pd")) { 
			productDTO.setProName(request.getParameter("proName"));
			productDTO.setCusName(request.getParameter("cusName"));
			productDTO.setProStoring(request.getParameter("proStoring"));
			productDTO.setProCost(request.getParameter("proCost"));
			productDTO.setProPrice(request.getParameter("proPrice"));
			productDTO.setProFirstNal(request.getParameter("proFirstNal"));
			productDTO.setProLastNal(request.getParameter("proLastNal"));
			productDTO.setProStock(request.getParameter("proStock"));
			try {
				productDAO.productRegister(productDTO);
				//out.print("<script>alert('상품등록이 완료되었습니다'; location.href='productList.pd';</script>");
				response.sendRedirect("productList.pd"); // doPost의 인자로 있다 response
			} catch (SQLException e) {
				e.printStackTrace();
			} 
		}
		
		else if(command.equals("/productList.pd")) {
			int curPage = 1;//기본페이지
	          if(request.getParameter("curPage")!=null){
	             curPage = Integer.parseInt(request.getParameter("curPage"));            
	          }     
	          productDTO.setCusName(request.getParameter("cusName"));
	          PageTo productList = productDAO.page(curPage);
//	        	 productList = productDAO.productList();
	             dis = request.getRequestDispatcher("index.jsp?page=product/product");
	             request.setAttribute("page", productList);
	             request.setAttribute("productList", productList.getList());
	             dis.forward(request, response);
	      }
		
		else if(command.equals("/productDelete.pd")){
			String proNo =request.getParameter("proNo");
			int no=Integer.parseInt(proNo);
			try {
				cnt = productDAO.productDelete(no);
				response.sendRedirect("productList.pd");
//				RequestDispatcher dis=request.getRequestDispatcher("index.jsp?page=members/memberList");
//				request.setAttribute("productDTO", productDTO);
//				dis.forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} 
		}
		
		else if (command.equals("/productSearch.pd")) {
			searchData = request.getParameter("searchData");
			 String colum=request.getParameter("colum");
	          try {
	        	 productSearchList = productDAO.productSearch(searchData, colum);
	             dis = request.getRequestDispatcher("index.jsp?page=product/productSearch");
	             request.setAttribute("productSearchList", productSearchList);
	             dis.forward(request, response);
	          } catch (SQLException e) {
	             e.printStackTrace();
	          }
	       }//검색
		else if (command.equals("/productConfirm.pd")) {
			String pw = request.getParameter("pw");
			int proNo = Integer.parseInt(request.getParameter("proNo"));
			int empNo = (int)Login.session.getAttribute("EMP_NO");
			try {
				rs = empDAO.pwFind(empNo);
				productDTO = productDAO.productUpdateConfirm(proNo);
				if(rs.next()) {
					//empDTO.setEmpPw(rs.getString("EMP_PW"));
					if(pw.equals(rs.getString("EMP_PW"))) {
//						RequestDispatcher dis = request.getRequestDispatcher("index.jsp?page=product/productUpdateForm");
//						request.setAttribute("proNo", proNo);
//						dis.forward(request,response);
//						response.sendRedirect("index.jsp?page=product/productUpdateForm");
						dis = request.getRequestDispatcher("index.jsp?page=product/productUpdateForm");
						request.setAttribute("productDTO", productDTO);
						dis.forward(request, response);
					}
					else {
						out.print("<script>alert('비밀번호가 일치하지 않습니다.');history.back();</script>");
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		else if (command.equals("/productUpdate.pd")) {
			int proNo = Integer.parseInt(request.getParameter("proNo"));
			productDTO.setProName(request.getParameter("proName"));
			productDTO.setProStoring(request.getParameter("proStoring"));
			productDTO.setProCost(request.getParameter("proCost"));
			productDTO.setProPrice(request.getParameter("proPrice"));
			productDTO.setProLastNal(request.getParameter("proLastNal"));
			productDTO.setProStock(request.getParameter("proStock"));
			try {
				cnt = productDAO.proUpdate(productDTO,proNo);
//				productDAO.cusNameUpdate(productDTO,cusName);
//				response.sendRedirect("productList.pd");
				dis = request.getRequestDispatcher("productList.pd");
				request.setAttribute("productDTO", productDTO);
				dis.forward(request, response);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/stockUpdate.pd")) {
			int todayValue = Integer.parseInt(request.getParameter("todayValue"));
			int num = Integer.parseInt(request.getParameter("num"));
	        try {
				productDAO.stockUpdate(todayValue, num);
				dis = request.getRequestDispatcher("productList.pd");
				request.setAttribute("productList", productDTO);
				dis.forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
	      }

		else if (command.equals("/customerSearch.pd")) {
	          
	    	  searchCusName = request.getParameter("searchCusName");
	          try {
	        	 customerSearchList = productDAO.customerSearch(searchCusName);
	             dis = request.getRequestDispatcher("product/customerSearch.jsp");
	             request.setAttribute("customerSearchList", customerSearchList);
	             dis.forward(request, response);
	          } catch (SQLException e) {
	             e.printStackTrace();
	          }
//	          
	          int curPage = 1;//기본페이지
	          if(request.getParameter("curPage")!=null){
	             curPage = Integer.parseInt(request.getParameter("curPage"));            
	          }         
	          customer.PageTo customerList = customerDAO.page(curPage);
	          dis = request.getRequestDispatcher("product/customerSearchForm.jsp");
	          request.setAttribute("page", customerList);
	          request.setAttribute("list", customerList.getList());
	          dis.forward(request, response);
//
//			  int curPage = 1;//기본페이지
//	          if(request.getParameter("curPage")!=null){
//	             curPage = Integer.parseInt(request.getParameter("curPage"));            
//	          }         
//	          PageTo customerList = productDAO.page1(curPage);
//	          dis = request.getRequestDispatcher("product/customerSearchForm.jsp");
//	          request.setAttribute("page1", customerList);
//	          request.setAttribute("list1", customerList.getList1());
//	          dis.forward(request, response);
	          
	       }//검색
	
	}
}


