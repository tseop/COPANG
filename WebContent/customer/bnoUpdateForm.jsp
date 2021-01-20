<%@page import="customer.CustomerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COPANG</title>
<script type="text/javascript">

</script>
</head>
<body>
<%
CustomerDTO customerDTO = (CustomerDTO) request.getAttribute("customerDTO");
%>
<form name="update" action="customerUpdate.cu" method="post">
<input type="hidden" name="num" value=<%=customerDTO.getCusNo() %>>
 <table><thead>
       <tr>
         <th><span class="required_content">*</span>사업자 번호</th>
         <td><input type="text" name="cusTel" required="required" maxlength="15" value=""></td>
       </tr>
</thead></table>
<input type="submit" value="수정하기">
</form>
</body>
</html>