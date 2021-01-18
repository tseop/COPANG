<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KHJSP</title>
</head>
<body>
<div id="pwFind">
	<form action="pwFind.ep" method="get">
		<label for="no">사원번호를 입력하세요</label>
        <input type="text" name="no" size="20"maxlength="10" autofocus="autofocus" required="required" placeholder="사원번호를 입력하세요">
        <input type="submit" value="비밀번호찾기">
	</form>
</div>
</body>
</html>