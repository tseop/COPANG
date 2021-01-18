<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COPANG</title>
</head>
<body>
<div class="container">
	<div class="row">
	<form method="post" action="noticeRegister.no">
	<table style="text-align: center; border: 1px solid #dddddd">
		<thead>
			<tr>
				<th colspan="2" style="background-color:#eeeeee; text-align: center;">공지사항 글쓰기</th>			
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type="text" class="form-control" placeholder="글 제목" name="notiTitle" maxlength="50"></td>
			</tr>
			<tr>	
				<td><textarea class="form-control" placeholder="글 내용" name="notiContent" maxlength="2048" style="height: 350px;"></textarea></td>
			</tr>
		</tbody>
		</table>
		<input type="submit" value="글쓰기">
		<input type="reset" value="취소">
		</form>
</div>	
</div>
</body>
</html>