<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<script src="js/jquery-1.10.2.js"></script>
<script src="js/top.js"></script>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div class="top">
		<div class="logo">
			<a href="index.jsp"><img src="images/Copang_logo.png"></a>
		</div>
		<div class="top-bar">
			<a href="index.jsp">홈</a>&emsp;
			<%
				String id = (String)session.getAttribute("id");//오브젝트 타입으로 반환되기때문에 타입변환 필요함
			if (id != null) {
				if (id.equals("zzzz1")) {
					out.print("<a href=member/logout.jsp>로그아웃</a><br>");
					out.print("<a href=memberList.mb>회원목록</a><br>");
					out.print("관리자 " + id + "님 접속중");
				}else{
				out.print("<a href=member/logout.jsp>로그아웃</a>&emsp;");
				out.print("<a href=index.jsp?page=member/deleteAccountForm>회원탈퇴</a><br>");
				out.print(id + "님 접속중");
				}
			} else {
				out.print("<a href='index.jsp?page=member/memberForm'>회원가입</a>&emsp;");
				out.print("<a href='index.jsp?page=member/loginForm'>로그인</a>");
			}
			%>

		</div>
		<div class="menu">
			<ul>
				<li><% id = (String)session.getAttribute("id");
				if(id!=null){
					out.print("<a href='index.jsp?page=경로'>사원조회</a>");
					}else{
						out.print("<a href=# onclick=alert('로그인하세요')>사원조회</a>");
				}%></li> 
				<li><% id = (String)session.getAttribute("id");
				if(id!=null){
					out.print("<a href=서블릿경로>재고관리</a>");
					}else{
						out.print("<a href=# onclick=alert('로그인하세요')>재고관리</a>");
				}%></li>
				<li><a href="noticeList.no">공지사항</a></li>
				<li><a href="#">익명게시판</a></li>
				<li><a href="#">포트폴리오</a></li>
			</ul>
		</div>
	</div>
</body>
</html>