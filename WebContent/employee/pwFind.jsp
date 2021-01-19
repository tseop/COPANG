<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script>
function inNumber(){    //사원번호 숫자만입력
    if(event.keyCode < 48 || event.keyCode > 57){
       event.returnValue = false;
    }   
 }
 
</script>
<meta charset="UTF-8">
<title>KHJSP</title>
<link rel="stylesheet" type="text/css" href="../css/reset.css">
<link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body style="height: 0;">
<div class="wrap_popup">
<ul style="padding-top: 1rem;"><li><img src="../images/Copang_logo.png"></li>
<li>비밀번호 찾기</li></ul>
<hr>
<div id="pwFind" class="popup">
	<form action="../pwFind.ep" method="get">
		<ul>
			<li><label for="no">사원번호를 입력하세요</label></li>
			<li style="border: 1px solid #ccc;"><input type="text" name="no" onkeypress = "inNumber()" size="20"maxlength="10" autofocus="autofocus" required="required" placeholder="사원번호를 입력하세요" class="emp_no">
				<input type="submit" value="비밀번호찾기"></li>
		</ul>
	</form>
</div>
</div>
</body>
</html>