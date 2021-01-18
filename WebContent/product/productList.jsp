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
<style>
body {
	font-size: 15px;
}

.list {
	margin: 0px 10px;
	padding: 0px 0px;
	text-align: center;
	/*   background:#f00;  */
}


input[type="submit"] {
	
}

input[type="button"] {
	
}

table {
	border: 1px solid black;
	border-collapse: collapse;
}

th {
	border: 1px bold black;
	border-collapse: collapse;
	font-weight: 500px;
	width: 300px
}

td {
	text-align: center;
	width: 4000px;
}
</style>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<meta charset="UTF-8">
<title>Travel</title>
</head>
<body>
	<%
		ArrayList<ProductDTO> productList = (ArrayList<ProductDTO>) request.getAttribute("productList");
	for (int i = 0; i < productList.size(); i++) {
		ProductDTO productDTO = productList.get(i);
		//boardDTO.setNo(no);

		/* ProductDTO productDTO = (ProductDTO) request.getAttribute("productDTO"); */
	%>
	<form action="index.jsp" method="get">
		<h1 class="title">제품관리</h1>
		<div class="list">
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
					<th>호잇</th>
				</tr>
				<c:forEach items="${productList }" var="product">
					<tr>
						<td class="num">${product.proNo}</td>
						<td>${product.proName}</td>
						<td>${product.proPrice}</td>
						<td>${product.proCost}</td>
						<td>${product.proFirstNal}</td>
						<td>${product.proLastNal}</td>
						<td>${product.proStock}</td>
						<td>${product.cusName}</td>
						<td>${product.proStoring}</td>
						<td>빈칸</td>
						<td><a
							href="productDelete.pd?proNo=<%=productDTO.getProNo()%>">삭제</a></td>
					</tr>
				</c:forEach>
				<%
					}
				%>
				<%-- <tr>		
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
					<td><a href="productDelete.pd?proNo=<%=productDTO.getProNo()%>">삭제</a></td>
				</tr> --%>

			</table>
		</div>
		<div class="form4">
			<!-- <input type="button" value="등록" onclick='location.href="index.jsp?page=product/productRegisterForm"'> -->
			<input type="button" value="수정"
				onclick='location.href="index.jsp?page=product/productSearchForm"'>
			<input type="button" value="검색"
				onclick='location.href="index.jsp?page=product/productUpdateForm"'>
			<input type="button" value="메인페이지"
				onclick='location.href="index.jsp"'>
			<!-- <a href="student.jsp"></a> <a href="studentList.jsp"></a> -->
		</div>
		</div>
	</form>

</body>
</html>