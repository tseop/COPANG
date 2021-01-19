<%@page import="product.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KHJSP</title>
<script>
function back(){    //사원번호 숫자만입력
	window.close();
 }
function cuslist(){    //사원번호 숫자만입력
	location.href="../customerList.cu";
 }
</script>
<link rel="stylesheet" type="text/css" href="../css/reset.css">
<link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body style="height: 0;">
<div class="wrap_popup">
<ul>
<li><img src="../images/Copang_logo.png"></li>
<li>거래처 찾기</li>
</ul>
<hr>
<div id="customerFind" class="popup">
	<form action="../customerSearch.pd" method="get">
		<ul>
			<li>
				<label for="searchCusName">거래처 정보를 찾기위한 페이지입니다</label>
			</li>
			<li style="border: 1px solid #ccc;">
			<input type="text" name="searchCusName" size="20"maxlength="10" autofocus="autofocus" required="required" placeholder="거래처명을 입력하세요" class="emp_no">
			<input type="submit" value="거래처찾기">
			</li>
			<li>
			<input type="submit" value="거래처 전체리스트" onclick="cuslist()">
			<input type="submit" value="돌아가기" onclick="back()">
			</li>
		</ul>
	</form>
</div>
</div>
</body>
</html>