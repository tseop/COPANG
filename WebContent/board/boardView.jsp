<%@page import="board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KHJSP</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<style type="text/css">
.board_view {width:80%; margin: auto;}
.board_view h1{font-weight: 100; font-size: 2rem;margin: 1rem;}
.board_view h3{font-weight: 100; font-size: 1rem;margin-top: 1rem; border-bottom: 1px solid #ccc;line-height: 1.3rem;}
.board_view .title ul{display: flex;justify-content: space-between;vertical-align: middle;}
.board_view .title ul li{padding: 0.3rem;font-size: 0.8rem;}
.board_view .title ul li#title{min-width: 80%;font-size: 1rem;}
.board_view .content{min-height: 20rem;font-size: 1rem;}
.board_view .date{margin: 1rem;text-align: right;}
.board_view .date ul{display: flex;font-size: 0.8rem;width: fit-content;margin-left: auto;}
.board_view .date ul li{padding-left: 1rem;}
.customer hr{position: relative;border: none;background: #ccc;height: 1px;}


</style>
</head>
<body>
<div class="customer">
<div class="board_view">
	<%
		BoardDTO boardDTO = (BoardDTO) request.getAttribute("boardDTO");
	%>
<h1>게시물</h1><br>
<div class="title">
	<ul>
		<li >&emsp;<%=boardDTO.getBoardNo()%></li>
		<li id="title"><%=boardDTO.getBoardTitle()%></li>
		<li >조회수 &emsp;<%=boardDTO.getBoardReadcount()%></li>
	</ul>
</div>
<hr>
<div class="content">
	<%=boardDTO.getBoardContent()%>
</div>
<hr>
<div class="date">
<ul>
	<li>마지막 업로드</li>
	<li><%=boardDTO.getBoardDate()%></li>
</ul>
</div>
<input type="button" value="목록으로" onClick="location.href='boardList.bo'" class="btn">
</div>
</div>
</body>
</html>