<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
#empdeleteForm{
	position: absolute;
	top:300px;
	left:800px;
	width:400px;
	border:1px solid orange;
}
ul{list-style-type:none;}
.submit{
   width:100px; height:60px;
}
.reset{
	font-size: 20px;
}

</style>
<meta charset="UTF-8">
<title>KHJSP</title>
</head>
<body>
<div id ="empdeleteForm">
<form action = "empDelete.ep" method = "get">
<ul>
	<li><label for = "패스워드">패스워드</label>
		<input type ="password" name="pw" required = "required" autofocus="autofocus" placeholder="비밀번호입력">	
	</li>
	<input type = "image" src = "images/submit.jpg" class = "submit">
</ul>
</form>
</div>
</body>
</html>