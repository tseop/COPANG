<%@page import="board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KHJSP</title>
</head>
<body>

	<%
		BoardDTO boardDTO = (BoardDTO) request.getAttribute("boardDTO");
	%>
	<h1>게시물</h1><br><br>	
	
	<h3>no 제목</h3>
	<%=boardDTO.getBoardNo()%>&nbsp;
	<%=boardDTO.getBoardTitle()%><br><br>
	<h3>내용</h3>
	<%=boardDTO.getBoardContent()%><br><br>
	<h3>업로드일</h3>
	<%=boardDTO.getBoardDate()%><br><br>
	<h3>조회수</h3>
	<%=boardDTO.getBoardReadcount()%><br><br>	

	<input type="button" value="목록으로"
		onClick="location.href='boardList.bo'">
</body>
</html>