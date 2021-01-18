
<%@page import="product.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
	font-size: 15px;
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
<meta charset="UTF-8">
<title>Travel</title>
</head>
<body>
	<form action="../productList.pd" method="get">
		<h1 class="title">제품등록</h1>
		<div class="form2">
			<table border="1" cellspacing="0" cellpadding="0">
				<tr>
					<!-- <th>제품번호</th> -->
					<th>제품명</th>
					<th>거래처명</th>
					<th>입고수량</th>
					<th>원가</th>
					<th>소비자판매가</th>
					<th>첫 입고일</th>
					<th>마지막입고일</th>
					<th>재고</th> 
					<!-- 첫 등록이니까 재고가 입고수량과 같다 -->
					<!-- <th>당일판매량</th> -->
					<!-- 등록페이지에는 당일판매량은 필요없지 -->
				</tr>
				<tr>
					<!-- <td><input type="number" name="proNo" autofocus="autofocus" size="10" maxlength="100"></td> -->
					<td><input type="text" name="proName" autofocus="autofocus"
						placeholder="제품명" size="10" maxlength="100"></td>
					<td><input type="text" name="cusName" placeholder="거래처명"
						size="10" maxlength="100"></td>
					<td><input type="number" name="proStoring" placeholder="입고수량"
						size="10" maxlength="100"></td>
					<td><input type="number" name="proCost" placeholder="제품원가"
						size="10" maxlength="100"></td>
					<td><input type="number" name="proPrice" placeholder="판매가"
						size="10" maxlength="100"></td>
					<td><input type="date" name="proFirstNal" placeholder="첫입고일"
						size="10" maxlength="100"></td>
					<td><input type="date" name="proLastNal" placeholder="마지막입고일"
						size="10" maxlength="100"></td>
					<td><input type="number" name="proStock" placeholder="재고"
						size="10" maxlength="100"></td>
					<!-- <td><input type="number" name="today" placeholder="당일판매" size="10" maxlength="100"></td> -->
				</tr>

			</table>
			<div class="clear"></div>
			<div class="form4">
				<br> <input type="submit" value="등록하기">
				<!-- <a href="student.jsp"></a> <a href="studentList.jsp"></a> -->
			</div>
		</div>
	</form>
	<form action="../productList.pd" method="get">
		<h1 class="title">제품관리</h1>
		<div class="form3">
			<%
				ProductDTO productDTO = (ProductDTO) request.getAttribute("productDTO");
			/* boardView.boardReadCount(boardDTO); */
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
					<th>호잇</th>
				</tr>
				<tr>	<!-- 임시 -->
					<th>0</th>
					<th>제품명</th>
					<th>22</th>
					<th>333</th>
					<th>44</th>
					<th>55</th>
					<th>3</th>
					<th>거래처명</th>
					<th>100</th>
					<th>0</th>
					<th>호잇</th>
				</tr>		<!-- 임시 -->
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
		<br>
		<div class="form4">
			<!-- <input type="button" value="등록" onclick='location.href="index.jsp?page=product/productRegisterForm"'> -->
			<input type="button" value="수정"
				onclick='location.href="index.jsp?page=board/boardSearchForm"'>
			<input type="button" value="검색"
				onclick='location.href="index.jsp?page=board/boardUpdateForm"'>
			<input type="button" value="삭제"
				onclick='location.href="index.jsp?page=board/boardDeleteForm"'>
			<input type="button" value="메인페이지"
				onclick='location.href="index.jsp"'>
			<!-- <a href="student.jsp"></a> <a href="studentList.jsp"></a> -->
		</div>

	</form>

</body>
</html>