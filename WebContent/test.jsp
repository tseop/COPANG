<%@page import="board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="mainDAO" class="board.MainDAO" scope="page" />
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	ArrayList<BoardDTO> boardSearchList = (ArrayList<BoardDTO>) request.getAttribute("list");
			for (int i = 0; i < boardSearchList.size(); i++) {
				BoardDTO boardDTO = boardSearchList.get(i);
		%><tr>
			<td><%=boardDTO.getBoardNo() %></td>
			<td><a href='customerDetails.cu?num=<%=boardDTO.getBoardNo() %>'
					style="color: black; text-decoration: none;"
					onmouseover="this.style.color='blue'"
					onmouseout="this.style.color='black'"> <%=boardDTO.getBoardTitle() %></a></td>
			<td><%=boardDTO.getBoardDate() %></td>
			<td><%=boardDTO.getBoardReadcount() %></td>
			<% } %>
		</tr>
	
	</tbody>
</table>
</div>
	<div class="box3">
	11
	</div>
</div>
</body>
</html>