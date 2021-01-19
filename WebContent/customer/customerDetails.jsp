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
function update(){
window.screen.width
window.screen.height
	var popupWidth = 400;
	var popupHeight = 300;
	var popupX = (window.screen.width / 2) - (popupWidth / 2);
	var popupY= (window.screen.height / 2) - (popupHeight / 2);
window.open('customer/bnoUpdateForm.jsp', '거래처 사업자번호 변경', 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);

}

function mypage_check(){ 
<%-- 	<%CustomerDTO customerDTO = (CustomerDTO) request.getAttribute("customerDTO"); %> --%>
    var empdept = '<%=(int)session.getAttribute("EMP_DEPT")%>';
    var emprank = '<%=(int)session.getAttribute("EMP_RANK")%>';
    console.log(empdept);
    console.log(emprank);
      if(empdeptno==0){
    	 disabled=false;
     }else if(emprank==0){
    	 disabled=false;
     } 
}   


</script>

</head>
<body onload="mypage_check()">

<div class="customer">
<div class="reg_form">
<%
CustomerDTO customerDTO = (CustomerDTO) request.getAttribute("customerDTO");
%>
<h1>거래처 수정</h1>
<hr>
<form name="update" action="customerUpdate.cu" method="post">
<input type="hidden" name="num" value=<%=customerDTO.getCusNo() %>>
	<table><thead>
		<tr>
         <th><span class="required_content">*</span>거래처 명</th>
         <td><input type="text" name="cusName" required="required" maxlength="50" value="<%=customerDTO.getCusName() %>"></td>
      </tr>
      </thead></table>
      <table><thead>
      <tr>
         <th><span class="required_content">*</span>담당자</th>
         <td><input type="text" name="cusManager" required="required" maxlength="20" value="<%=customerDTO.getCusManager() %>"></td>
       </tr>
       </thead></table>
       <table><thead>
       <tr>
         <th><span class="required_content">*</span>전화번호</th>
         <td><input type="text" name="cusTel" required="required" maxlength="15" value="<%=customerDTO.getCusTel() %>"></td>
       </tr>
       </thead></table>
       <table><thead>
       <tr>
         <th><span class="required_content">*</span>사업자번호</th>
         <td><%=customerDTO.getBusinessNo() %><input type="button" value="수정하기" onclick="update()" disabled="disabled"></td>
       </tr>
	</thead></table>	
	<div class="search_area">
	<ul style="justify-content: center;">
		<li><input type="button" value="목록으로" onClick="location.href='customerList.cu'"></li>
	</ul>
	</div>
</form>
</div>
</div>
</body>
</html>