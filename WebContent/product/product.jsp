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
<style type="text/css">
select {
	width: 100px;
	height: 40px;
	float: left;
	padding: .8em .5em;
	border: 1px solid #ccc;
	border-right: none;
	font-family: inherit;
	background: url('arrow.jpg') no-repeat 95% 50%;
	border-radius: 0px;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	padding: .8em .5em;
}

#search {
	border: 1px solid black;
	background: #DEDEDE;;
	color: black;
}

#remove, #update {
	font-size: 12px;
}

.list input[type=submit] {
	width: 30%; 
	height: 20px; 
	border: 1px solid black;
	background: #DEDEDE;;
	color: black;
	padding: 10px;
	font-size: 12px; 
	margin: 0px 0px;
}

.list input[type=number]{
	width: 50% 
}

.wrap .box {
	margin: 1rem 0;
}

.wrap a {
	font-size: 1rem;
	font-weight: 700;
	padding: 5px;
}

.title_area {
	display: flex;
	justify-content: space-between;
	line-height: 30px;
	font-size: 1rem;
}

.register, .list {
	margin: 1rem 0;
}

.title_area input[type=submit] {
	border: none;
	background: #366afe;
	color: white;
	padding: 0.5rem 1rem;
	font-size: 0.7rem;
	font-weight: 700;
}

.wrap table td a {
	color: black;
	text-decoration: none;
	padding: 0 3px;
}

.wrap table td a:hover {
	text-decoration: underline;
}
</style>
<script>
	function popup() {
		var url = "product/customerSearchForm.jsp";
		var name = "popup test";
		var option = "width = 1000, height = 600, top = 100, left = 200, location = no"
		window.open(url, name, option);
	}

	/* function result() {

		var data1 = document.getElementById('todayValue').value;
		document.getElementById('proStockvalue').innerText = data1;
		/* history.go(0); */
		/* window.location.reload(0);*/
/*	} */
/* 
	function stockmove() {
		location.href = "../stockUpdate.pd";
	} */
</script>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/product.css?v=3">
<meta charset="UTF-8">
<title>COPANG</title>
</head>
<body>
	<div class="wrap">

		<form action="productRegister.pd" method="get">
			<div class="title_area">
				<a><img src="images/table.svg"> 제품 등록</a> <input type="submit"
					value="등록하기">
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
					<th style="width: 10%">당일판매량</th>
					<th style="width: 7%">관리</th>
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
						<td>
							<form action="stockUpdate.pd" method="get">
								<input type="hidden" name="num" value="${product.proNo}" >
								<input type="number" name="todayValue" id="todayValue" placeholder="당일판매량" size="10" maxlength="100" required="required"> 
								<input type="submit" value="입력" >
							</form>
						</td>
						<td><a
							href="index.jsp?proNo=${product.proNo}&page=product/productUpdateConfirm"
							id="update" style="color: blue">수정</a> <a
							href="productDelete.pd?proNo=${product.proNo}" id="remove"
							style="color: red">삭제</a></td>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>



