<%@page import="notice.NoticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COPANG</title>
</head>
<body>
	<%
		String searchTitle = request.getParameter("searchTitle");
		ArrayList<NoticeDTO> noticeSearchList = (ArrayList<NoticeDTO>) request.getAttribute("noticeSearchList");

		if (noticeSearchList.size() == 0) {
	%>

	<h3>
		"<%=searchTitle%>" 키워드를 포함한 게시물은 없습니다.
	</h3>
	<br>
	<input type="button" value="게시글 전체보기"
		onClick="location.href='noticeList.no'">
	<br>

	<%
		} else {
	%>

	<br>

	<div id="noticeSearch">
		<table border="1" cellspacing="0" cellpadding="0">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>날짜</th>
				<th>작성자</th>
			</tr>
			<%
				for (int i = 0; i < noticeSearchList.size(); i++) {
						NoticeDTO noticeDTO = noticeSearchList.get(i);
			%>

			<tr>
				<td><%=noticeDTO.getNotiNo()%>&nbsp;</td>
				<td><a href='noticeView.no?no=<%=noticeDTO.getNotiNo()%>'
					style="color: black; text-decoration: none;"
					onmouseover="this.style.color='blue'"
					onmouseout="this.style.color='black'"><%=noticeDTO.getNotiTitle()%></a>&nbsp;</td>
				<td><%=noticeDTO.getNotiContent()%>&nbsp;</td>
				<td><%=noticeDTO.getNotiDate()%>&nbsp;</td>
				<td><%=noticeDTO.getEmpNo()%></td>
			</tr>

			<%
				}
			%>
		</table>
		<br> <br>

		<%
			}
			if (noticeSearchList.size() != 0) {
		%>
		<input type="button" value="게시글 전체보기"
			onClick="location.href='noticeList.no'">
		<%
			}
		%>

		<input type="button" value="게시글쓰기"
			onClick="location.href='notice/noticeWrite.jsp'">
	</div>
</body>
</html>