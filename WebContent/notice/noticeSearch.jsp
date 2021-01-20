<%@page import="notice.NoticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COPANG</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/style.css?">
</head>
<body>
	<div class="customer">
		<div class="table">
			<%
				String searchTitle = request.getParameter("searchTitle");
				ArrayList<NoticeDTO> noticeSearchList = (ArrayList<NoticeDTO>) request.getAttribute("noticeSearchList");
				if (noticeSearchList.size() == 0) {
			%>
			<div class="search_area">
				<form action="noticeSearch.no" method="get">
					<h3>
						"<%=searchTitle%>" 키워드를 포함한 게시물은 없습니다.
					</h3>
					<ul style="margin-left: auto; width: fit-content;">
						<li class="search_box"><input type="text"
							placeholder="게시물 제목" name="searchTitle" required="required">
							<input type="submit" value="검색"></li>
					</ul>
				</form>
				<hr>
				<%
					} else {
				%>
			
				<div class="search_area">
					<form action="noticeSearch.no" method="get">
						<ul style="margin-left: auto; width: fit-content;">
							<li class="search_box"><input type="text" placeholder="게시물 제목"
								name="searchTitle" required="required">
								<input type="submit" value="검색"></li>
						</ul>
					</form>
					<hr>
					<table border="1" cellspacing="0" cellpadding="0">
						<thead>
							<tr>
								<th width="10%">번호</th>
								<th width="50%">제목</th>
								<th width="20%">작성자</th>
								<th width="20%">날짜</th>
							</tr>
						</thead>
						<%
							for (int i = 0; i < noticeSearchList.size(); i++) {
									NoticeDTO noticeDTO = noticeSearchList.get(i);
						%>

						<tr>
							<td><%=noticeDTO.getNotiNo()%>&nbsp;</td>
							<td><a href='noticeView.no?no=<%=noticeDTO.getNotiNo()%>'
								style="color: black; text-decoration: none;"
								onmouseover="this.style.color='#0074E9'"
								onmouseout="this.style.color='black'"><%=noticeDTO.getNotiTitle()%></a>&nbsp;</td>
							<td><%=noticeDTO.getEmpName()%></td>
							<td><%=noticeDTO.getNotiDate()%>&nbsp;</td>
						</tr>
						<%
							}
							}
						%>
					</table>
					<br>
					<div class="search_area">
						<ul>
							<li><input type="button" value="게시글 전체보기"
								onClick="location.href='noticeList.no'"></li>
							<li><input type="button" value="게시글쓰기"
								onClick="location.href='index.jsp?page=notice/noticeWrite'"></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>