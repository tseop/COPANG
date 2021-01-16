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
<style type="text/css">
.btn_area{}
.btn_area ul{display: flex; justify-content: center;}
.btn_area ul li{padding: 1rem 1rem 0rem 1rem;}
</style>
</head>
<body>
<div class="customer">
<div class="table">
	<%
		String searchTitle = request.getParameter("searchTitle");
	%>
	<%
		ArrayList<BoardDTO> boardSearchList = (ArrayList<BoardDTO>) request.getAttribute("boardSearchList");

		if (boardSearchList.size() == 0) {
	%>


	<h3>" <%=searchTitle%> " 키워드를 포함한 게시물은 없습니다.</h3>
	<hr>
		<input type="button" value="게시글 전체보기" onClick="location.href='boardList.bo'">
	<br><!-- 검색한 키워드의 게시물이 없을 경우 표시 -->
	
	<%
		} else {
	%>

	<h3>" <%=searchTitle%> " 키워드를 포함한 익명 게시글</h3>
	<hr>

	<table>
		<tr>
			<th>번호&nbsp;</th>
			<th>제목&nbsp;</th>
			<th>날짜&nbsp;</th>
			<th>조회수</th>
		</tr>

		<%
			for (int i = 0; i < boardSearchList.size(); i++) {
					BoardDTO boardDTO = boardSearchList.get(i);

					String boardDate = boardDTO.getBoardDate(); //datebase date값 변수 저장
					String timeY = boardDate.substring(2, 4); //연도 뒷 2자리 
					String timeM = boardDate.substring(5, 7); //월 2자리
					String timeD = boardDate.substring(8, 10); //일 2자리
					String boardTimeMDY = timeM + "/" + timeD + "/" + timeY; //월 , 일, 연도 순으로 출력
					String boardTimeMD = timeM + "/" + timeD; //월, 일 순으로 출력
		%>
		<tr>
			<td><%=boardDTO.getBoardNo()%>&nbsp;</td>
			<td><a href='boardView.bo?no=<%=boardDTO.getBoardNo()%>'
				style="color: black; text-decoration: none;"
				onmouseover="this.style.color='blue'"
				onmouseout="this.style.color='black'"><%=boardDTO.getBoardTitle()%></a>&nbsp;</td>
			<!--a태그로 인해 링크로 걸려버리는 디자인 제거하여 마우스 오버 및 아웃시 색상변화와 기본 텍스트 컬러 블랙으로만 설정 -->
			<td><%=boardTimeMD%>&nbsp;</td>
			<td><%=boardDTO.getBoardReadcount()%></td>
		</tr>
		<%
			}
			}
		%>
	</table>
	
	<div class="btn_area">
		<form action="boardSearch.bo" method="get">
			<ul>
				<li><input type="text" placeholder="게시물 제목" name="searchTitle" autofocus="autofocus" required="required"> 
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