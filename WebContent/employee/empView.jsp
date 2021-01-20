<%@page import="employee.EmployeeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COPANG</title>

<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/style.css?v=125">
<script type="text/javascript">
	function button_event() {
		if (confirm("정말 삭제하시겠습니까??") == true) {
			/* location.href='customerDelete.cu'; */
			document.update.action = "empDelete1.ep";//해당 버튼을 눌럿을때 action의 경로를 바꾸어줌
			document.update.submit();
		} else {
			return false;
		}
	}
</script>
</head>
<body>

	<div class="employee">
		<div class="emp_form">
			<%
				EmployeeDTO empDTO = (EmployeeDTO) request.getAttribute("empDTO");
				String dept_name = null;
				if (empDTO.getDeptNo() == 1) {
					dept_name = "물류팀";
				} else if (empDTO.getDeptNo() == 2) {
					dept_name = "인사관리";
				} else if (empDTO.getDeptNo() == 3) {
					dept_name = "경영지원";
				}
				String rank = null;
				if (empDTO.getEmpRank() == 1) {
					rank = "일반사원";
				} else if (empDTO.getEmpRank() == 2) {
					rank = "팀장";
				}

				else if (empDTO.getEmpRank() == 3) {
					rank = "대표";
				}
			%>

			<h1>사원 상세보기</h1>
			<hr>
			<form name="update" action="employee/updateConfirm1.jsp" method="post">
				<input type="hidden" name="empNo" value="<%=empDTO.getEmpNo()%>">
				<table>
					<thead>
						<tr>
							<th><span class="required_content">*</span>사원 번호</th>
							<td><input type="text" name="empNo" required="required"
								maxlength="8" value="<%=empDTO.getEmpNo()%>" readonly>
						</tr>
					</thead>
				</table>
				<table>
					<thead>
						<tr>
							<th><span class="required_content">*</span>사원 이름</th>
							<td><input type="text" name="empName" required="required"
								maxlength="20" value="<%=empDTO.getEmpName()%>">
						</tr>
					</thead>
				</table>
				<table>
					<thead>
						<tr>
							<th><span class="required_content">*</span>전화번호</th>
							<td><input type="text" name="empTel" required="required"
								maxlength="15" value="<%=empDTO.getEmpTel()%>">
						</tr>
					</thead>
				</table>
				<table>
					<thead>
						<tr>
							<th><span class="required_content">*</span>주소</th>
							<td><input type="text" name="empAddr" required="required"
								maxlength="30" value="<%=empDTO.getEmpAddr()%>">
						</tr>
					</thead>
				</table>
				<table>
					<thead>
						<tr>
							<th><span class="required_content">*</span>부서이름</th>
							<%
								if (empDTO.getDeptNo() == 1) {
							%>
							<select name="dept_name">
								<option value="1" selected="selected">물류팀</option>
								<option value="2">경영지원</option>
								<option value="3">인사관리</option>
							</select>
							<%
								} else if (empDTO.getDeptNo() == 3) {
							%>
							<select name="dept_name">
								<option value="1">물류팀</option>
								<option value="2" selected="selected">경영지원</option>
								<option value="3">인사관리</option>
							</select>
							<%
								} else {
							%>
							<select name="dept_name">
								<option value="1">물류팀</option>
								<option value="2">경영지원</option>
								<option value="3" selected="selected">인사관리</option>
							</select>
							<%
								}
							%>
						</tr>
					</thead>
				</table>
				<table>
					<thead>
						<tr>
							<th><span class="required_content">*</span>직급</th>
							<%
								if (empDTO.getEmpRank() == 1) {
							%>
							<select name="rank">
								<option value="1" selected="selected">일반사원</option>
								<option value="2">팀장</option>
								<option value="3">대표</option>
							</select>
							<%
								} else if (empDTO.getDeptNo() == 2) {
							%>
							<select name="rank">
								<option value="1">일반사원</option>
								<option value="2" selected="selected">팀장</option>
								<option value="3">대표</option>
							</select>
							<%
								} else {
							%>
							<select name="rank">
								<option value="1">일반사원</option>
								<option value="2">팀장</option>
								<option value="3" selected="selected">대표</option>
							</select>
							<%
								}
							%>
						</tr>
					</thead>
				</table>
				<div class="search_area">
					<ul style="justify-content: center;">
						<%
							int EMP_RANK = (int) session.getAttribute("EMP_RANK");
							int EMP_DEPT = (int) session.getAttribute("EMP_DEPT");
							if (EMP_RANK == 3 || EMP_RANK == 2 || EMP_DEPT == 3) {
						%>
						<li><input  type="button" value="삭제하기" onclick="button_event()"></li>
						<li><input type="button" value="목록으로"	onClick="location.href='empList.ep'"></li>
						<li><input type ="submit" value="수정하기"></li>
						<%
							} else {
						%>
						<li><input type="button" value="목록으로"	onClick="location.href='empList.ep'"></li>
						<%} %>
						
					</ul>
				</div>
			</form>
		</div>
	</div>
</body>
</html>