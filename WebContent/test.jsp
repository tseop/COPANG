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
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style type="text/css">
.wrapper_main {
	display: flex;
	padding: 2rem;
	min-width: 40rem;
}

.box1 {
	border: 1px solid black;
}

.box2 {
	border: 1px solid red;
}

.box2 table tr {
	border: 1px solid pink;
}

.box2 table tr td {
	border: 1px solid pink;
}

.box3 {
	border: 1px solid blue;
}
</style>
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
</head>
<body>
	<%
		ResultSet noticeRs = mainDAO.mainNoticeList();
		ResultSet productRs = mainDAO.mainProductList();
	%>
	<div class="wrapper_main">
		<div class="box1">
			<table>
				<thead>
					<tr>
						<th width="10%">번호</th>
						<th width="60%">제목</th>
						<th width="20%">작성자</th>
						<th width="10%">날짜</th>
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
							out.print("<tr><td>" + notiNo + "</td><td>" + notiTitle + "</td><td>" + empName + "</td><td>" + notiDate
									+ "</td></tr>");
						}
					%>
				</tbody>
			</table>
		</div>
		<div class="box2">
			<table>
				<thead>
					<tr>
						<th width="10%">제품번호</th>
						<th width="10%">제품명</th>
						<th width="10%">재고</th>
						<th width="30%">입고수량</th>
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
							int proStock = productRs.getInt("PRO_STOCK");
							int proStoring = productRs.getInt("PRO_STORING");
							String cusName = productRs.getString("CUS_NAME");
							String proDate = productRs.getString("PRO_LAST_DATE");
							out.print("<tr><td>" + proNo + "</td><td>" + proName + "</td><td>" + proStock +  "</td><td>" + proStoring + "</td><td>" + cusName + "</td><td>" + proDate
									+ "</td></tr>");
						}
					%>
				</tbody>
			</table>
		</div>
		<div class="box3" id="datepicker"></div>
	</div>
</body>
</html>