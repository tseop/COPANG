<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COPANG</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<div class="customer">
		<div class="table">
			<div class="search_area">
				<form action="customerSearch.cu" method="get">
					<h1>거래처 목록</h1>
					<ul style="margin-left: auto; width: fit-content;">
						<li class="search_box"><input type="text"
							placeholder="거래처 이름" name="searchCusName" autofocus="autofocus"
							required="required"> <input type="submit" value="검색"></li>
					</ul>
				</form>
			</div>
			<hr>
			<table>
				<thead>
					<tr>
						<th style="width: 10%;">번호</th>
						<th style="width: 25%;">이름</th>
						<th style="width: 15%;">담당자</th>
					</tr>
				</thead>
				<c:forEach items="${list }" var="customer">
					<tr>
						<td class="num">${customer.cusNo}</td>
						<td><a href='customerDetails.cu?num=${customer.cusNo}'
							style="color: black; text-decoration: none;"
							onmouseover="this.style.color='#0074E9'"
							onmouseout="this.style.color='black'"> ${customer.cusName}</a></td>
						<td>${customer.cusManager}</td>
					</tr>
				</c:forEach>
				<tfoot>
					<tr>
						<td colspan="5"
							style="border: 1px solid white; padding-top: 2rem;"><jsp:include
								page="page.jsp" flush="true" /></td>
					</tr>
				</tfoot>
			</table>
			<div class="search_area">
				<ul>
					<%
						int empRank = (int) session.getAttribute("EMP_RANK");
						int deptNo = (int) session.getAttribute("EMP_DEPT");
						if (empRank == 2 && deptNo == 2 || empRank == 2 && deptNo == 1 || empRank == 4) { //버튼 세션값에 따라 나타내는거
					%>
					<li><input type="button" value="거래처 등록"
						onClick="location.href='index.jsp?page=customer/customerRegister'"></li>
					<%
						}
					%>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>