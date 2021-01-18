<%@page import="customer.CustomerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COPANG</title>

<script type="text/javascript">


function button_event(){
	if (confirm("정말 삭제하시겠습니까??") == true){
   		/* location.href='customerDelete.cu'; */
   		document.update.action = 'customerDelete.cu'; 
   		//해당 버튼을 눌럿을때 action의 경로를 바꾸어줌
   		document.update.submit();
	}else{
	    return false;
	}
}

function button_submit(){
	if (confirm("정말 수정하시겠습니까??") == true){//확인
		document.update.submit();
	}else{//취소
		 return false;
	}
}
</script>

</head>
<body>

<div class="customer">
<div class="reg_form">
<%
CustomerDTO customerDTO = (CustomerDTO) request.getAttribute("customerDTO");
%>
<h1>거래처 수정</h1>
<hr>
<form name="update" action="customerUpdate.cu" method="post">
<input type="hidden" name="num" value=<%=customerDTO.getCusNo() %>>
	<table>
		<tr>
         <th><span class="required_content">*</span>거래처 명</th>
         <td><input type="text" name="cusName" required="required" value="<%=customerDTO.getCusName() %>"></td>
      </tr>
      </table>
      <table>
      <tr>
         <th><span class="required_content">*</span>담당자</th>
         <td><input type="text" name="cusManager" required="required" value="<%=customerDTO.getCusManager() %>"></td>
       </tr>
       </table>
       <table>
       <tr>
         <th><span class="required_content">*</span>전화번호</th>
         <td><input type="text" name="cusTel" required="required" value="<%=customerDTO.getCusTel() %>"></td>
       </tr>
       </table>
       <table>
       <tr>
         <th><span class="required_content">*</span>사업자번호</th>
         <td><input type="text" name="businessNo" required="required" value="<%=customerDTO.getBusinessNo() %>"></td>
       </tr>
	</table>	
	<div class="search_area">
	<ul style="justify-content: center;">
		<li><input type="button" value="수정하기" onclick= "button_submit()"></li>
		<li><input type="button" value="목록으로" onClick="location.href='customerList.cu'"></li>
		<li><input style="background: #D71427" type ="button" value="삭제하기" onclick="button_event()" class="btn"></li>
	</ul>
	</div>
</form>
</div>
</div>
</body>
</html>