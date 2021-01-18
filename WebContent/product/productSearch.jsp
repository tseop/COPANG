<%@page import="product.ProductDTO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="boardSearch" class="product.ProductDAO" scope="page" />
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Travel</title>
</head>
<body>

	<%
		ProductDTO productDTO = (ProductDTO) request.getAttribute("productDTO");
	/* boardSearch.boardReadcount(boardDTO); */
	%>
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
	</table>
</body>
</html>