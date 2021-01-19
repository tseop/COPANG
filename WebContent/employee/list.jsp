<%@page import="employee.EmployeeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link>
<meta charset="UTF-8">
<title>KHJSP</title>
</head>
<body>
<!-- <<<<<<< HEAD -->
<div class="customer">
<div class="table" style="min-width: 1012px;">
<h1>사원목록</h1>
<hr>
<table>
	<tr>
		<th width="10%">사원번호</th>
		<th width="10%">이름</th>
		<th width="10%">전화번호</th>
		<th width="20%">주소</th>
		<th width="15%">주민등록번호</th>
		<th width="8%">직급</th>
		<th width="10%">비밀번호</th>
		<th width="5%">부서번호</th>
		<th width="8%">부서이름</th>
	</tr>
	<%
		ArrayList<EmployeeDTO> empList = (ArrayList<EmployeeDTO>)request.getAttribute("empList");
		
		for(int i = 0;i<empList.size();i++){
			EmployeeDTO empDTO = empList.get(i);
			String dept_name = null;
			String rank = null;
			if(empDTO.getDeptNo() == 1){
				dept_name = "물류팀";
			}
			else if(empDTO.getDeptNo() == 2){
				dept_name = "인사관리";
			}
			else if(empDTO.getDeptNo() == 3){
				dept_name = "경영지원";
			}
			else if(empDTO.getDeptNo() == 4){
				dept_name = "사장";
			}
			if(empDTO.getEmpRank() == 1){
				rank = "일반사원";
			}
			else if(empDTO.getEmpRank() == 2){
				rank = "팀장";
			}
			else if(empDTO.getEmpRank() == 3){
				rank = "사장";
			}
	%>
	<tr>
		<td><%=empDTO.getEmpNo() %></td>
		<td><%=empDTO.getEmpName() %></td>
		<td><%=empDTO.getEmpTel() %></td>
		<td><%=empDTO.getEmpAddr() %></td>
<%-- 		<td><%=empDTO.getEmpSecurity() %></td> --%>
		<td>********</td>
		<td><%=rank %></td>
<%-- 		<td><%=empDTO.getEmpPw() %></td> --%>
		<td>********</td>
		<td><%=empDTO.getDeptNo() %></td>
		<td><%=dept_name %></td>
	</tr>
	
	<%
		}
	%>
</table>
<br>
<div class="search_area">
	<ul>
		<li><input type="button" value="사원 등록" onClick="location.href='index.jsp?page=employee/registerForm'"></li>
<!-- 		<li><input type="button" value="사원 수정" onClick="location.href=''"></li> -->
	</ul>
</div>
</div>
</div>
<!-- ======= -->
<!-- 	<div class="customer"> -->
<!-- 		<div class="table"> -->
<!-- 			<h1>사원목록</h1> -->
<!-- 			<hr> -->
<!-- 			<table border="1" cellspacing="0" cellpadding="0"> -->
<!-- 				<tr> -->
<!-- 					<th width="10%">사원번호</th> -->
<!-- 					<th width="10%">이름</th> -->
<!-- 					<th width="10%">전화번호</th> -->
<!-- 					<th width="20%">주소</th> -->
<!-- 					<th width="15%">주민등록번호</th> -->
<!-- 					<th width="8%">직급</th> -->
<!-- 					<th width="10%">비밀번호</th> -->
<!-- 					<th width="8%">부서이름</th> -->
<!-- 				</tr> -->
<%-- 				<% --%>
<!-- // 					ArrayList<EmployeeDTO> empList = (ArrayList<EmployeeDTO>) request.getAttribute("empList"); -->

<!-- // 					for (int i = 0; i < empList.size(); i++) { -->
<!-- // 						EmployeeDTO empDTO = empList.get(i); -->
<!-- // 						String dept_name = null; -->
<!-- // 						String emp_rank = null; -->

<!-- // 						if (empDTO.getDeptNo() == 1) { -->
<!-- // 							dept_name = "물류팀"; -->
<!-- // 						} else if (empDTO.getDeptNo() == 2) { -->
<!-- // 							dept_name = "인사관리"; -->
<!-- // 						} else if (empDTO.getDeptNo() == 3) { -->
<!-- // 							dept_name = "경영지원"; -->
<!-- // 						} else { -->
<!-- // 							dept_name = "사장"; -->
<!-- // 						} -->

<!-- // 						if (empDTO.getEmpRank() == 1) { -->
<!-- // 							emp_rank = "사원"; -->
<!-- // 						} else if (empDTO.getEmpRank() == 2) { -->
<!-- // 							emp_rank = "팀장"; -->
<!-- // 						} else { -->
<!-- // 							emp_rank = "사장"; -->
<!-- // 						} -->
<%-- 				%> --%>
<!-- 				<tr> -->
<%-- 					<td><%=empDTO.getEmpNo()%></td> --%>
<%-- 					<td><%=empDTO.getEmpName()%></td> --%>
<%-- 					<td><%=empDTO.getEmpTel()%></td> --%>
<%-- 					<td><%=empDTO.getEmpAddr()%></td> --%>
<%-- 							<td><%=empDTO.getEmpSecurity() %></td> --%>
<!-- 					<td>********</td> -->
<%-- 					<td><%=emp_rank%></td> --%>
<%-- 							<td><%=empDTO.getEmpPw() %></td> --%>
<!-- 					<td>********</td> -->
<%-- 					<td><%=dept_name%></td> --%>
<!-- 				</tr> -->

<%-- 				<% --%>
<!-- // 					} -->
<%-- 				%> --%>
<!-- 			</table> -->
<!-- 			<br> -->
<!-- 			<div class="search_area"> -->
<!-- 				<ul> -->
<!-- 					<li><input type="button" value="사원 등록" -->
<!-- 						onClick="location.href='index.jsp?page=employee/registerForm'"></li> -->
<!-- 							<li><input type="button" value="사원 수정" onClick="location.href=''"></li> -->
<!-- 				</ul> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- >>>>>>> f1a34878a7c2dd6d71260622d2ee6eefbf4f17d8 -->
</body>
</html>