<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COPANG</title>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/style.css?v=210122">
<script>
function inNumber(){    //사원번호 숫자만입력
    if(event.keyCode < 48 || event.keyCode > 57){
       event.returnValue = false;
    }   
 }
 function idPopupOpen(){
	 window.open("employee/idFind.jsp","사원번호찾기","width=500,height=300","top=200px,left=500px");
 }
 function pwPopupOpen(){
	 window.open("employee/pwFind.jsp","비밀번호찾기","width=500,height=300","top=200,left=500");
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
			<td style="border-left: 1px solid #ccc;"><input  onkeypress="inNumber()" maxlength="8" autofocus="autofocus" type="text" name="EMP_NO" required="required" placeholder="아이디(사원번호)">
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
			<p><input type="submit" value="로그인"></p>
         <a href=""onclick="idPopupOpen()" style="cursor:hand;">사원번호찾기</a>&emsp;
         <a href=""onclick="pwPopupOpen()" style="cursor:hand;">비밀번호찾기</a>
		</div>
	</form>
	<hr>
	<p>©Copang Corp. All rights reserved.</p>
</div>
</body>
</html>
