<%@page import="board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="mainDAO" class="board.MainDAO" scope="page" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COPANG</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<style type="text/css">
.wrapper_main{display: flex; padding: 2rem; min-width: 40rem;}
.box1{border: 1px solid black;}
.box2{border: 1px solid red;}
.box3{border: 1px solid blue;}
</style>
</head>
<body>
<%
ResultSet rs = mainDAO.mainBoardList();
%>
<div class="wrapper_main">
<div class="box1">

</div>
<div class="box2">
<table>
	<thead>
		<tr>
			<th width="10%">번호</th>
			<th width="60%">제목</th>
			<th width="20%">날짜</th>
			<th width="10%">조회수</th>
		</tr>
		</thead>
		<tbody>
<%
while (rs.next()) {
	BoardDTO data = new BoardDTO();
	int boardNo = rs.getInt("BOARD_NO");
	String boardTitle = rs.getString("BOARD_TITLE");
	String boardDate = rs.getString("BOARD_DATE");
	int boardReadcount = rs.getInt("BOARD_READCOUNT");
	out.print("<tr><td>" + boardNo + "</td><td>" + boardTitle + "</td><td>" + boardDate + "</td><td>" + boardReadcount + "</td></tr>");
}
			%>
		</tbody>
</table>
</div>
	<div class="box3">
	11
	</div>
</div>
</body>
</html>