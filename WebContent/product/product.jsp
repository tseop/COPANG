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
		var url = "index.jsp?page=product/customerSearchForm";
		var name = "popup test";
		var option = "width = 1000, height = 600, top = 100, left = 200, location = no"
		window.open(url, name, option);
	}
</script>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/product.css">
<meta charset="UTF-8">
<title>Travel</title>
</head>
<body>
	<div class="wrap">
		<form action="productSearch.pd" method="get">
			<div class="search">
				<ul style="margin-left: auto; width: fit-content;">
					<li class="search_box"><input type="text" placeholder="상품 이름"
						name="searchProName" autofocus="autofocus" required="required"></li>
					<li><input type="submit" value="검색"></li>
				</ul>
			</div>
		</form>
		<form action="productRegister.pd" method="get">
			<img src="images/table.svg"><label class="title"> 제품 등록</label>
			<br>
			<div class="register">
				<input type="submit" value="등록하기">
				<table border="1" cellspacing="0" cellpadding="0">
					<tr>
						<th style="width: 10%">제품번호</th>
						<th style="width: 10%">제품명</th>
						<th style="width: 20%">거래처명</th>
						<th style="width: 7%">입고수량</th>
						<th style="width: 10%">원가</th>
						<th style="width: 10%">소비자판매가</th>
						<th style="width: 10%">첫 입고일</th>
						<th style="width: 10%">마지막입고일</th>
						<th style="width: 7%">재고</th>
						<!-- 첫 등록이니까 재고가 입고수량과 같다 -->
						<!-- <th>당일판매량</th> -->
						<!-- 등록페이지에는 당일판매량은 필요없지 -->
					</tr>
					<tr>
						<td></td>
						<td><input type="text" name="proName" autofocus="autofocus"
							placeholder="제품명" size="10" maxlength="100"></td>
						<td><input type="button" id="search" value="검색"
							onclick='popup()'><input type="text" name="cusName"
							style="width: 60%" placeholder="거래처명" size="10" maxlength="100"></td>
						<td><input type="number" name="proStoring" placeholder="입고수량"
							size="10" maxlength="100"></td>
						<td><input type="number" name="proCost" placeholder="제품원가"
							size="10" maxlength="100"></td>
						<td><input type="number" name="proPrice" placeholder="판매가"
							size="10" maxlength="100"></td>
						<td><input type="date" name="proFirstNal" style="width: 70%"
							placeholder="첫입고일" size="10" maxlength="100"></td>
						<td><input type="date" name="proLastNal" style="width: 70%"
							placeholder="마지막입고일" size="10" maxlength="100"></td>
						<td><input type="number" name="proStock" placeholder="재고"
							size="10" maxlength="100"></td>
						<!-- <td><input type="number" name="today" placeholder="당일판매" size="10" maxlength="100"></td> -->
					</tr>
				</table>
			</div>
		</form>
		<br>
		<br>
		<form action="../productList.pd" method="get">
			<img src="images/table.svg"><h1 class="title">제품 관리</h1>
			<div class="list">
				<div class="move">
					<input type="button" value="검색" onclick='popup()'>
				</div>
				<table border="1" cellspacing="0" cellpadding="0">
					<tr>
						<th style="width: 5%">제품번호</th>
						<th style="width: 10%">제품명</th>
						<th style="width: 7%">원가</th>
						<th style="width: 7%">소비자판매가</th>
						<th style="width: 10%">첫 입고일</th>
						<th style="width: 10%">마지막입고일</th>
						<th style="width: 5%">재고</th>
						<th style="width: 7%">거래처명</th>
						<th style="width: 5%">입고수량</th>
						<th style="width: 5%">당일판매량</th>
						<th style="width: 5%">호잇</th>
					</tr>
					<%
					ArrayList<ProductDTO> productList = (ArrayList<ProductDTO>) request.getAttribute("productList");
						for (int i = 0; i < productList.size() - 1; i++) {
						ProductDTO productDTO = productList.get(i);
					%>
					<%-- <c:forEach items="${productList }" var="product"> --%>
						<tr>
							<td class="num"><%=productDTO.getProNo()%></td>
							<td><%=productDTO.getProName() %></td>
							<td style="text-align: right"><%=productDTO.getProCost() %></td>
							<td style="text-align: right"><%=productDTO.getProPrice() %></td>
							<td><%=productDTO.getProFirstNal() %></td>
							<td><%=productDTO.getProLastNal() %></td>
							<td style="text-align: right"><%=productDTO.getProStock()%></td>
							<td><%=productDTO.getCusName() %></td>
							<td style="text-align: right"><%=productDTO.getProStoring() %></td>
							<td>빈칸</td>
							<td><a href="productDelete.pd?proNo=<%=productDTO.getProNo()%>">삭제</a>
							&nbsp;&nbsp;
							<a href="index.jsp?page=product/productUpdateConfirm?proNo=<%=productDTO.getProNo()%>">수정</a></td>
					<%-- </c:forEach> --%>
					<%
						}
					%>
				</table>
				<input type="button" id="moveMain" value="메인페이지"
					onclick='location.href="index.jsp"'>
			</div>
			<br>
		</form>
	</div>
</body>
</html>



