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

<style type="text/css">
.wrapper_main{padding: 1rem 2rem 6rem 2rem; min-width: 40rem; width: 80%;margin: auto;}
.title_more{ display: flex;justify-content: space-between; margin: none;}
.title_more p{margin-bottom: 0.5rem; font-weight:700; color:#366afe; padding-left: 1rem;}
.title_more a{padding-right:0.5rem; cursor:pointer; text-decoration: none; font-size: 0.7rem; color:#366afe;}
.first_line {display: flex; justify-content: center;width: 100%}
.noti_preview {width: 100%;margin: auto;}
.noti_preview table{width: 100%;min-width: 22rem;margin: auto;}
/* .noti_preview table tbody tr:hover{background: #e8e8e8;} */
.noti_preview table tr{border-bottom: 1px solid #ddd;}
.noti_preview table tr th{vertical-align: middle; background-color:#f3f3f3; color: black; font-size:0.7rem; height: 1.5rem; padding: 0.5rem; border-bottom:1px solid #ddd;}
.noti_preview table tr td{text-align: center;padding: 0.5rem; font-size: 0.7rem;}
.calender { padding-left: 5rem; padding-top:1.5rem; width: fit-content; margin: auto;}
.ui-datepicker{font-size: 16px;}
.ui-datepicker select.ui-datepicker-month{ width:30%; font-size: 11px; }
.ui-datepicker select.ui-datepicker-year{ width:40%; font-size: 11px; }
.display_board p{padding: 2rem;text-align: center;}
.display_board input {width: 50%; height: 1rem; padding: 0.5rem; border: 1px solid #ddd;}
</style>

</head>
<body>
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

<div class="noti_preview">
	<div class="title_more">
	<p>입고현황</p><a href="productList.pd">재고관리 ></a></div>
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