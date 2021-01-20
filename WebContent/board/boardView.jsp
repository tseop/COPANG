<%@page import="board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="boardView" class="board.BoardDAO" scope="page" />

<!DOCTYPE html>
<html>
<head>

<script type="text/javascript">
	function button_event() {
		if (confirm("정말 삭제하시겠습니까??") == true) {
			document.update.action = 'boardDelete.bo';
			document.update.submit();
		} else {
			return false;
		}
	}

	function goBack() {
		window.history.back();
	}
</script>
<meta charset="UTF-8">
<title>KHJSP</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/style.css?v=20">
</head>
<body>
	<div class="customer">
		<div class="board_view">
			<%
				BoardDTO boardDTO = (BoardDTO) request.getAttribute("boardDTO");
				boardView.boardReadCount(boardDTO);
			%>
			<h1>익명 게시판</h1>
			<hr>
			<form action="" method="post" name="update">
				<input type="hidden" name="no" value=<%=boardDTO.getBoardNo()%>>
				<div class="title">
					<ul>
						<li>&emsp;<%=boardDTO.getBoardNo()%></li>
						<li id="title"><%=boardDTO.getBoardTitle()%></li>
						<li>조회수 &emsp;<%=boardDTO.getBoardReadcount() + 1%></li>
					</ul>
				</div>
				<hr>
				<div class="content">
					<%=boardDTO.getBoardContent()%>
				</div>
				<hr>
				<div class="date">
					<ul>
						<li>작성 날짜</li>
						<%
							Date nowTime = new Date();
							SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH시 mm분");
							if (boardDTO.getBoardDate() == null) {
						%>
						<li><%=sf.format(nowTime)%></li>
						<%
							} else {
						%>
						<li><%=boardDTO.getBoardDate()%></li>
						<%
							}
						%>

					</ul>
					<br>
				</div>
				<div class="search_area">
					<ul>
						<%
							if (boardDTO.getBoardReadcount() != 0) {
						%>
						<li><input type="button" value="목록으로" onClick="goBack()"
							class="btn"></li>
						<%
							} else {
						%>
						<li><input type="button" value="목록으로"
							onClick="location.href='boardList.bo'" class="btn"></li>
						<%
							}
							int EMP_RANK = (int) session.getAttribute("EMP_RANK");
							int EMP_DEPT = (int) session.getAttribute("EMP_DEPT");
							if (EMP_RANK == 3) { //버튼 세션값에 따라 나타내는거
						%>
						<li><input style="background: #D71427" type="button"
							value="삭제하기" onClick="button_event()" class="btn"></li>
						<%
							}
						%>
					</ul>
				</div>
			</form>
		</div>
	</div>
</body>
</html>