<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
#login{
	 position: absolute;
   width: 800px;
   height: 400px;
   top: 200px;
   left: 600px;
   background-color: aqua;
}
</style>
<script>
function inNumber(){    //사원번호 숫자만입력
    if(event.keyCode < 48 || event.keyCode > 57){
       event.returnValue = false;
    }   
 }
</script>
<meta charset="UTF-8">
<title>COPANG</title>
</head>
<body>
	<form action="login.ep" method="post">
		<div id="login">
			<ul>
				<li>
					<label for="no">사원번호</label>
					<input type="text" name="no" onkeypress="inNumber()" size="20" maxlength="10"
						autofocus="autofocus" required="required" placeholder="사원번호를 입력하세요">
				</li>
				<li>
					<label for="pw">비밀번호</label> 
					<input type="password" name="pw" id="pw" size="20" required="required"
					 maxlength="10" placeholder="비밀번호 입력"><br>
				</li>
				<input type="submit" value="로그인">
				<button type="button" onclick="location.href='index.jsp?page=employee/idFind'">사원번호찾기</button>
				<button type="button" onclick="location.href='index.jsp?page=employee/pwFind'">비밀번호찾기</button>
			</ul>
		</div>
	</form>
</body>
</html>