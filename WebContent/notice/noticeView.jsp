<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="notice.NoticeDTO"%>
<%@ page import="notice.NoticeDAO"%>
<jsp:useBean id="noticeView" class="notice.NoticeDAO" scope="page" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COPANG</title>
<style type="text/css">
.customer {
	font-size: 0.8rem;
}

table {
	width: 100%;
}

table thead th {
	padding: 1rem;
}

table tbody tr {
	padding: 1rem;
	border-bottom: 1px solid #ccc;
}

table tbody td {
	padding: 1rem;
}

table tbody tr .width {
	width: 5rem;
}

table tbody tr .height {
	height: 10rem;
}

.customer .board_view h2 {
	margin: 1.5rem 0;
	text-align: center;
	font-size: 1.2rem;
	font-weight: 700;
	color: #366afe;
}
</style>
</head>
<body>
	<div class="customer">
		<div class="board_view">
			<%
				NoticeDTO noticeDTO = (NoticeDTO) request.getAttribute("noticeDTO");
			%>
			<h2>공지사항</h2>
			<hr>
			<table>
				<tbody>
					<tr>
						<td class="width">글 제목</td>
						<td colspan="2"><%=noticeDTO.getNotiTitle()%></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%=noticeDTO.getEmpNo()%></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan="2"><%=noticeDTO.getNotiDate()%></td>
					</tr>
					<tr>
						<td class="height">내용</td>
						<td colspan="2" style="min-height: 300px;"><%=noticeDTO.getNotiContent()%></td>
					</tr>
				</tbody>
			</table>

			<br> <br> <br>
			<div class="search_area">
				<ul style="justify-content: flex-end;">
					<li><input type="button" value="목록"
						onClick="location.href='noticeList.no'" class="btn"></li>&emsp;&emsp;
					<li><input type="button" value="수정"
						onClick="location.href='noticeUpdateSearch.no?no=<%=noticeDTO.getNotiNo()%>'"
						class="btn"></li>&emsp;&emsp;
					<li><input style="background: #D71427" type="button"
						value="삭제하기"
						onClick="location.href='noticeDelete.no?no=<%=noticeDTO.getNotiNo()%>'"
						class="btn"></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>