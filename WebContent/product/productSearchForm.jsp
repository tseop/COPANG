<%@page import="product.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COPANG</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<div class="table">	
<form action="productSearch.pd" method="get">
		<ul style="margin-left: auto; width: fit-content;">
			<li class="search_box">
			<input type="text" placeholder="상품 이름" name="proSearchName" autofocus="autofocus" required="required"> 
			<input type="submit" value="검색">
			</li>
		</ul>
	</form>
</div>
</body>
</html>