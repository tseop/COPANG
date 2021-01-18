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

<meta charset="UTF-8">
<title>Travel</title>
</head>
<body>
<%
	String productSearch = request.getParameter("proSearchName");
	ArrayList<ProductDTO> productSearchList = (ArrayList<ProductDTO>) request.getAttribute("productSearchList");
	if (productSearchList.size() == 0) {
%>	 
<h3>검색 결과가 없습니다..</h3>
<div class="search_area">
<%} else {%>
	<hr>
	<table border="1" cellspacing="0" cellpadding="0">
		<tr>
			<th>제품번호</th>
			<th>제품명</th>
			<th>원가</th>
			<th>소비자판매가</th>
			<th>첫 입고일</th>
			<th>마지막입고일</th>
			<th>재고</th>
			<th>거래처명</th>
			<th>입고수량</th>
			<th>당일판매량</th>
		</tr>
		<%
			for (int i = 0; i < productSearchList.size(); i++) {
				ProductDTO productDTO = productSearchList.get(i);
		%>
		<tr>
			<td><%=productDTO.getProNo()%></td>
			<td><%=productDTO.getProName()%></td>
			<td><%=productDTO.getProCost()%></td>
			<td><%=productDTO.getProPrice()%></td>
			<td><%=productDTO.getProFirstNal()%></td>
			<td><%=productDTO.getProLastNal()%></td>
			<td><%=productDTO.getProStock()%></td>
			<td><%=productDTO.getCusName()%></td>
			<td><%=productDTO.getProStoring()%></td>
			<td>빈칸</td>
		</tr>
		<% }} %>
	</table>
</body>
</html>


