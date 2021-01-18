<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="notice.NoticeDTO" %>
<%@ page import="notice.NoticeDAO" %>
<jsp:useBean id="noticeView" class="notice.NoticeDAO" scope="page"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COPANG</title>
</head>
<body>
<div class="container">
	<div class="row">
	<%
		NoticeDTO noticeDTO = (NoticeDTO)request.getAttribute("noticeDTO"); 
	%>
	<table style="text-align: center; border: 1px solid #dddddd">
		<thead>
			<tr>
				<th colspan="3" style="background-color:#eeeeee; text-align: center;">공지사항</th>			
			</tr>
		</thead>
		<tbody>
			<tr>
				<td style="width: 20%;">글 제목</td>
				<td colspan="2"><%= noticeDTO.getNotiTitle() %></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td colspan="2"><%= noticeDTO.getEmpNo() %></td>
			</tr>
			<tr>
				<td>작성일자</td>
				<td colspan="2"><%= noticeDTO.getNotiDate() %></td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="2" style="min-height: 200px; text-align: left;"><%= noticeDTO.getNotiContent() %></td>
			</tr>
		</tbody>
		</table>
		<a href="noticeList.no">목록</a>
		
			<a href="noticeUpdateConfirm.jsp?notiNo=<%= noticeDTO.getNotiNo() %>">수정</a>
			<a href="#?notiNo=<%= noticeDTO.getNotiNo() %>">삭제</a> 
		
</div>	
</div>
</body>
</html>