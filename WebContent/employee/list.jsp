<%@page import="employee.EmployeeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div class="customer">
		<div class="table" style="min-width: 1012px;">
			<h1>사원목록</h1>
			<hr>
			<table>
				<tr>
					<th width="10%">사원번호</th>
					<th width="10%">이름</th>
					<th width="10%">전화번호</th>
					<th width="8%">부서</th>
					<th width="8%">직급</th>
					<th width="20%">주소</th>
					<th width="15%">주민등록번호</th>
					<th width="10%">비밀번호</th>
				</tr>
				<%
					ArrayList<EmployeeDTO> empList = (ArrayList<EmployeeDTO>) request.getAttribute("empList");

					for (int i = 0; i < empList.size(); i++) {
						EmployeeDTO empDTO = empList.get(i);
						String deptName = null;
						String empRank = null;

						if (empDTO.getDeptNo() == 1) {
							deptName = "물류";
						} else if (empDTO.getDeptNo() == 2) {
							deptName = "인사관리";
						} else if (empDTO.getDeptNo() == 3) {
							deptName = "경영지원";
						} else if (empDTO.getDeptNo() == 4) {
							deptName = "사장";
						}

						if (empDTO.getEmpRank() == 1) {
							empRank = "사원";
						} else if (empDTO.getEmpRank() == 2) {
							empRank = "팀장";
						} else if (empDTO.getEmpRank() == 3) {
							empRank = "사장";
						}
				%>
				<tr>
					<td><%=empDTO.getEmpNo()%></td>
					<td><%=empDTO.getEmpName()%></td>
					<td><%=empDTO.getEmpTel()%></td>
					<td><%=deptName%></td>
					<td><%=empRank%></td>
					<td><%=empDTO.getEmpAddr()%></td>
					<%-- 		<td><%=empDTO.getEmpSecurity() %></td> --%>
					<td>********</td>
					<%-- 		<td><%=empDTO.getEmpPw() %></td> --%>
					<td>********</td>
				</tr>

				<%
					}
				%>
			</table>
			<br>
			<div class="search_area">
				<ul>
					<%
						int EMP_RANK = (int) session.getAttribute("EMP_RANK");
						int EMP_DEPT = (int) session.getAttribute("EMP_DEPT");
						if (EMP_RANK == 2 || EMP_RANK == 3) { //버튼 세션값에 따라 나타내는거
					%>
					<li><input type="button" value="사원 등록"
						onClick="location.href='index.jsp?page=employee/registerForm'"></li>
					<!-- 		<li><input type="button" value="사원 수정" onClick="location.href=''"></li> -->
					<%
						}
					%>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>