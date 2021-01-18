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
.register, .list {
	margin: 0px 10px;
	padding: 0px 0px;
	text-align: center;
	/*   background:#f00;  */
}
.move {
	padding: 20px 30px;
	float: center;
}

input[type="button"] {
	width: 10%;
	height: 30px;
	background: skyblue;
	border-radius: 5px;
	/*  width: 140px; */
	font-family: "맑은 고딕";
	margin-top: 20px;
	
}

input[type="submit"] {
	width: 10%;
	height: 30px;
	background: skyblue;
	border-radius: 5px;
	/*  width: 140px; */
	font-family: "맑은 고딕";
	margin-top: 20px;
}


table {
	border: 1px solid black;
	border-collapse: collapse;
}

th {
	/* border: 1px bold black; */
	border: 1px solid #444444;
	border-collapse: collapse;
	font-weight: 500px;
	width: 300px;
	 padding: 10px;
}

td {
	border: 1px solid #444444;
	text-align: center;
	width: 4000px;
	 padding: 10px;
}
</style>
<meta charset="UTF-8">
<title>Travel</title>
</head>
<body>
	<%
	ArrayList<ProductDTO> productList = (ArrayList<ProductDTO>) request.getAttribute("productList");
	for (int i = 0; i < productList.size(); i++) {
		ProductDTO productDTO = productList.get(i);
	%>
	<form action="productRegister.pd" method="get">
		<br><h1 class="title">제품등록</h1><br><br>
		<div class="register">
			<table border="1" cellspacing="0" cellpadding="0">
				<tr>
					<th>제품번호</th> 
					<th>제품명</th>
					<th>거래처명</th>
					<th>입고수량</th>
					<th>원가</th>
					<th>소비자판매가</th>
					<th>첫 입고일</th>
					<th>마지막입고일</th>
					<th>재고</th>			<!-- 첫 등록이니까 재고가 입고수량과 같다 -->
					<!-- <th>당일판매량</th> -->
					<!-- 등록페이지에는 당일판매량은 필요없지 -->
				</tr>
				<tr>
					<td><input type="number" name="proNo" autofocus="autofocus" size="10" maxlength="100" readonly="readonly"></td>
					<td><input type="text" name="proName" autofocus="autofocus" placeholder="제품명" size="10" maxlength="100"></td>
					<td>
					<input type="button" value="검색" onclick='location.href="index.jsp?page=customer/customerSearch"'>
					<input type="text" name="cusName" placeholder="거래처명" size="10" maxlength="100">
					</td>
					<td><input type="number" name="proStoring" placeholder="입고수량" size="10" maxlength="100"></td>
					<td><input type="number" name="proCost" placeholder="제품원가" size="10" maxlength="100"></td>
					<td><input type="number" name="proPrice" placeholder="판매가" size="10" maxlength="100"></td>
					<td><input type="date" name="proFirstNal" placeholder="첫입고일" size="10" maxlength="100"></td>
					<td><input type="date" name="proLastNal" placeholder="마지막입고일" size="10" maxlength="100"></td>
					<td><input type="number" name="proStock" placeholder="재고" size="10" maxlength="100"></td>
					<!-- <td><input type="number" name="today" placeholder="당일판매" size="10" maxlength="100"></td> -->
				</tr>

			</table>
			<div class="move">
				<br> <input type="submit" value="등록하기">
				<!-- <a href="student.jsp"></a> <a href="studentList.jsp"></a> -->
			</div>
		</div>
	</form>
	<br><br>
	<form action="../productList.pd" method="get">
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
					<th>거래처코</th>
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
						<td><a href="productDelete.pd?proNo=<%=productDTO.getProNo()%>">삭제</a></td>
					</tr>
				</c:forEach>
				<%
					}
				%>
			</table>
		</div>
		<br>
		<div class="move">
			<!-- <input type="button" value="등록" onclick='location.href="index.jsp?page=product/productRegisterForm"'> -->
			<input type="button" value="수정" onclick='location.href="index.jsp?page=product/productSearchForm"'>
			<input type="button" value="검색" onclick='location.href="index.jsp?page=product/productUpdateForm"'>
			<input type="button" value="메인페이지" onclick='location.href="index.jsp"'>
		</div>

	</form>

</body>
</html>