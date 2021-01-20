<%@page import="employee.EmployeeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COPANG</title>
</head>
<body>
	<div class="employee">
		<div class="table">
			<%
				String searchEmpName = request.getParameter("searchEmpName");
				ArrayList<EmployeeDTO> empList = (ArrayList<EmployeeDTO>) request.getAttribute("empList");
				if (empList.size() == 0) {
			%>
			<h3 style="text-align: center;">검색 결과가 없습니다..</h3>
			<br>
			<%
				} else {
			%>
			<div class="search_area">
				<form action="empSearch.ep" method="get">
					<h3>
						"
						<%=searchEmpName%>
						" 검색 결과
					</h3>
					<ul style="margin-left: auto; width: fit-content;">
						<li class="search_box"><input type="text" placeholder="사원 이름"
							name="searchEmpName" required="required"> <input
							type="submit" value="검색"></li>
					</ul>
				</form>
				<hr>
				<table>
					<thead>
						<tr>
							<th width="10%">사원번호</th>
							<th width="10%">이름</th>
							<th width="10%">전화번호</th>
							<th width="8%">부서</th>
							<th width="8%">직급</th>
						</tr>
					</thead>
					<%
						for (int i = 0; i < empList.size(); i++) {
								EmployeeDTO empDTO = empList.get(i);
								String deptName = null;
								String empRank = null;

								if (empDTO.getDeptNo() == 1) {
									deptName = "물류";
								} else if (empDTO.getDeptNo() == 3) {
									deptName = "인사관리";
								} else if (empDTO.getDeptNo() == 2) {
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
						<td><a href='empView.ep?empNo=<%=empDTO.getEmpNo()%>'
							style="color: black; text-decoration: none;"
							onmouseover="this.style.color='#0074E9'"
							onmouseout="this.style.color='black'"><%=empDTO.getEmpName()%></a></td>
						<td><%=empDTO.getEmpTel()%></td>
						<td><%=deptName%></td>
						<td><%=empRank%></td>
						<%
							}
							}
						%>
					</tr>
				</table>
				<br>
				<div class="search_area">
					<ul style="justify-content: center;">
						<li><input type="button" value="목록으로"
							onClick="location.href='empList.ep'"></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>