<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KHJSP</title>
</head>
<body>
<div id="idFind">
	<form action="idFind.ep" method="get">
		<label for="security">주민등록번호를 입력하세요</label>
        <input type="text" name="c1" required="required" size="10" maxlength="6"> - <input type="password" name="c2" required="required" size="10" maxlength="7">
        <input type="submit" value="사원번호찾기">
	</form>
</div>
</body>
</html>