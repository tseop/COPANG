<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>

<html>
<head>
<script src="https://cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>
<script type="text/javascript">
<!--뒤로가기기능-->
	function goBack() {
		window.history.back();
	}
</script>

<style>
.titleandfile{display: flex;justify-content: space-between;}
.titleandfile input[type=file]{display: none;}
label.fileupload{display:block;
    max-width: 80%;
    font-size: 1.25rem;
    font-weight: 700;
    text-overflow: ellipsis;
    white-space: nowrap;
    cursor: pointer;
    display: inline-block;
    overflow: hidden;
    padding: 0.625rem 1.25rem;
    color: #f1e5e6;
    background-color: #d3394c;
}
</style>
<meta charset="UTF-8">
<title>COPANG</title>
</head>
<body>
	<div class="customer">
		<div class="write_area">
			<h1>공지사항 글쓰기</h1>
			<form method="post" action="noticeRegister.no"
				enctype="multipart/form-data">
				<!-- enctype="multipart/form-data" -->
				<hr>
				<ul class=titleandfile>
					<li><input type="text" placeholder="글 제목" name="title"
						required="required"></li>
					<li><label for="첨부파일" class="fileupload">첨부파일</label> <input type="file"
						name="file"></li>
				</ul>
				<ul>
					<li><textarea name="content" required="required"></textarea></li>
				</ul>
				<ul class="btns">
					<li><input type="submit" value="글쓰기"></li>
					<li><input type="button" value="취소" onClick="goBack()"></li>
				</ul>
			</form>
			<script>
				CKEDITOR.replace('content');
			</script>
		</div>
	</div>
</body>
</html>