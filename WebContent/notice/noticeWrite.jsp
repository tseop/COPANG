<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>

<html>
<head>
<script src="https://cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>
<script type="text/javascript">
	function check(){
      	var editorValue = CKEDITOR.instances.editor.getData();
      	console.log(editorValue);

      	if(editorValue == "" || editorValue.length == 0){
        	alert('내용을 입력해주세요.');
         	return false;
      	} else {
         	return true;
      	}
   }
	function goBack() {
		window.history.back();
	}
</script>
<style>

</style>
<script>	
$(function(){
	$('#file').on('change', function(){
		var fileyn = $('#file').val();
		var arr = fileyn.split('\\');

		if(fileyn != null || fileyn != ""){
			$('#fileYN').text(arr[2]);
		}
	});
}); 	
</script>
<meta charset="UTF-8">
<title>COPANG</title>
</head>
<body>
	<div class="customer">
		<div class="write_area">
			<h1>공지사항 글쓰기</h1>
			<form method="post" action="noticeRegister.no"
				enctype="multipart/form-data" onsubmit="return check()">
				<!-- enctype="multipart/form-data" -->
				<hr>
				<ul class=titleandfile>
					<li><input type="text" placeholder="글 제목" name="title"
						required="required" class="write_title"></li>
					<li class="choose_file"><input type="file" name="file" id="file" class="inputfile"/>
						<label for="file" id="fileYN">파일 선택</label></li>
				</ul>
				<ul>
					<li><textarea name="content" id="editor"></textarea></li>
				</ul>
				<ul class="btns">
					<li><input type="submit" value="작성"></li>
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