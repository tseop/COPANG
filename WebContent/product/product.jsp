<%@page import="product.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<script>
	function popup() {
		var url = "product/customerSearchForm.jsp";
		var name = "popup test";
		var option = "width = 1000, height = 600, top = 100, left = 200, location = no"
		window.open(url, name, option);
	}
</script>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/product.css?v=45">
<meta charset="UTF-8">
<title>COPANG</title>
</head>
<body>
	<div class="wrap">

		<form action="productRegister.pd" method="get">
			<div class="title_area">
				<a><img src="images/table.svg"> 제품 등록</a> 
			<%
						int empRank = (int) session.getAttribute("EMP_RANK");
						int deptNo = (int) session.getAttribute("EMP_DEPT");
						if (!(empRank == 1 && deptNo == 2 || empRank == 1 && deptNo == 3 || empRank == 2 && deptNo == 3)) { //버튼 세션값에 따라 나타내는거
					%>
				<input type="submit" value="등록하기">
				<%
						}
					%>
			</div>
			<div class="register">
				<table border="1">
					<tr>
						<th style="width: 10%">제품명</th>
						<th style="width: 20%">거래처명</th>
						<th style="width: 7%">입고수량</th>
						<th style="width: 10%">원가</th>
						<th style="width: 10%">소비자판매가</th>
						<th style="width: 10%">첫 입고일</th>
						<th style="width: 10%">마지막입고일</th>
						<th style="width: 7%">재고</th>
						<!-- 첫 등록이니까 재고가 입고수량과 같다 -->
					</tr>
					<tr>
						<td><input type="text" name="proName" autofocus="autofocus"
							placeholder="제품명" size="10" maxlength="100" required="required"></td>
						<td><input type="button" id="search" value="검색"
							onclick='popup()'><input type="text" name="cusName"
							style="width: 60%" placeholder="거래처명" size="10" maxlength="100"
							required="required"></td>
						<td><input type="number" name="proStoring" placeholder="입고수량"
							size="10" maxlength="100" required="required"></td>
						<td><input type="number" name="proCost" placeholder="제품원가"
							size="10" maxlength="100" required="required"></td>
						<td><input type="number" name="proPrice" placeholder="판매가"
							size="10" maxlength="100" required="required"></td>
						<td><input type="date" name="proFirstNal" style="width: 70%"
							placeholder="첫입고일" size="10" maxlength="100" required="required"></td>
						<td><input type="date" name="proLastNal" style="width: 70%"
							placeholder="마지막입고일" size="10" maxlength="100"
							required="required"></td>
						<td><input type="number" name="proStock" placeholder="재고"
							size="10" maxlength="100"></td>
						<!-- <td><input type="number" name="today" placeholder="당일판매" size="10" maxlength="100"></td> -->
					</tr>
				</table>
			</div>
		</form>
		<br> <br>
		<form action="productSearch.pd" method="get">
			<div class="search_area">
				<div class="title_area">
					<a><img src="images/table.svg"> 제품 관리</a>
					<ul style="margin-left: auto; width: fit-content;">
						<li><select name="colum">
								<option value="제품명" selected="selected">제품명</option>
								<option value="거래처명">거래처명</option>
						</select></li>
						<li class="search_box"><input type="text" placeholder="상품 이름"
							name="searchData" autofocus="autofocus" required="required">
							<input type="submit" value="검색"></li>
					</ul>
				</div>
			</div>
		</form>
		<div class="list">
			<table border="1">
				<tr>
					<th style="width: 4%">제품번호</th>
					<th style="width: 7%">제품명</th>
					<th style="width: 5%">원가</th>
					<th style="width: 5%">소비자판매가</th>
					<th style="width: 5%">첫 입고일</th>
					<th style="width: 5%">마지막입고일</th>
					<th style="width: 5%">재고</th>
					<th style="width: 7%">거래처명</th>
					<th style="width: 5%">입고수량</th>
					<%
						
						if (!(empRank == 1 && deptNo == 2 || empRank == 1 && deptNo == 3 || empRank == 2 && deptNo == 3)) { //버튼 세션값에 따라 나타내는거
					%>
					<th style="width: 10%">당일판매량</th>
					<th style="width: 7%">관리</th>
					<%
						}
					%>
				</tr>
				<c:forEach items="${productList }" var="product">
					<tr>
						<td class="num">${product.proNo}</td>
						<td>${product.proName}</td>
						<td style="text-align: right">${product.proPrice} 원</td>
						<td style="text-align: right">${product.proCost} 원</td>
						<td>${product.proFirstNal}</td>
						<td>${product.proLastNal}</td>
						<td id="proStockvalue" style="text-align: right">${product.proStock} 개</td>
						<td>${product.cusName}</td>
						<td style="text-align: right">${product.proStoring} 개</td>
						<%
						
						if (!(empRank == 1 && deptNo == 2 || empRank == 1 && deptNo == 3 || empRank == 2 && deptNo == 3)) { //버튼 세션값에 따라 나타내는거
					%>
						<td>
							<form action="stockUpdate.pd" method="get">
								<input type="hidden" name="num" value="${product.proNo}" >
								<input type="number" name="todayValue" id="todayValue" placeholder="당일판매량" size="10" maxlength="100" required="required"> 
								<input type="submit" value="입력" >
							</form>
						</td>
						<td><a
							href="index.jsp?proNo=${product.proNo}&page=product/productUpdateConfirm"
							id="update" style="color: #366afe;">수정</a> <a
							href="productDelete.pd?proNo=${product.proNo}" id="remove"
							style="color: #D71427;">삭제</a>
						</td>
						<%
						}
						%>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>



