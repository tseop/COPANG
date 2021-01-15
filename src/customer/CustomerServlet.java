package customer;

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

@WebServlet({ "*.cu" })
public class CustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CustomerDTO customerDTO;
	private CustomerDAO customerDAO;
	private int cnt;
	private ArrayList<CustomerDTO> customerList;
	private RequestDispatcher dis;
	
   public CustomerServlet() {
	  customerDTO = new CustomerDTO();
	  customerDAO = new CustomerDAO();
   }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doPost(request, response);
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
      response.setContentType("text/html;charset=utf-8");
      PrintWriter out = response.getWriter();
      String requestURI = request.getRequestURI();
      String contextPath = request.getContextPath();
      String command = requestURI.substring(contextPath.length());

	      if (command.equals("/customerRegister.cu")) {
	    	  customerDTO.setCusName(request.getParameter("cusName"));
	    	  customerDTO.setCusManager(request.getParameter("cusManager"));
	    	  customerDTO.setCusTel(request.getParameter("cusTel"));
	    	  customerDTO.setBusinessNo(request.getParameter("businessNo"));
	    	  try {
	              cnt = customerDAO.customerRegister(customerDTO);
	              out.print(cnt + "건 거래처가 등록되었습니다.");
	              response.sendRedirect("customerList.cu");
	           } catch (SQLException e) {
	              e.printStackTrace();
	           }
	      }//등록 hi
	      
	      else if(command.equals("/customerList.cu")){//목록         
	          int curPage = 1;//기본페이지
	          if(request.getParameter("curPage")!=null){
	             curPage = Integer.parseInt(request.getParameter("curPage"));            
	          }         
	          PageTo customerList = customerDAO.page(curPage);
	          dis = request.getRequestDispatcher("index.jsp?page=customer/customer");
	          request.setAttribute("page", customerList);
	          //listPage.jsp에서 목록 리스트 데이터 저장
	          request.setAttribute("list", customerList.getList());
	          //page.jsp에서 페이징 처리 데이터 저장
	          dis.forward(request, response);
	       }//목록
   }

}