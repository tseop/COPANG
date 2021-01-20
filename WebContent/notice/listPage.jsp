<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COPANG</title>
<script type="text/javascript">
function rank(){
	<% int rank = (int) session.getAttribute("EMP_RANK"); 
	 if (rank == 1) { %>
		 alert("작성 권한이 없습니다."); 
		 document.location.href="noticeList.no";
	 <% } else { %>
	 	document.laocation.href="noticeWrite.jsp";
	<% } %>
 }
</script>
</head>
<body>
	<div class="customer">
		<div class="table">
			<div class="search_area">
				<form action="noticeSearch.no" method="get">
					<h1>공지게시판</h1>
					<ul style="margin-left: auto; width: fit-content;">
						<li class="search_box"><input type="text"
							placeholder="게시물 제목" name="searchTitle" autofocus="autofocus"
							required="required"> <input type="submit" value="검색"></li>
					</ul>
				</form>
				<hr>
				<table>
					<thead>
						<tr>
							<th width="10%">번호</th>
							<th width="50%">제목</th>
							<th width="20%">작성자</th>
							<th width="20%">날짜</th>
						</tr>
					</thead>
					<c:forEach items="${list}" var="notice">
						<tr>
							<td>${notice.notiNo }</td>
							<td><a href='noticeView.no?no=${notice.notiNo}'
								style="color: black; text-decoration: none;"
								onmouseover="this.style.color='#0074E9'"
								onmouseout="this.style.color='black'">${notice.notiTitle}</a></td>
							<td>${notice.empName }</td>
							<td>${notice.notiDate }</td>
						</tr>
					</c:forEach>
					<tfoot>
						<tr>
							<td colspan="7"
								style="border: 1px solid white; padding-top: 2rem;"><jsp:include
									page="page.jsp" flush="true" /></td>
						</tr>
					</tfoot>
				</table>
				<br>
				<div></div>
				<div class="search_area">
					<ul>
						
						<li><input type="button" value="게시글쓰기"
							 onClick="rank()"></li>
						
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>