<%@page import="product.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KHJSP</title>
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
						<c:forEach items="${list }" var="customer">
							<tr>
								<td class="num">${customer.cusNo}</td>
								<td><a href='customerDetails.cu?num=${customer.cusNo}'
									style="color: black; text-decoration: none;"
									onmouseover="this.style.color='blue'"
									onmouseout="this.style.color='black'"> ${customer.cusName}</a></td>
								<td>${customer.cusManager}</td>
							</tr>
						</c:forEach>
						<tfoot>
							<tr>
								<td colspan="5"
									style="border: 1px solid white; padding-top: 2rem;"><jsp:include
										page="page.jsp" flush="true" /></td>
							</tr>
						</tfoot>
					</table>
					<div class="search_area">
						<ul>
							<%
							int EMP_RANK = (int) session.getAttribute("EMP_RANK");
							int EMP_DEPT = (int) session.getAttribute("EMP_DEPT");
							if (EMP_RANK == 2 && EMP_DEPT == 2 || EMP_RANK == 2 && EMP_DEPT == 1 || EMP_RANK == 4) { //버튼 세션값에 따라 나타내는거
							%>
							<li><input type="button" value="거래처 등록"
								onClick="location.href='index.jsp?page=customer/customerRegister'"></li>
							<%
								}
							%>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>