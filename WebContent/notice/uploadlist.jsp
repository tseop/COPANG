<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String fileName = (String)request.getAttribute("fileName");
		long fileSize = (long)request.getAttribute("fileSize");
	%>
	<h2>파일명</h2>&nbsp;<a href="FileDown?fileName=<%=fileName%>"><%=fileName %></a>
	<h2>사이즈</h2>&nbsp;<%=fileSize %>
</body>
</html>