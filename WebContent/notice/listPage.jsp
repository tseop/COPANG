<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COPANG</title>
</head>
<body>
	<div id="noticelist">
		<h1>공지게시판</h1>
		<table border="1" cellspacing="0" cellpadding="0">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>&nbsp;</th>
			</tr>
			<c:forEach items="${list}" var="notice">
				<tr>
					<td>${notice.notiNo }</td>
					<td><a href='noticeView.no?no=${notice.notiNo}'
                     style="color: black; text-decoration: none;"
                     onmouseover="this.style.color='#0074E9'"
                     onmouseout="this.style.color='black'">${notice.notiTitle}</a></td>
					<td>${notice.empNo }</td>
					<td>${notice.notiDate }</td>
					<!-- <td><a href="noticeDelete.no?no=${notice.notiNo }">삭제</a></td>-->
				</tr>
			</c:forEach>
			<tr>
				<td colspan="7"><jsp:include page="page.jsp" flush="true" /></td>
			</tr>
		</table>
			
	<div>
	<form action = "noticeSearch.no" method="get">
	<ul>
	<li><input type="text" placeholder="게시물 제목" name="searchTitle" autofocus="autofocus" required="required">
	<input type="submit" value="검색"></li>
	</ul>
	</form>
	</div>
		<br> <input type="button" value="게시글쓰기"
				onClick="location.href='notice/noticeWrite.jsp'">

	</div>
</body>
</html>