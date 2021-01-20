<%@page import="java.io.PrintWriter"%>
<%@page import="notice.NoticeDAO"%>
<%@page import="notice.NoticeDTO"%>
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

<meta charset="UTF-8">
<title>COPANG</title>
</head>
<body>
	<%
		NoticeDTO noticeDTO = (NoticeDTO) request.getAttribute("noticeDTO");
	%>
	<div id="noticeUpdate">
		<form action="noticeUpdate.no" method="get">
			<ul>
				<li><label for="제목">제목</label> <input type="text" name="title"
					required="required" value="<%=noticeDTO.getNotiTitle()%>">
					<input type="hidden" name="no" value="<%=noticeDTO.getNotiNo()%>"></li>

				<li><input type="file" name="file" id="file" class="inputfile" />
					<label for="file" id="fileYN">파일 선택</label></li>

				<li><label for="내용">내용</label> <textarea name="content"
						required="required" id="editor"><%=noticeDTO.getNotiContent()%></textarea></li>

				<li><input type="submit" value="수정"><input
					type="button" value="취소" onClick="goBack()"></li>

			</ul>
		</form>
	</div>

	<script>
		CKEDITOR.replace('content');
	</script>
</body>
</html>