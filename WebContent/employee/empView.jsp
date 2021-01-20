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


function button_event(){
	if (confirm("정말 삭제하시겠습니까??") == true){
   		/* location.href='customerDelete.cu'; */
   		document.update.action = 'empDelete.ep';//해당 버튼을 눌럿을때 action의 경로를 바꾸어줌
   		document.update.submit();
	}else{
	    return false;
	}
}
</script>
</head>
<body>

	<div class="customer">
		<div class="reg_form">
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
					rank = "사장";
				}
			%>

			<h1>사원 상세보기</h1>
			<hr>
			<table>
				<thead>
					<tr>
						<th><span class="required_content">*</span>사원 번호</th>
						<td><input type="text" name="empNo" required="required"
							maxlength="8" value="<%=empDTO.getEmpNo()%>">
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
						<td><input type="text" name="dept_Name" required="required"
							maxlength="30" value="<%=dept_name%>">
					</tr>
				</thead>
			</table>
			<table>
				<thead>
					<tr>
						<th><span class="required_content">*</span>직급</th>
						<td><input type="text" name="emp_Rank" required="required"
							maxlength="30" value="<%=rank%>">
					</tr>
				</thead>
			</table>
			<div class="search_area">
				<ul style="justify-content: center;">
				<%
					int EMP_RANK = (int) session.getAttribute("EMP_RANK");
					int EMP_DEPT = (int) session.getAttribute("EMP_DEPT");
					if(EMP_RANK == 3){
				%>
					<li><input type="button" value="삭제하기"
						onClick="location.href='empDelete1.ep?empNo='+<%=empDTO.getEmpNo() %>"></li>
					<li><input type="button" value="목록으로"
						onClick="location.href='empList.ep"></li>
					<li><input type="button" value="수정하기"
						onClick="location.href='index.jsp?page=employee/registerForm'"></li>
				<% 
					}
				%>
				</ul>
			</div>

		</div>
	</div>
</body>
</html>