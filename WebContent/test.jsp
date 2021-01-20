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
.wrapper_main{padding: 2rem;min-width: 40rem; width: 80%;margin: auto;}
.firs_tline {display: flex; justify-content: space-between;}
.noti_preview {	border: 1px solid black; width: 40%;}
.calender {	border: 1px solid blue; width: 40%}
.box2 {	border: 1px solid red;}

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
	//////////////////////////////////////////////////////////////////
	var strtxt = ("저의 홈페이지를 방문해 주셔서 감사합니다. 사장님 한마디 ㅎㅎ/끝. ");
	var strlaenge = strtxt.length;
	window.onload = function() {
		document.forms[0].display.value = strtxt;
		strtxt = strtxt.substring(1, strlaenge) + strtxt.substring(0, 1);
		setTimeout("scroll();", 200);
		}
</script>

</head>
<body>
	<%
		ResultSet noticeRs = mainDAO.mainNoticeList();
		ResultSet productRs = mainDAO.mainProductList();
	%>
<div class="wrapper_main">
<div class="first_line">
	<div class="noti_preview">
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
<div class="calender" id="datepicker"></div>
</div>

<div class="display_board">
    <form><p><input type="text" name="display" readonly="readonly"></p></form>
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
</div>
</body>
</html>