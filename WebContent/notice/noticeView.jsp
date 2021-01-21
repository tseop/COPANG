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
<link rel="stylesheet" href="css/style.css?v=210122">
<script type="text/javascript">
	function del() {

		if (confirm("정말로 게시글을 삭제하시겠습니까?") == true) {
			document.update.action = "noticeDelete.no";
			document.update.submit();
		} else {
			return false;
		}
	}
</script>
</head>
<body>
	<div class="customer">
		<div class="noti_view">
			<%
				NoticeDTO noticeDTO = (NoticeDTO) request.getAttribute("noticeDTO");
				//String empName = (String)request.getAttribute("empName");
				//String fileName = (String)request.getAttribute("fileName");
				//long fileSize = (long)request.getAttribute("fileSize");
			%>
			<h2>공지사항</h2>
			<hr>
			<form name = "update" action = "noticeUpdateSearch.no" method="post"> 
			<input type="hidden" name="no" value="<%=noticeDTO.getNotiNo()%>">
			<table>
				<thead>
					<tr style="height: 10%;">
						<td class="width">글 제목</td>
						<td colspan="2"><%=noticeDTO.getNotiTitle()%></td>
					</tr>
					<tr style="height: 10%;">
						<td>작성자</td>
						<td colspan="2"><%=noticeDTO.getEmpName()%></td>
					</tr>
					<tr style="height: 10%;">
						<td>작성일자</td>
						<td colspan="2"><%=noticeDTO.getNotiDate()%></td>
					</tr>
					<tr style="height: 70%;">
					<tr>
						<td>첨부파일</td>
						<%
							if (noticeDTO.getFileName() == null) {
						%>
						<td colspan="2">첨부파일 없음</td>
						<%
							} else {
						%>

						<td colspan="2"><a
							href="FileDown?fileName=<%=noticeDTO.getFileName()%>"><%=noticeDTO.getFileName()%></a></td>
						<%
							}
						%>

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
					<%
						int EMP_RANK = (int) session.getAttribute("EMP_RANK");
						String deptName = null;
						int EMP_DEPT = (int) session.getAttribute("EMP_DEPT");

						if (EMP_RANK == 1 && EMP_DEPT == 3 || EMP_RANK == 2 || EMP_RANK == 3) { //버튼 세션값에 따라 나타내는거
					%>
					<li><input type="submit" value="수정"
						class="btn"></li>&emsp;&emsp;

					<li><input style="background: #D71427" type="button"
						value="삭제" onClick="del()"></li>
					<%
						}
					%>
				</ul>
			</div>
			</form> 
		</div>
	</div>
</body>
</html>