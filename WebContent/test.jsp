<%@page import="product.ProductDTO"%>
<%@page import="notice.NoticeDAO"%>
<%@page import="notice.NoticeDTO"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="mainDAO" class="board.MainDAO" scope="page" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COPANG</title>
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet"  type="text/css" />
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="css/reset.css?v=210122">
<link rel="stylesheet" type="text/css" href="css/style.css?v=210122">
<script type="text/javascript">
	$(function(){
		$.datepicker.setDefaults({
			showOtherMonths: true,
			showMonthAfterYear: true,
			nextText: "다음 달",
			prevText: "이전 달",
			currentText: "오늘 날짜",
			changeMonth: true,
			monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			dateFormat: "yy-mm-dd",
			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토']
		});

		$('#datepicker').datepicker();
		
	});	
</script>
<script type="text/javascript">
	var space = "                       ";
	var strtxt = (space + "혼자서 해낼 수 있는 일은 세상에 별로 없습니다. 저희 회사도 여러분 모두의 공로가 들어가 있기에 지속적인 성장을 할 수 있는 점에 감사드리며 회사의 덕은 여러분의 덕임을 잊지 마시고 오늘도 행복한 하루 보내시기 바랍니다.");
        var strlaenge = strtxt.length;
        function scroll() {
            document.forms[0].display.value = strtxt
            strtxt = strtxt.substring(1, strlaenge) + strtxt.substring(0, 1);
            setTimeout("scroll();", 200);
        }
</script>

</head>
<body onload="scroll()">
	<%
		ResultSet noticeRs = mainDAO.mainNoticeList();
		ResultSet productRs = mainDAO.mainProductList();
	%>
<div class="wrapper_main">
<div class="first_line">
	<div class="noti_preview">
	<div class="title_more">
	<p>공지사항</p><a href="noticeList.no">더 보기 ></a></div>
		<table>
			<thead>
				<tr>
					<th width="15%">번호</th>
					<th width="50%">제목</th>
					<th width="20%">작성자</th>
					<th width="25%">날짜</th>
				</tr>
			</thead>
			<tbody>
				<%
					while (noticeRs.next()) {
						NoticeDTO data = new NoticeDTO();
						int notiNo = noticeRs.getInt("NOTI_NO");
						String notiTitle = noticeRs.getString("NOTI_TITLE");
						String notiDate = noticeRs.getString("NOTI_DATE");
						String empName = noticeRs.getString("EMP_NAME");
// 						out.print("<tr><td>" + notiNo + "</td><td>" + notiTitle + "</td><td>" + empName + "</td><td>" + notiDate
// 								+ "</td></tr>");
					
				%>
				<tr><td><%=notiNo%></td><td><a href="noticeView.no?no=<%=notiNo %>" style="color: black; text-decoration: none;"
				onmouseover="this.style.color='#0074E9'"
				onmouseout="this.style.color='black'"><%=notiTitle%></a></td><td><%=empName%></td><td><%=notiDate%></td></tr>
				
				<%} %>
			</tbody>
		</table>
	</div>
<div class="calender" id="datepicker"></div>
</div>
<hr>
<div class="display_board">
<h2>오늘의 한마디</h2>
    <form><p><input type="text" name="display" readonly="readonly"></p></form>
</div>
<div class="noti_preview">
<hr>
	<div class="title_more">
	<p>입고현황</p><a href="productList.pd">재고관리 ></a></div>
	<table>
		<thead>
			<tr>
				<th width="10%">제품번호</th>
				<th width="30%">제품명</th>
				<th width="10%">재고</th>
				<th width="10%">입고수량</th>
				<th width="30%">거래처명</th>
				<th width="10%">입고일</th>
			</tr>
		</thead>
		<tbody>
		<%
			while(productRs.next()){
				ProductDTO data = new ProductDTO();
				int proNo = productRs.getInt("PRO_NO");
				String proName = productRs.getString("PRO_NAME");
				String proStock = productRs.getString("PRO_STOCK");
				String proStoring = productRs.getString("PRO_STORING");
				String cusName = productRs.getString("CUS_NAME");
				String proDate = productRs.getString("PRO_LAST_DATE");
// 				out.print("<tr><td>" + proNo + "</td><td>" + proName + "</td><td>" + proStock +  "</td><td>" + proStoring + "</td><td>" + cusName + "</td><td>" + proDate
// 						+ "</td></tr>");
// 			}
		%>
		
		<tr><td><%=proNo%></td><td><a href="productSearch.pd?colum=제품명&searchData=<%=proName%>" style="color: black; text-decoration: none;"
				onmouseover="this.style.color='#0074E9'"
				onmouseout="this.style.color='black'"><%=proName %></a></td><td><%=proStock %></td><td><%=proStoring%></td><td><a href="productSearch.pd?colum=거래처명&searchData=<%=cusName%>" style="color: black; text-decoration: none;"
				onmouseover="this.style.color='#0074E9'"
				onmouseout="this.style.color='black'"><%=cusName%></a></td><td><%=proDate%></td></tr>
						
						<%} %>
		</tbody>
	</table>
</div>
</div>
</body>
</html>