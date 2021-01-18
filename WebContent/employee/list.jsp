<%@page import="employee.EmployeeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
#main{
	position: absolute;
   width: 1400px;
   height: 400px;
   top: 200px;
   left: 600px;
   background-color: aqua;
}
</style>
<meta charset="UTF-8">
<title>KHJSP</title>
</head>
<body>
<div id="main">
<h1>사원목록</h1>
<table border = "1" cellspacing = "0" cellpadding= "0">
	<tr>
		<th width="80px">사원번호</th>
		<th width="80px">이름</th>
		<th width="150px">전화번호</th>
		<th width="400px">주소</th>
		<th width="200px">주민등록번호</th>
		<th width="40px">직급</th>
		<th width="80px">비밀번호</th>
		<th width="80px">부서번호</th>
		<th width="80px">부서이름</th>
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
<a href="index.jsp">홈</a>
</div>
</body>
</html>