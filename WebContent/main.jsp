<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String pagefile = request.getParameter("page");
	if (pagefile == null) {
		pagefile = "test";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>COPANG</title>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/style.css?v=011502">
</head>
<body>
	<header>
		<jsp:include page="top.jsp" />
	</header>
	<main>
		<jsp:include page='<%=pagefile + ".jsp"%>' />
	</main>
	<footer>
		<jsp:include page="bottom.jsp" />
	</footer>
</body>
</html>