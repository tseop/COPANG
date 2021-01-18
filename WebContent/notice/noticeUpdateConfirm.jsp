<%@page import="notice.NoticeDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COPANG</title>
</head>
<body>

<div id="noticeUpdate">
<%
	NoticeDTO noticeDTO = (NoticeDTO) request.getAttribute("noticeDTO");
	out.print("변경하기 전 내용입니다.<br>");
	out.print("번호: "+noticeDTO.getNotiNo()+"제목: "+noticeDTO.getNotiTitle()+"내용: "+noticeDTO.getNotiContent()+"날짜: "+noticeDTO.getNotiDate()+"<br>");
%>
	<form action="noticeUpdateFinal.no" method="get">
	<ul>
	<li><label for="제목">제목</label>
	<input type="text" name="title" autofocus="autofocus" required="required" placeholder="변경할 제목을 입력해주세요.">
	<input type="hidden" name="titleSearch" value="<%= noticeDTO.getNotiTitle()%>">
	</li>
	<li><label for="내용">내용</label>
	<textarea rows ="20" cols="80" name="content" placeholder="변경할 내용을 입력해주세요"></textarea>
	</li>
	<li><label for="날짜">날짜</label>
	<input type="date" name="nal" >
	</li>
	<li><input type="submit" value="수정">
	<input type="reset" value="원래대로">
	</li>
	</ul>
	</form>
</div>
</body>
</html>