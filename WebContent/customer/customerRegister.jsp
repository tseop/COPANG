<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COPANG</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<style type="text/css">
.reg_form{width: 50%;margin: auto;}
.reg_form table{margin: auto;font-size: 0.9rem;font-weight: 100;margin-bottom: 1rem;}
.reg_form table tr{height: 3rem;}
.reg_form table th{width: 8rem;vertical-align: middle;text-align: left;}
.reg_form table td{vertical-align: middle;}
.reg_form table th>span.required_content{position:absolute;margin-left:-.65em;color:red;}
.reg_form hr{margin: 1rem;}
.reg_form h1{padding-left: 3rem;}
.reg_form input[type=text]{padding: 0.5rem; border: 1px solid #ccc;width: 15rem;}
.reg_form .search_area ul li{margin:2rem 2rem;}

</style>
</head>
<body>
<div class="customer">
<div class="reg_form">
<h1>거래처 정보를 입력해주세요</h1>
<hr>
<form action="customerRegister.cu" method="post">
	<table>
		<tr>
         <th><span class="required_content">*</span>거래처 명</th>
         <td><input type="text" name="cusName" required="required"></td>
      </tr>
      </table>
      <table>
      <tr>
         <th><span class="required_content">*</span>담당자</th>
         <td><input type="text" name="cusManager" required="required"></td>
       </tr>
       </table>
       <table>
       <tr>
         <th><span class="required_content">*</span>전화번호</th>
         <td><input type="text" name="cusTel" placeholder="000-0000-0000" required="required"></td>
       </tr>
       </table>
       <table>
       <tr>
         <th><span class="required_content">*</span>사업자번호</th>
         <td><input type="text" name="businessNo" required="required"></td>
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