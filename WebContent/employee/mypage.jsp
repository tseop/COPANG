<%@page import="employee.EmployeeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KHJSP</title>
</head>
<body>
	<%
		EmployeeDTO empDTO = (EmployeeDTO) request.getAttribute("empDTO");
		String dept_name = null;
		String rank = null;
		if (empDTO.getDeptNo() == 1) {
			dept_name = "물류";
		} else if (empDTO.getDeptNo() == 3) {
			dept_name = "인사관리";
		} else if (empDTO.getDeptNo() == 2) {
			dept_name = "경영지원";
		}
		else {
			dept_name = "대표";
		}
		
		if(empDTO.getEmpRank() == 1){
			rank = "사원";
		}
		else if(empDTO.getEmpRank() == 2){
			rank = "팀장";
		}
		else if(empDTO.getEmpRank() == 3){
			rank = "대표";
		}
		
	%>
	<div class="customer">
		<div class="table">
		<h1>마이페이지</h1>
		<hr>
			<table border="1" cellspacing="0" cellpadding="0">
			<thead>
				<tr>
					<th width="5%">사원번호</th>
					<th width="10%">이름</th>
					<th width="15%">전화번호</th>
					<th width="20%">주소</th>
					<th width="8%">직급</th>
					<th width="8%">부서</th>
				</tr>
			
				<tr>
					<td><%=empDTO.getEmpNo()%></td>
					<td><%=empDTO.getEmpName()%></td>
					<td><%=empDTO.getEmpTel()%></td>
					<td><%=empDTO.getEmpAddr()%></td>
					<td><%=rank%></td>
					<td><%=dept_name%></td>
				</tr>
			</thead>
			</table>
		</div>
		
	<div class="search_area">
	<ul style="justify-content: center;">
		<li><input type="button" value="내 정보 수정" onClick="location.href='index.jsp?page=employee/updateConfirm'"></li>
	</ul>
	</div>
</div>
</body>
</html>