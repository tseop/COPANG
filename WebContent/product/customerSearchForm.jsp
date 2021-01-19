<%@page import="product.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.search_area ul{
	margin:2rem 2rem;
	text-decoration: none;
}
.search_box{
border:1px solid #ccc;
}

.wrap {
	padding: 2rem;
	min-height: 30rem;
	font-size: 1.1rem;
	min-width: 40rem;
	margin: 0 2rem 2rem 2rem;
}

.wrap img {
	width: 20px;
	height: 20px;
	margin: 20px 0 0 0;
}

.wrap label{
font-size: 30px;
}

</style>
<meta charset="UTF-8">
<title>COPANG</title>

</head>
<body>
<div class="wrap">
<form action="customerSearch.cu" method="get">
	<div class="search_area">
		<img src="images/table.svg"><label class="title">   거래처 검색</label> <br>
		<ul style="margin-left: auto; width: fit-content;">
			<li class="search_box">
				<input type="text" placeholder="거래처 이름" name="searchCusName" autofocus="autofocus" required="required"> 
				<input type="submit" value="검색">
			</li>
		</ul>
	</div>
</form>
	</div>
</body>
</html>