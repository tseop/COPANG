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


@WebServlet("*.cu")
public class CustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CustomerDTO customerDTO;
	private CustomerDAO customerDAO;
	private int cnt;
	private RequestDispatcher dis;
	private String searchName;
	private ArrayList<CustomerDTO> customerSearchList;
	private ArrayList<CustomerDTO> cusList;
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
	              if(cnt==0) {
		            	out.print("실패!");
		            }else {
		            	out.print("<script>alert('거래처가 " + cnt + "건 등록되었습니다.');location.href='customerList.cu';</script>");
		            }
	           } catch (SQLException e) {
	              e.printStackTrace();
	           }
	      }//등록 
	      
	      else if(command.equals("/customerList.cu")){//목록         
	          int curPage = 1;//기본페이지
	          if(request.getParameter("curPage")!=null){
	             curPage = Integer.parseInt(request.getParameter("curPage"));            
	          }         
	          PageTo customerList = customerDAO.page(curPage);
	          dis = request.getRequestDispatcher("index.jsp?page=customer/customer");
	          request.setAttribute("page", customerList);
	          request.setAttribute("list", customerList.getList());
	          dis.forward(request, response);
	       }//목록
	    
	      else if (command.equals("/customerSearch.cu")) {
	    	  searchName = request.getParameter("searchCusName");
	          try {
	        	 customerSearchList = customerDAO.customerSearch(searchName);
	             dis = request.getRequestDispatcher("index.jsp?page=customer/customerSearch");
	             request.setAttribute("customerSearchList", customerSearchList);
	             dis.forward(request, response);
	          } catch (SQLException e) {
	             e.printStackTrace();
	          }
	       }//검색
	      
	      else if(command.equals("/customerDetails.cu")){//상세보기
	    	  	String num = request.getParameter("num");
				int cusNo = Integer.parseInt(num);
				try {
					customerDTO = customerDAO.customerDetail(cusNo);
					request.setAttribute("customerDTO", customerDTO);
					dis = request.getRequestDispatcher("index.jsp?page=customer/customerDetails");
					dis.forward(request, response);
				} catch (SQLException e) {
					e.printStackTrace();
				}
	    	 
	      }//상세보기
	      
	      else if(command.equals("/customerUpdate.cu")){//수정하기
	    	  	String num = request.getParameter("num");
				int cusNo = Integer.parseInt(num);
				customerDTO.setCusName(request.getParameter("cusName"));
		    	customerDTO.setCusManager(request.getParameter("cusManager"));
		    	customerDTO.setCusTel(request.getParameter("cusTel"));
		    	customerDTO.setBusinessNo(request.getParameter("businessNo"));
		    	try {
		            cnt = customerDAO.customerUpdate(cusNo, customerDTO);
		            if(cnt==0) {
		            	out.print("실패!");
		            }else {
		            	out.print("<script>alert('수정 완료 되었습니다.');location.href='customerDetails.cu?num="+num+"';</script>");
		            }
		         } catch (SQLException e) {
		              e.printStackTrace();
		         }
	      
	      }//수정하기
	      
	      else if(command.equals("/customerDelete.cu")){//삭제하기
	    	  String num = request.getParameter("num");
	          int cusNo = Integer.parseInt(num);
	          try {
	             cnt = customerDAO.customerDelete(cusNo);
	             response.sendRedirect("customerList.cu");
	          } catch (SQLException e) {
	             e.printStackTrace();
	          }
	      }//삭제
   }

}