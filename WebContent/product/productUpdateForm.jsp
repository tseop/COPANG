<%@page import="product.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/product.css?v=45">
<meta charset="UTF-8">
<title>Product</title>
</head>
<body>
<%
	int proNo = Integer.parseInt((request.getParameter("proNo")));
%>
<div class="wrap">
	<form action="productUpdate.pd" method="get">
	<input type="hidden" name = "proNo" value="<%= proNo%>">
		<div class="title_area">
				<a><img src="images/table.svg"> 제품 수정</a> 
				<input type="submit" value="수정하기">
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
	</div>
</body>
</html>