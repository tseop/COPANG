<%@page import="java.io.PrintWriter"%>
<%@page import="notice.NoticeDAO"%>
<%@page import="notice.NoticeDTO"%>
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
		/* NoticeDTO noticeDTO = (NoticeDTO) request.getAttribute("noticeDTO"); */
		
	%>
	<div id="noticeUpdate">
		<form action="noticeUpdate.no" method="get">
			<ul>
				<li><label for="제목">제목</label> <input type="text" name="title"
					required="required"> <%-- value="<%= noticeDTO.getNotiTitle() %>" --%>
					<input type="hidden" name="no" value="<% request.getParameter('notiNo'); %>">
				</li>
				<li><label for="내용">내용</label> <textarea rows="20" cols="80"
						name="content" required="required"></textarea> <%-- <%= noticeDTO.getNotiContent() %> --%>
				</li>

				<li><input type="submit" value="수정"> 
				<input type="reset" value="원래대로"></li>
			</ul>
		</form>
	</div>
</body>
</html>