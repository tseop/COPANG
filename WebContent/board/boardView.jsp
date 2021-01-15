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
	<h1>게시물</h1>
	<%=boardDTO.getBoardNo()%><br>
	<%=boardDTO.getBoardTitle()%><br>
	<%=boardDTO.getBoardContent()%><br>
	<%=boardDTO.getBoardDate()%><br>
	<%=boardDTO.getBoardReadcount()%>

</body>
</html>