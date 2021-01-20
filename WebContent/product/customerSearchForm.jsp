<%@page import="java.sql.ResultSet"%>
<%@page import="customer.CustomerDTO"%>
<%@page import="product.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="customerDAO" class="customer.CustomerDAO" scope="page" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COPANG</title>
<script>
	function back() { //사원번호 숫자만입력
		window.close();
	}
	function cuslist() { //사원번호 숫자만입력
		location.href = "../customerList.cu";
	}
</script>
<link rel="stylesheet" type="text/css" href="../css/reset.css">
<link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body style="height: 0;">
	<div class="wrap_popup">
		<ul>
			<li><img src="../images/Copang_logo.png"></li>
			<li>거래처 찾기</li>
		</ul>
		<hr>
		<div id="customerFind" class="popup">
			<!-- <form action="../customerSearch.pd" method="get">
		<ul>
			<li>
				<label for="searchCusName">거래처 정보를 찾기위한 페이지입니다</label>
			</li>
			<li style="border: 1px solid #ccc;">
			<input type="text" name="searchCusName" size="20"maxlength="10" autofocus="autofocus" required="required" placeholder="거래처명을 입력하세요" class="emp_no">
			<input type="submit" value="거래처찾기">
			</li>
			<li>
			<input type="submit" value="거래처 전체리스트" onclick="cuslist()">
			<input type="submit" value="돌아가기" onclick="back()">
			</li>
		</ul>
	</form> -->

			<div class="customer">
				<div class="table">
					<div class="search_area">
						<form action="../customerSearch.pd" method="get">
							<!-- <h1>거래처 목록</h1> -->
							<ul style="margin-left: auto; width: fit-content;">
								<li class="search_box"><input type="text"
									placeholder="거래처 이름" name="searchCusName" autofocus="autofocus"
									required="required"> <input type="submit" value="검색"></li>
							</ul>
						</form>
					</div>
					<hr>
					<table>
						<thead>
							<tr>
								<th style="width: 10%;">번호</th>
								<th style="width: 25%;">이름</th>
								<th style="width: 15%;">담당자</th>
							</tr>
						</thead>
			<%
			ResultSet rs = customerDAO.customerList();
				while (rs.next()) {
					CustomerDTO customerDTO = new CustomerDTO();
					int cusNo = rs.getInt("CUS_NO");
					String cusName = rs.getString("CUS_NAME");
					String cusManager = rs.getString("CUS_MANAGER");
					out.print("<tr><td>" + cusNo + "</td><td>" + cusName + "</td><td>" + cusManager
					+ "</td></tr>");
				}
			%>
						<tfoot>
							<tr>
								<td colspan="5"
									style="border: 1px solid white; padding-top: 2rem;"><jsp:include
										page="page.jsp" flush="true" /></td>
							</tr>
						</tfoot>
					</table>
					<div class="search_area">
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>