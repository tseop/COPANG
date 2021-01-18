<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COPANG</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/style.css?v=1">
</head>
<body>
	<div class="customer">
		<div class="table">
			<h1>익명게시판</h1>
			<hr>
			<table border="1">
			<tr>
				<th width="10%">번호</th>
				<th width="60%">제목</th>
				<th width="20%">날짜</th>
				<th width="10%">조회수</th>
			</tr>
				<c:forEach items="${list}" var="board">
					<tr>
						<td>${board.boardNo}</td>
						<td><a href='boardView.bo?no=${board.boardNo}'
							style="color: black; text-decoration: none;"
							onmouseover="this.style.color='#0074E9'"
							onmouseout="this.style.color='black'">${board.boardTitle}</a></td>
						<td>${board.boardDate}</td>
						<td>${board.boardReadcount}</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="5" style="border: 1px solid white; padding-top: 2rem;"><jsp:include
							page="page.jsp" flush="true" /></td>
				</tr>
			</table>
			<br>

			<div class="search_area">
				<form action="boardSearch.bo" method="get">
					<ul>
						<li class="search_box"><input type="text"
							placeholder="게시물 제목" name="searchTitle" required="required">
							<input type="submit" value="검색"></li>
						<li><input type="button" value="게시글쓰기"
							onClick="location.href='board/boardWrite.jsp'"></li>
					</ul>
				</form>
			</div>
		</div>
	</div>
</body>
</html>