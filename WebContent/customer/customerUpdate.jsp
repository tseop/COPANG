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
<div class="reg_form">
<h1>거래처 정보를 입력해주세요</h1>
<hr>
<form action="customerUpdate.cu" method="post">
	<table>
		<tr>
         <th><span class="required_content">*</span>거래처 명</th>
         <td><input type="text" name="cusName" required="required" value=""></td>
      </tr>
      </table>
      <table>
      <tr>
         <th><span class="required_content">*</span>담당자</th>
         <td><input type="text" name="cusManager" required="required" value=""></td>
       </tr>
       </table>
       <table>
       <tr>
         <th><span class="required_content">*</span>전화번호</th>
         <td><input type="text" name="cusTel" placeholder="000-0000-0000" required="required" value=""></td>
       </tr>
       </table>
       <table>
       <tr>
         <th><span class="required_content">*</span>사업자번호</th>
         <td><input type="text" name="businessNo" required="required" value=""></td>
       </tr>
	</table>	
	<div class="search_area">
	<ul style="justify-content: center;">
		<li><input type="submit" value="등록하기"></li>
		<li><input type="button" value="목록으로" onClick="location.href='customerList.cu'"></li>
	</ul>
	</div>
</form>
</div>
</div>
</body>
</html>