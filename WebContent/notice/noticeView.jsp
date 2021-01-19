<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="notice.NoticeDTO"%>
<%@ page import="notice.NoticeDAO"%>
<jsp:useBean id="noticeView" class="notice.NoticeDAO" scope="page" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COPANG</title>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript">
// 	$function(){
// 		$("#btnList").on("click", function(){
// 			location.href="${path}/notice_servlete/noticeRegister.no"; /* 업로드 경로 설정하는거 같은데.. 이게 맞는건지..? upload폴더에 넣을 순 없는건가?  */
// 		});
// 	});
</script>
</head>
<body>
	<div class="customer">
		<div class="noti_view">
			<%
				NoticeDTO noticeDTO = (NoticeDTO) request.getAttribute("noticeDTO");
				String fileName = (String)request.getAttribute("fileName");
				//long fileSize = (long)request.getAttribute("fileSize");
			%>
			<h2>공지사항</h2>
			<hr>
			<table>
				<thead>
					<tr style="height: 10%;">
						<td class="width">글 제목</td>
						<td colspan="2"><%=noticeDTO.getNotiTitle()%></td>
					</tr>
					<tr style="height: 10%;">
						<td>작성자</td>
						<td colspan="2"><%=noticeDTO.getEmpNo()%></td>
					</tr>
					<tr style="height: 10%;">
						<td>작성일자</td>
						<td colspan="2"><%=noticeDTO.getNotiDate()%></td>
					</tr>
					<tr style="height: 70%;">
					<tr>
						<td>첨부파일</td>
						<td colspan="2"><a href="FileDown?fileName=<%=fileName%>"><%=fileName %></a></td>
						<!-- 더 추가해야하는데 모르겠다... -->
					</tr>
					<tr>
						<td class="height">내용</td>
						<td colspan="2"><%=noticeDTO.getNotiContent()%></td>
					</tr>
				</thead>
			</table>

			<br> <br> <br>
			<div class="search_area">
				<ul style="justify-content: flex-end;">
					<li><input type="button" value="목록"
						onClick="location.href='noticeList.no'" class="btn"></li>&emsp;&emsp;
					<li><input type="button" value="수정"
						onClick="location.href='noticeUpdateSearch.no?no=<%=noticeDTO.getNotiNo()%>'"
						class="btn"></li>&emsp;&emsp;
					<li><input style="background: #D71427" type="button"
						value="삭제하기"
						onClick="location.href='noticeDelete.no?no=<%=noticeDTO.getNotiNo()%>'"
						class="btn"></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>