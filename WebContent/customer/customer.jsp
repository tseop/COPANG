<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COPANG</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<style type="text/css">
#link a{color:pink; text-decoration: none;}
</style>
</head>
<body>
<h1>거래처 목록</h1>
<div class="form">
	<table border="1">
		<tr>
			<th style="width: 10%;">번호</th>
			<th>이름</th>
			<th>담당자</th>
			<th>전화번호</th>
			<th>사업자번호</th>
		</tr>
  		<c:forEach items="${list }" var="customer">
		  <tr>
		  <td><c:out value="${customer.cusNo}"/></td>
		     <td><c:out value="${customer.cusName}"/></td>
		     <td><c:out value="${customer.cusManager}"/></td>
		     <td><c:out value="${customer.cusTel}"/></td>
		     <td><c:out value="${customer.cusBusinessNo}"/></td>
		    <%--  <td><a href="customerDelete.cu?no=${customer.cusNo }">삭제</a></td> --%>
		  </tr>
   		</c:forEach>
	  <%-- <tr border="0">
	      <td colspan="7"><jsp:include page="page.jsp" flush="true"/></td>
	  </tr> --%>
	</table>
</div>
<div id="link">
	<a href="index.jsp?page=#">추가</a>&emsp;
	<a href="index.jsp?page=#">검색</a>&emsp;
	<a href="index.jsp?page=#">수정</a>
</div>
</body>

</html>