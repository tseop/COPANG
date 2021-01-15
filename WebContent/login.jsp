<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COPANG</title>
</head>
<body>
	<form action="Login" method="post">
		<div>
			<ul>
				<li><label for="ID">사 원 번 호</label></li>
				<input type="text" name="EMP_NO" required="required">
				<br>
				<li><label for="PWD">비 밀 번 호</label></li>
				<input type="password" name="EMP_PW" required="required">
				<br>
			</ul>
		</div>
		<div>
			<input type="submit" value="로그인">
		</div>
	</form>
</body>
</html>