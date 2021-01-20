<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.emp_update_form {
	width: 80%;
	margin: auto;
}

.emp_update_form input[type=password] {
	padding: 0.5rem;
	border: 1px solid #ccc;
	width: 15rem;
}

.emp_update_form label {
	font-size: 0px;
}

.emp_update_form form {
	text-align: center;
}

.emp_update_form input[type=submit] {
	border: none;
	background: #366afe;
	color: white;
	padding: 0.8rem 1.5rem;
	font-size: 0.8rem;
}

.emp_update_form hr {
	margin: 2rem 0 2rem 0;
	width: 100%;
}
</style>
<meta charset="UTF-8">
<title>COPANG</title>
</head>
<body>
<%
	int proNo = Integer.parseInt((request.getParameter("proNo")));
	String cusName = request.getParameter("cusName");
%>
<div class="customer">
		<div class="emp_update_form">
			<h1>제품 수정</h1>
			<form action="productConfirm.pd" method="get">
			<input type="hidden" name="proNo" value=<%=proNo %>>
			<input type="hidden" name="cusName" value=<%=cusName %>>
			
			
				<hr>
				<label>비밀번호를 입력해주세요</label> <input type="password" name="pw" id="pw"
					size="20" required="required" autofocus="autofocus" maxlength="10" placeholder="비밀번호 입력">
				<br>
				<br> <input type="submit" value="수정">
			</form>
		</div>
	</div>
</body>
</html>