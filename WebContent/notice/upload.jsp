<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="../FileUpload"
		enctype="multipart/form-data">
		<!-- enctype="multipart/form-data" -->
		<hr>
		<ul>
			<li><label for="첨부파일">첨부파일</label> <input type="file"
				name="file"></li>
		</ul>
		<ul class="btns">
			<li><input type="submit" value="글쓰기"></li>
			<li><input type="button" value="취소" onClick="goBack()"></li>
		</ul>
	</form>
</body>
</html>