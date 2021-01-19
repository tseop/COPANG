<%@page import="customer.CustomerDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COPANG</title>
<script>
function back(){    //사원번호 숫자만입력
	window.close();
 }
</script>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<div class="wrap_popup">
<ul>
<li><img src="images/Copang_logo.png"></li>
<li>거래처 찾기</li></ul>
<hr>
<div class="customer">
<div class="table">	
<%
	String customerSearch = request.getParameter("searchCusName");
	ArrayList<CustomerDTO> customerSearchList = (ArrayList<CustomerDTO>) request.getAttribute("customerSearchList");
	if (customerSearchList.size() == 0) {
%>	 
<h3 style="text-align: center;">검색 결과가 없습니다..</h3><br>
<%} else {%>
<div class="search_area">
	<form action="customerSearch.cu" method="get">
	<h3>" <%=customerSearch%> " 검색 결과</h3>
	<ul style="margin-left: auto; width: fit-content;">
			<li class="search_box"><input type="text" placeholder="거래처 이름" name="searchCusName" required="required">
				<input type="submit" value="검색"></li>
			</ul>
	</form>
	<hr>
	<table>
	<thead>
		<tr>
			<th style="width: 10%;">번호</th>
			<th style="width: 25%;">이름</th>
			<th style="width: 15%;">담당자</th>
		</tr>
	</thead>
		<%
			for (int i = 0; i < customerSearchList.size(); i++) {
				CustomerDTO customerDTO = customerSearchList.get(i);
		%>
		<tr>
			<td><%=customerDTO.getCusNo() %></td>
			<td><a href='customerDetails.cu?num=<%=customerDTO.getCusNo() %>'
					style="color: black; text-decoration: none;"
					onmouseover="this.style.color='blue'"
					onmouseout="this.style.color='black'"> <%=customerDTO.getCusName() %></a></td>
			<td><%=customerDTO.getCusManager() %></td>
			<% }} %>
		</tr>
	</table>
	<br>
	<div class="search_area">
	<ul style="justify-content: center;">
		<li>
		<input type="button" value="이전페이지" onClick="history.go(-1)">
		<input type="button" value="돌아가기" onClick="back()">
		</li>
	</ul>
	</div>
	</div>
</div>
</div>
</div>
</body>
</html>