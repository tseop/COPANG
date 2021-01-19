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

.inputfile {
	width: 0.1px;
	height: 0.1px;
	opacity: 0;
	overflow: hidden;
	position: absolute;
	z-index: -1;
}
.inputfile+label{
    font-size: 0.7em;
    font-weight: 700;
    color: #366afe;
    padding:0.5rem;
    display: inline-block;
	cursor: pointer;
}
.inputfile:focus + label {outline: 1px dotted #000; outline: -webkit-focus-ring-color auto 5px;}
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
					<li><input type="file" name="file" id="file" class="inputfile" data-multiple-caption="{count} files selected" multiple/>
						<label for="file">파일 선택</label></li>
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