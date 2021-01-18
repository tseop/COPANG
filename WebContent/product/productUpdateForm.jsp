<%@page import="product.ProductDTO"%>
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
	float: right;
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
<title>Product</title>
</head>
<body>
<%
	int proNo = Integer.parseInt((request.getParameter("proNo")));
%>
	<form action="productUpdate.pd" method="get">
	<input type="hidden" name = "proNo" value="<%= proNo%>">
		<div id="wrap">
			<h1 class="title">&nbsp;&nbsp;제품 수정</h1>
			<div class="form">
				<div class="form2">
				<table border="1" cellspacing="0" cellpadding="0">
							<tr>
								<th>제품명</th>
								<th>거래처명</th>
								<th>입고수량</th>
								<th>원가</th>
								<th>소비자판매가</th>
								<th>첫 입고일</th>
								<th>마지막입고일</th>
								<th>재고</th>
							</tr>
							<tr>
								<td><input type="text" name="proName" required="required" autofocus="autofocus" placeholder="제품명" size="10" maxlength="100"></td>
								<td><input type="text" name="cusName" required="required" placeholder="거래처명" size="10" maxlength="100"></td>
								<td><input type="number" name="proStoring" required="required" placeholder="입고수량" size="10" maxlength="100"></td>
								<td><input type="number" name="proCost" required="required" placeholder="제품원가" size="10" maxlength="100"></td>
								<td><input type="number" name="proPrice" required="required" placeholder="판매가" size="10" maxlength="100"></td>
								<td><input type="date" name="proFirstNal" required="required" placeholder="첫입고일" size="10" maxlength="100"></td>
								<td><input type="date" name="proLastNal" required="required" placeholder="마지막입고일" size="10" maxlength="100"></td>
								<td><input type="number" name="proStock" required="required" placeholder="재고" size="10" maxlength="100"></td>
							</tr>
							
						</table>
					<div class="clear"></div>
					<div class="form4"><br><br>
						<input type="submit" value="수정하기">
						<!-- <a href="student.jsp"></a> <a href="studentList.jsp"></a> -->
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html></body>
</html>