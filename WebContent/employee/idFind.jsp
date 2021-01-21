<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원번호찾기</title>
<link rel="stylesheet" type="text/css" href="../css/reset.css">
<link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body style="height: 0;">
<div class="wrap_popup">
<ul style="padding-top: 1rem;"><li><img src="../images/Copang_logo.png"></li>
<li>사원번호 찾기</li></ul>
<hr>
<div class="popup">
	<form action="../idFind.ep" method="get">
		<ul>
			<li><label for="security">주민등록번호를 입력하세요</label></li>
			<li><input type="text" name="c1" autofocus="autofocus" required="required" size="10" maxlength="6" class="security_no"> - <input type="password" name="c2" required="required" size="10" maxlength="7" class="security_no"></li>
			<li><input type="submit" value="사원번호찾기"></li>
		</ul>  
	</form>
</div>
</div>
</body>
</html>