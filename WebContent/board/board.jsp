<%@page import="board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COPANG</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<div class="customer">
<div class="table">
	<h1>익명게시판</h1>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
		<%
			ArrayList<BoardDTO> boardList = (ArrayList<BoardDTO>) request.getAttribute("boardList");

			for (int i = 0; i < boardList.size(); i++) {
				BoardDTO boardDTO = boardList.get(i);
		%>
		<tr>

			<td><%=boardDTO.getBoardNo()%></td>
			<td><a href='boardView.bo?no=<%=boardDTO.getBoardNo()%>'><%=boardDTO.getBoardTitle()%></a></td>
			<td><%=boardDTO.getBoardDate()%></td>
			<td><%=boardDTO.getBoardReadcount()%></td>

		</tr>
		<%
			}
		%>
	</table>
</div>
<div id="link">
	<a href="board/boardWrite.jsp" class="btn">게시글쓰기</a>
</div>
</div>
</body>
</html>