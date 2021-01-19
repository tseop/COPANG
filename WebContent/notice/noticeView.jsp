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
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<div class="customer">
		<div class="noti_view">
			<%
				NoticeDTO noticeDTO = (NoticeDTO) request.getAttribute("noticeDTO");
			%>
			<h2>공지사항</h2>
			<hr>
			<table>
				<thead>
					<tr style="height: 10%;">
						<td class="width">글 제목</td>
						<td colspan="2"><%=noticeDTO.getNotiTitle()%></td>
					</tr>
					<tr style="height: 10%;">
						<td>작성자</td>
						<td colspan="2"><%=noticeDTO.getEmpNo()%></td>
					</tr>
					<tr style="height: 10%;">
						<td>작성일자</td>
						<td colspan="2"><%=noticeDTO.getNotiDate()%></td>
					</tr>
					<tr style="height: 70%;">
						<td class="height">내용</td>
						<td colspan="2"><%=noticeDTO.getNotiContent()%></td>
					</tr>
				</thead>
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