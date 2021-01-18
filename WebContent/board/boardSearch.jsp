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
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<div class="customer">
<div class="table">
	<%
		String searchTitle = request.getParameter("searchTitle");
		ArrayList<BoardDTO> boardSearchList = (ArrayList<BoardDTO>) request.getAttribute("boardSearchList");
		if (boardSearchList.size() == 0) {
	%>
	<h3>" <%=searchTitle%> " 키워드를 포함한 게시물은 없습니다.</h3><!-- 검색한 키워드의 게시물이 없을 경우 표시 -->
	<hr>
	<div class="search_area">
		<input type="button" value="게시글 전체보기" onClick="location.href='boardList.bo'">
		</div>
	<br>
	<%
		} else {
	%>
	<h3>" <%=searchTitle%> " 키워드를 포함한 익명 게시글</h3>
	<hr>
	<table>
		<tr><th width="10%">번호</th>
			<th width="60%">제목</th>
			<th width="20%">날짜</th>
			<th width="10%">조회수</th>
		</tr>
		<%
			for (int i = 0; i < boardSearchList.size(); i++) {
					BoardDTO boardDTO = boardSearchList.get(i);
		%>
		<tr>
			<td><%=boardDTO.getBoardNo()%>&nbsp;</td>
			<td><a href='boardView.bo?no=<%=boardDTO.getBoardNo()%>'
				style="color: black; text-decoration: none;"
				onmouseover="this.style.color='#0074E9'"
				onmouseout="this.style.color='black'"><%=boardDTO.getBoardTitle()%></a>&nbsp;</td>
			<!--a태그로 인해 링크로 걸려버리는 디자인 제거하여 마우스 오버 및 아웃시 색상변화와 기본 텍스트 컬러 블랙으로만 설정 -->
			<td><%=boardDTO.getBoardDate()%>&nbsp;</td>
			<td><%=boardDTO.getBoardReadcount()%></td>
		</tr>
		<%
			}
			}
		%>
	</table>
	<br>
	<div class="search_area">
		<form action="boardSearch.bo" method="get">
			<ul>
				<li class="search_box"><input type="text" placeholder="게시물 제목" name="searchTitle" autofocus="autofocus" required="required"> 
				<input type="submit" value="검색"></li>
				<li><% if((boardSearchList.size() != 0)) { %> 
					<input type="button" value="게시글 전체보기" onClick="location.href='boardList.bo'"><% } %>
					<!-- 검색한 키워드의 게시물이 없을 경우 미표시 --></li>
				<li><input type="button" value="게시글쓰기"onClick="location.href='board/boardWrite.jsp'"></li>
			</ul>
		</form>
	</div>
</div>
</div>
</body>
</html>