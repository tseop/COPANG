<%@page import="product.ProductDTO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <jsp:useBean id="productSearch" class="product.ProductDAO" scope="page" /> --%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.list table {
	width: 100%;
	/* table-layout:fixed; */
	border: 1px solid #444444;
	margin: 0px 10px;
}
.list th {
	/* border: 1px bold black; */
	background-color: #DEDEDE;
	border: 1px solid black;
	border-collapse: collapse;
	font-weight: 500px;
	width: 100px;
	padding: 10px;
	font-size: 15px;
}
.list td {
	background-color: #F7F6F4;
	border: 1px solid #444444;
	text-align: center;
	font-size: 12px;
	padding: 10px;
}

.wrap {
	padding: 2rem;
	min-height: 30rem;
	font-size: 1.1rem;
	min-width: 40rem;
	margin: 0 2rem 2rem 2rem;
}

.wrap img {
	width: 20px;
	height: 20px;
	margin: 20px 0 0 0;
}

</style>
<meta charset="UTF-8">
<title>Travel</title>
</head>
<body>
<div class="wrap">
	<%
		/* String productSearch = request.getParameter("proSearchName"); */
		ArrayList<ProductDTO> productSearchList = (ArrayList<ProductDTO>) request.getAttribute("productSearchList");
		if (productSearchList.size() == 0) {
	%>
	<h3>데이터가 존재하지 않습니다</h3>
	<%} else {%>
	<div class="list">
		<img src="images/table.svg"><label class="title">  검색 결과</label><br> <br>
		<table border="1" cellspacing="0" cellpadding="0">
			<tr>
				<th style="width: 5%">제품번호</th>
				<th style="width: 10%">제품명</th>
				<th style="width: 10%">거래처명</th>
				<th style="width: 7%">입고수량</th>
				<th style="width: 7%">원가</th>
				<th style="width: 7%">소비자판매가</th>
				<th style="width: 10%">첫 입고일</th>
				<th style="width: 10%">마지막입고일</th>
				<th style="width: 5%">재고</th>
				<th style="width: 5%">당일판매량</th>
			</tr>
			<%
				for (int i = 0; i < productSearchList.size(); i++) {
				ProductDTO productDTO = productSearchList.get(i);
			%>
			<tr>
				<td><%=productDTO.getProNo()%></td>
				<td><%=productDTO.getProName()%></td>
				<td><%=productDTO.getCusName()%></td>
				<td><%=productDTO.getProStoring()%></td>
				<td><%=productDTO.getProCost()%></td>
				<td><%=productDTO.getProPrice()%></td>
				<td><%=productDTO.getProFirstNal()%></td>
				<td><%=productDTO.getProLastNal()%></td>
				<td><%=productDTO.getProStock()%></td>
				<td>빈칸</td>
			</tr>
			<%
				}
			}
			%>
		</table>
		<br><br>
		<input type="submit" value="다시검색하기" onclick='history.go(-1)'>
	</div>
	</div>
</body>
</html>


