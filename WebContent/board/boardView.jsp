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

		String boardDate = boardDTO.getBoardDate(); //datebase date값 변수 저장
		String timeY = boardDate.substring(2, 4); //연도 뒷 2자리 
		String timeM = boardDate.substring(5, 7); //월 2자리
		String timeD = boardDate.substring(8, 10); //일 2자리
		String boardTimeMDY = timeM + "/" + timeD + "/" + timeY; //월 , 일, 연도 순으로 출력
		String boardTimeMD = timeM + "/" + timeD; //월, 일 순으로 출력
	%>
	<h1>게시물</h1><br><br>
	
	
	<h3>no 제목</h3>
	<%=boardDTO.getBoardNo()%>&nbsp;
	<%=boardDTO.getBoardTitle()%><br><br>
	<h3>내용</h3>
	<%=boardDTO.getBoardContent()%><br><br>
	<h3>업로드일</h3>
	<%=boardTimeMDY%><br><br>
	<h3>조회수</h3>
	<%=boardDTO.getBoardReadcount()%><br><br>
	

	<input type="button" value="목록으로"
		onClick="location.href='boardList.bo'">
</body>
</html>