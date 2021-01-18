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

import product.PageTo;

//import org.eclipse.jdt.internal.compiler.env.IGenericField;


@WebServlet("*.pd")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDTO productDTO;
	private ProductDAO productDAO;
	
	private Connection conn;
	private int cnt;
	private ResultSet rs;
	private RequestDispatcher dis;
	private String searchName;
	private ArrayList<ProductDTO> productSearchList;
	public ProductServlet() {
		productDTO = new ProductDTO();
		productDAO = new ProductDAO();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      doPost(request, response);
	   }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		String requestURI = request.getRequestURI(); // URI가 는 "/프로젝트명/*.do" 를 가르킨다 ex)/KHProject2/*.do
		String contextPath = request.getContextPath(); // contextPath는 = "/프로젝트명" 을 가르킨다 ex) /KHProject2
		String command = requestURI.substring(contextPath.length()); // 길이만큼 잘른게 command 가 된다 ex)/studentList.do

		if (command.equals("/productRegister.pd")) { 
			productDTO.setProName(request.getParameter("proName"));
			productDTO.setCusName(request.getParameter("cusName"));
			productDTO.setProStoring(Integer.parseInt(request.getParameter("proStoring")));
			productDTO.setProCost(Integer.parseInt(request.getParameter("proCost")));
			productDTO.setProPrice(Integer.parseInt(request.getParameter("proPrice")));
			productDTO.setProFirstNal(request.getParameter("proFirstNal"));
			productDTO.setProLastNal(request.getParameter("proLastNal"));
			productDTO.setProStock(Integer.parseInt(request.getParameter("proStock")));
			try {
				productDAO.productRegister(productDTO);
				out.print("<script>alert('상품등록이 완료되었습니다'; location.href='productList.pd';</script>");
//				response.sendRedirect("productList.pd"); // doPost의 인자로 있다 response
			} catch (SQLException e) {
				e.printStackTrace();
			} 
		}
		
		else if(command.equals("/productList.pd")) {
			int curPage = 1;//기본페이지
	          if(request.getParameter("curPage")!=null){
	             curPage = Integer.parseInt(request.getParameter("curPage"));            
	          }         
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
			 searchName = request.getParameter("searchProName");
	          try {
	        	 productSearchList = productDAO.productSearch(searchName);
	             dis = request.getRequestDispatcher("index.jsp?page=product/productSearch");
	             request.setAttribute("productSearchList", productSearchList);
	             dis.forward(request, response);
	          } catch (SQLException e) {
	             e.printStackTrace();
	          }
	       }//검색
		else if (command.equals("/productUpdate.pd")) {
//			
		}
		else if (command.equals("/productUpdateFinal.pd")) {
			
		}
		
	}

}
