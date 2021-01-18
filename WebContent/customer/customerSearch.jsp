<%@page import="java.util.ArrayList"%>
<%@page import="customer.CustomerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COPANG</title>
</head>
<body>
<div class="customer">
<div class="table">	
<%
	String customerSearch = request.getParameter("customerSearch");
	ArrayList<CustomerDTO> customerSearchList = (ArrayList<CustomerDTO>) request.getAttribute("customerSearchList");
	if (customerSearchList.size() == 0) {
%>	 <h3>검색 결과가 없습니다..</h3>
<div class="search_area">
<%} else {%>
	<form action="customerSearch.cu" method="get">
	<h3>" <%=customerSearch%> " 검색 결과</h3>
	<ul style="margin-left: auto; width: fit-content;">
			<li class="search_box"><input type="text" placeholder="게시물 제목" name="customerSearch" required="required">
				<input type="submit" value="검색"></li>
			</ul>
	</form>
	<hr>
	<table>
		<tr>
			<th style="width: 10%;">번호</th>
			<th style="width: 25%;">이름</th>
			<th style="width: 15%;">담당자</th>
			<th style="width: 25%;">전화번호</th>
			<th style="width: 25%;">사업자번호</th>
		</tr>
		<%
			for (int i = 0; i < customerSearchList.size(); i++) {
				CustomerDTO customerDTO = customerSearchList.get(i);
		%>
		<tr>
			<td><%=customerDTO.getCusNo() %></td>
			<td><%=customerDTO.getCusName() %></td>
			<td><%=customerDTO.getCusManager() %></td>
			<td><%=customerDTO.getCusTel() %></td>
			<td><%=customerDTO.getBusinessNo() %></td>
		</tr>
		<% }} %>
	</table>
</div>
</div>
</div>
</body>
</html>