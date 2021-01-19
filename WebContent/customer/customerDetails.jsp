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
$(function() {
	 var updt = document.getElementById('updt');
	 var empdept = '<%=(int)session.getAttribute("EMP_DEPT")%>';
	 var emprank = '<%=(int)session.getAttribute("EMP_RANK")%>';
	    console.log(empdept);
	    console.log(emprank);
	 if(empdept==1){
	     $updt = $('.updt').attr('disabled', false);
	     $updt = $('.updt').css('color', '#366afe');
	     $updt = $('.updt').css('font-weight', '700');
	     updt = $('.updt').css('cursor', 'pointer');
	 }else if(emprank==2){
	     $updt = $('.updt').attr('disabled', false);
	     $updt = $('.updt').css('color', '#366afe');
	     $updt = $('.updt').css('font-weight', '700');
	     $updt = $('.updt').css('cursor', 'pointer');
	 }else if(emprank==3){
	     $updt = $('.updt').attr('disabled', false);
	     $updt = $('.updt').css('color', '#366afe');
	     $updt = $('.updt').css('font-weight', '700');
	     $updt = $('.updt').css('cursor', 'pointer');
	 }  
})

function button_event(){
	if (confirm("정말 삭제하시겠습니까??") == true){
   		/* location.href='customerDelete.cu'; */
   		document.update.action = 'customerDelete.cu';//해당 버튼을 눌럿을때 action의 경로를 바꾸어줌
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
<h1>거래처 상세보기</h1>
<hr>
<form name="update" action="customerUpdate.cu" method="post">
<input type="hidden" name="num" value=<%=customerDTO.getCusNo() %>>
	<table><thead>
		<tr>
         <th><span class="required_content">*</span>거래처 명</th>
         <td><input type="text" name="cusName" required="required" maxlength="50" value="<%=customerDTO.getCusName() %>">
         		<input type="button" value="수정" onclick="button_submit()" class="updt" disabled="true"></td>
      </tr>
      </thead></table>
      <table><thead>
      <tr>
         <th><span class="required_content">*</span>담당자</th>
         <td><input type="text" name="cusManager" required="required" maxlength="20" value="<%=customerDTO.getCusManager() %>">
       			 <input type="button" value="수정" onclick="button_submit()" class="updt" disabled="true"></td>
       </tr>
       </thead></table>
       <table><thead>
       <tr>
         <th><span class="required_content">*</span>전화번호</th>
         <td><input type="text" name="cusTel" required="required" maxlength="15" value="<%=customerDTO.getCusTel() %>">
         		<input type="button" value="수정" onclick="button_submit()" class="updt" disabled="true"></td>
       </tr>
       </thead></table>
       <table><thead>
       <tr>
         <th><span class="required_content">*</span>사업자번호</th>
         <td><input type="text" name="businessNo" required="required" maxlength="30" value="<%=customerDTO.getBusinessNo() %>">
         		<input type="button" value="수정" onclick="button_submit()" class="updt" disabled="true"></td>
       </tr>
	</thead></table>	
	<div class="search_area">
	<ul style="justify-content: center;">
		<li><input type="button" value="목록으로" onClick="location.href='customerList.cu'"></li>
		<li><input style="background: #D71427" type ="button" value="삭제하기" disabled="true" onclick="button_event()" class="btn"></li>
	</ul>
	</div>
</form>
</div>
</div>
</body>
</html>