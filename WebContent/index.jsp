<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COPANG</title>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/style.css?v=12">
<script>
function inNumber(){    //사원번호 숫자만입력
    if(event.keyCode < 48 || event.keyCode > 57){
       event.returnValue = false;
    }   
 }
</script>
</head>
<body>
<div class="box">
	<form action="Login" method="post">
		<img alt="logo" src="images/Copang_logo.png">
	<table class="login">
		<tr>
			<td><label for="ID">사원번호<img src="images/id.png"></label></td>
			<td style="border-left: 1px solid #ccc;"><input  onkeypress="inNumber()" autofocus="autofocus" type="text" name="EMP_NO" required="required" placeholder="아이디(사원번호)">
			</td>
		</tr>
		<tr style="border: none;">
			<td colspan="2" class="ID_MESG"></td>
		</tr>
		</table>
	<table class="login">
		<tr>
			<td><label for="PWD">비밀번호<img src="images/pw.png"></label></td>
			<td style="border-left: 1px solid #ccc;"><input type="password" name="EMP_PW" required="required" placeholder="비밀번호"></td>
		</tr>
		<tr style=" border: none;">
			<td colspan="2" class="PWD_MESG"></td>
		</tr>
	</table>
		<div class="link">
			<p><a href='index.jsp?page=employee/idFind'>사원번호찾기</a>&emsp;
			<a href='index.jsp?page=employee/pwFind'>비밀번호찾기</a></p>
			<input type="submit" value="로그인"><br>
		</div>
	</form>
	<hr>
	<p>©Copang Corp. All rights reserved.</p>
</div>
</body>
</html>