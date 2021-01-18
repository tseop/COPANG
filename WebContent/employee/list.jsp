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
<div class="customer">
<div class="table">
<h1>사원목록</h1>
<table border = "1" cellspacing = "0" cellpadding= "0">
	<tr>
		<th>사원번호</th>
		<th>이름</th>
		<th width="10%">전화번호</th>
		<th width="30%">주소</th>
		<th width="10%">주민등록번호</th>
		<th>직급</th>
		<th>비밀번호</th>
		<th>부서번호</th>
		<th>부서이름</th>
	</tr>
	<%
		ArrayList<EmployeeDTO> empList = (ArrayList<EmployeeDTO>)request.getAttribute("empList");
		
		for(int i = 0;i<empList.size();i++){
			EmployeeDTO empDTO = empList.get(i);
			String dept_name = null;
			if(empDTO.getDeptNo() == 1){
				dept_name = "물류팀";
			}
			else if(empDTO.getDeptNo() == 2){
				dept_name = "인사관리";
			}
			else if(empDTO.getDeptNo() == 3){
				dept_name = "경영지원";
			}
	%>
	<tr>
		<td width="80px"><%=empDTO.getDeptNo() %></td>
		<td width="80px"><%=empDTO.getEmpName() %></td>
		<td width="150px"><%=empDTO.getEmpTel() %></td>
		<td width="400px"><%=empDTO.getEmpAddr() %></td>
		<td width="200px"><%=empDTO.getEmpSecurity() %></td>
		<td width="40px"><%=empDTO.getEmpRank() %></td>
		<td width="80px"><%=empDTO.getEmpPw() %></td>
		<td width="80px"><%=empDTO.getDeptNo() %></td>
		<td width="80px"><%=dept_name %></td>
	</tr>
	
	<%
		}
	%>
</table>
</div>
<a href="main.jsp?page=employee/mypage">마이페이지</a>
</div>
</body>
</html>