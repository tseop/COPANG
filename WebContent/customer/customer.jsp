<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<li class="search_box"><input type="text" placeholder="거래처 이름" name="searchCusName" autofocus="autofocus" required="required"> 
			<input type="submit" value="검색"></li>
		</ul>
	</form>
	</div>
<hr>
	<table>
		<tr>
			<th style="width: 10%;">번호</th>
			<th style="width: 25%;">이름</th>
			<th style="width: 15%;">담당자</th>
			<th style="width: 25%;">전화번호</th>
			<th style="width: 25%;">사업자번호</th>
		</tr>
  		<c:forEach items="${list }" var="customer">
		  <tr>
		  <td class="num">${customer.cusNo}</td>
		     <td>${customer.cusName}</td>
		     <td>${customer.cusManager}</td>
		     <td>${customer.cusTel}</td>
		     <td>${customer.businessNo}</td>
		  </tr>
   		</c:forEach>
	  <tr>
	      <td colspan="5" style="border: 1px solid white; padding-top: 2rem;"><jsp:include page="page.jsp" flush="true"/></td>
	  </tr>
	</table>
<div class="search_area">
	<ul>
		<li><input type="button" value="거래처 등록" onClick="location.href='index.jsp?page=customer/customerRegister'"></li>
		<li><input type="button" value="거래처 수정" onClick="location.href='customer/customerUpdate.jsp'"></li>
	</ul>
</div>
</div>
</div>
</body>
</html>