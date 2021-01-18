<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>

body {
	background-image: url(../images/background.jpg);
	font-family: "맑은 고딕";
	font-size: 15px;
	color: white;
}

li {
	float: left;
	margin: 20px;
}
a {
	text-decoration: none;
	color: white;
	font-size: 13px;
}

a:hover {
	text-decoration: underline;
}
#wrap {
	width: 600px;
	height: 500px;
	margin: 100px auto;
}
#title {
	position: absolute;
	top: 100px;
	left: 400px;
}

#news {
	top: 210px;
	left: 1600px;
	text-align: right;
	width: 500px;
	height: 1000px;
	position: fixed;
}
#navbar {
	background-color: black;
	top: 230px;
	margin: 0px;
	padding: 0;
	list-style-type: none;
	position: absolute;
	width: 100%;
	height: 50px;
}

.member11 {
	position: absolute;
	top: 20px;
	right: 30px;
	width: 300px;
	height: 30px;
	text-align: right;
	z-index: 100;
}

.maintitle {
	width: 100%;
	height: 200px;
	background-image: url(../images/camera.jpg);
	z-index: 10;
}
.kh01{
width: 100%;
height: 1000px;

}

.member {
	font-size: 50px;
	text-shadow: 0 0 10px yellow;
	color: #fff;
	margin: 0 auto;
	text-align: center;
	text-transform: capitalize;
	font-family: "맑은 고딕";
	font-style: italic;
}



.form {
	width: 498px;
	height: 200px;
	border-radius: 25px;
	border: 5px double #999;
	margin: 30px auto;
}

.form2 {
	width: 380px;
	min-width: 320px;
	height: 100px;
	margin: 60px auto;
 text-align: center;
}

.form3 {
	float: center;
	/*   background:#f00;  */
}

.form3 label {
	width: 100px;
	height: 20px;
	/*  display: block; */
	float: left;
	text-align: center;
}

.form4 {
	/* padding: 0px 0px 0px 0px; */
	float: center;
}


.clear {
	clear: both;
	margin: 5px;
}

input[type="submit"] {
	float: left;
	/*  display:block; */
	height: 40px;
	background: #FFBB00;
	border-radius: 5px;
	border: none;
	font-family: "맑은 고딕";
}
button{
	width: 100px;
	height: 30px;
	background: skyblue;
	border-radius: 5px;
	/*  width: 140px; */
	font-family: "맑은 고딕";
	margin-top: 10px;
}
/* input[type="button"] {
	width: 100px;
	height: 30px;
	background: skyblue;
	border-radius: 5px;
	font-family: "맑은 고딕";
	margin-top: 10px;
	margin-right: 20px;
	margin-left: 40px;
} */
input[type="button"] {
	width: 100px;
	height: 30px;
	background: skyblue;
	border-radius: 5px;
	/*  width: 140px; */
	font-family: "맑은 고딕";
	margin-top: 10px;
}
input[type="checkbox"] {
	margin-top: 20px;
}
</style>

<meta charset="UTF-8">
<title>Travel</title>
</head>
<body>
	<form action="#" method="get">
		<div class="member11">
		<a href="../index.jsp">홈</a> | <a href="#">회원가입</a> | <a href="#">로그인</a>
	</div>
	<div class="maintitle">
		<ul id="navbar">
			<li><a href="../haksainfo.jsp">학사소개 | </a></li>
			<li><a href="#">커뮤니티 | </a></li>
			<li><a href="#">모집과정 | </a></li>
			<li><a href="#">KHB클래스 | </a></li>
		</ul>
	</div>
		<div id="wrap">
			<h1 class="member">member Register</h1>
			<div class="form">
				<div class="form2">
					<div class="form3">
						<%
						String name = request.getParameter("name");
						String age = request.getParameter("age");
						String hakbun = request.getParameter("hakbun");
						%>
						<%
							Class.forName("com.mysql.jdbc.Driver");
						//Connection conn = DriverManager.getConnection("jdbc:mysql://bbr123.cafe24.com:3306/bbr123?serverTimezone=Asia/Seoul","bbr123", "alstjr95!");
						Connection conn = DriverManager.getConnection("jdbc:mysql://bbr123.cafe24.com:3306/bbr123?characterEncoding=utf8", "bbr123", "alstjr95!");
						//Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bbr123", "bbr123", "alstjr95!");
						//Statement stmt = conn.createStatement();
						//String sql = "insert into StudentA(age, name, hakbun) values (" + age + ", '" + name + "', " + hakbun + ")";
						String sql = "insert into StudentA(age, name, hakbun) values (?,?,?)";
						PreparedStatement pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, age);
						pstmt.setString(2, name);
						pstmt.setString(3, hakbun);
						
						int cnt = pstmt.executeUpdate();
						%>
						<%=name%> 학생이 등록되었습니다
						<%
						pstmt.close();
						conn.close();
						%>
						<br> <br>
						<div class="form4">
						<input type="button" value="학생리스트" onclick='location.href="studentList.jsp"'>
						<input type="button" value="메인페이지" onclick='location.href="../index.jsp"'>
							<!-- <label><input type="button" value="학생리스트" onclick='location.href="studentList.jsp"'></label> 
							<label><input type="button" value="메인페이지" onclick='location.href="index.jsp"'></label> -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>

</body>
</html>