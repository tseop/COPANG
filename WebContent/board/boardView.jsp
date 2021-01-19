<%@page import="board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="boardView" class="board.BoardDAO" scope="page"/>

<!DOCTYPE html>
<html>
<head>
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
<h1>익명 게시판</h1><hr>
<div class="title">
	<ul>
		<li>&emsp;<%=boardDTO.getBoardNo()%></li>
		<li id="title"><%=boardDTO.getBoardTitle()%></li>
		<li>조회수 &emsp;<%=boardDTO.getBoardReadcount()+1%></li>
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
	<li><%=boardDTO.getBoardDate()%></li>
</ul>
<br>
</div>
<div class="search_area">
	<ul>
		<li><input type="button" value="목록으로" onClick="location.href='boardList.bo'" class="btn"></li>
		<li><input style="background: #D71427" type ="button" value="삭제하기" onClick="location.href='boardDelete.bo?no=<%=boardDTO.getBoardNo()%>'" class="btn"></li>
	</ul>
</div>
</div>
</div>
</body>
</html>