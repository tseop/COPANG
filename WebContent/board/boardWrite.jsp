<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
li {
	list-style-type: none;
}
</style>
<meta charset="UTF-8">
<title>KHJSP</title>
</head>
<body>
	<h1>게시글 쓰기</h1>

	<form action="../boardRegister.bo" method="get">
		<ul>
			<li><input type="hidden" name="readcount" value="0"></li>
			<li><input type="text" name="title" autofocus="autofocus"
				required="required" placeholder="제목을 입력하세요" size="50"
				mexlength="100"></li>
			<li><textarea rows="20" cols="60" name="content"
					placeholder="내용을 입력하세요"></textarea></li>
			<li><input type="submit"><input type="button" value="취소"
				onClick="location.href='../board.jsp'"></li>
		</ul>
	</form>
</body>
</html>