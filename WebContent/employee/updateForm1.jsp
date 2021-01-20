<%@page import="employee.EmployeeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script>

   function inNumber(){    //사원번호 숫자만입력
      if(event.keyCode < 48 || event.keyCode > 57){
         event.returnValue = false;
      }   
   }
   
   function win01(noform){  //사원번호 중복체크
      if(noform.no.value == ""){
         alert("사원번호를 입력해주세요");
         return;
      }
      window.open("noDupleCheck.ep?no="+noform.no.value,"win01","width=300 height=250");
   }
   
   function check_pw(x){		//비밀번호 조건체크
      var pw = x.pw.value;
      var pw2 = x.pw2.value;
      var sc = ["!","@","#","$","%"];
      var check_sc = 0;
      
      if(pw.length < 6 || pw.length > 14){
         document.getElementById('check').innerHTML="비밀번호는 6글자이상 14글자 이하만 사용가능합니다.";
         document.getElementById('check').style.color='red';
         document.getElementById('check2').style.fontSize='12px';
         x.pw.value = "";
         x.pw.focus();
         return;
      }
      for(var i = 0;i < sc.length ;i++){
         if(pw.indexOf(sc[i]) != -1){
            check_sc = 1;
         }
      }
      if(check_sc == 0){
         document.getElementById('check').innerHTML="특수문자가 하나이상 들어가야합니다.";
         document.getElementById('check').style.color='red';
         document.getElementById('check').style.fontSize='12px';
         x.pw.value = "";
         x.pw.focus();
         return;
      }
      else{
         document.getElementById('check').innerHTML="사용가능한 비밀번호입니다.";
         document.getElementById('check').style.color='blue';
         document.getElementById('check').style.fontSize='12px';
         return;
      }
   }
   function check_pw2(x){			//비밀번호 재확인 
      var pw = x.pw.value;
      var pw2 = x.pw2.value;
      if(pw == pw2){
         document.getElementById('check2').innerHTML='비밀번호가 일치합니다.'
         document.getElementById('check2').style.color='blue';
         document.getElementById('check2').style.fontSize='12px';
         return;
        }
        else{
           document.getElementById('check2').innerHTML='비밀번호가 일치하지 않습니다.';
           document.getElementById('check2').style.color='red';
           document.getElementById('check2').style.fontSize='12px';
           x.pw2.value="";
           x.pw2.focus();
           return;
           
        }
   }

   function c_check(x) {   //주민등록번호 유효성 검사
      var yy = x.c1.value.substring(0,2);
      var mm = x.c1.value.substring(2,4);
      var dd = x.c1.value.substring(4,6);
      var gender = x.c2.value.substring(0,1);
      var ck = 0;
      if(x.c1.value.length != 6 || x.c2.value.length != 7 || yy < 20 || mm < 1 || mm > 12 || dd < 0 || dd > 31 || gender > 2 || gender < 1){
         alert("잘못된 주민등록 번호입니다.");
         x.c1.value = x.c2.value = "";
         x.c1.focus();
         return;
      }
      var total = x.c1.value + x.c2.value;
      for (i=0;i<12;i++){
         ck += (i%8 + 2)*total.substring(i,i+1);
      }
      ck = (11-(ck&11)) % 10;
      if(parseInt(ck) != parseInt(total.substring(12,13))){
         alert("잘못된 주민등록번호입니다.");
         x.c1.value=x.c2.value = "";
         x.c1.focus();
         return;
      }
      alert("잘 입력하셨습니다.");
   }
</script>
<meta charset="UTF-8">
<title>KHJSP</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

	<%
		EmployeeDTO empDTO = (EmployeeDTO) request.getAttribute("empDTO");
		String dept_name = null;
		int index = empDTO.getEmpSecurity().indexOf("-");
		int len = empDTO.getEmpSecurity().length();
		String c1 = empDTO.getEmpSecurity().substring(0, index);
		String c2 = empDTO.getEmpSecurity().substring(index+1);
		//999-999
		//0123456 index = 3 
		if (empDTO.getDeptNo() == 1) {
			dept_name = "물류팀";
		} else if (empDTO.getDeptNo() == 2) {
			dept_name = "인사관리";
		} else if (empDTO.getDeptNo() == 3) {
			dept_name = "경영지원";
		} else {
			dept_name = "부서선택";
		}
	%>
	<div class="customer">
		<div class="emp_reg_form">
			<form action="update1.ep" method="get">
				<div class="select_box_top">
					<h1>개인 정보수정</h1>
					<select name="dep" class="select_box">
						<option value="<%=empDTO.getDeptNo()%>"><%=dept_name%></option>

					</select>
				</div>
				<hr>
				<table>
					<thead>
						<tr>
							<!--수정 불가 -->
							<th><span class="required_content">*</span><label for="no">사원번호</label></th>
							<td><input type="text" name="no" size="20" maxlength="10"
								value="<%=empDTO.getEmpNo()%>"
								placeholder="<%=empDTO.getEmpNo()%>" width="8rem"
								readonly="readonly"></td>
						</tr>
					</thead>
				</table>
				<table>
					<thead>
						<tr>
							<!--누구든지 수정 가능 -->
							<th><span class="required_content">*</span><label for="pw">비밀번호</label></th>
							<td><input type="password" name="pw" id="pw"
								onchange="check_pw(this.form)" size="20" required="required"
								maxlength="10" placeholder="비밀번호 입력"><br> <span
								name="check" id="check"><br></span></td>
						</tr>
						<tr>
							<!--누구든지 수정 가능 -->
							<th><span class="required_content">*</span><label for="pwc">비밀번호
									확인</label></th>
							<td><input type="password" name="pw2" id="pw2"
								onchange="check_pw2(this.form)" size="20" required="required"
								maxlength="10" placeholder="비밀번호 확인"><br> <span
								name="check2" id="check2"></span></td>
						</tr>
					</thead>
				</table>
				<table>
					<thead>
						<tr>
							<!--수정 불가 -->
							<th><span class="required_content">*</span><label for="name">이름</label></th>
							<td><input type="text" size="20" maxlength="10" value="<%=empDTO.getEmpName()%>"
								placeholder="<%=empDTO.getEmpName()%>" readonly="readonly">
								<input type="hidden" name="name"
								value="<%=empDTO.getEmpName()%>"></td>
						</tr>
					</thead>
				</table>
				<table>
					<thead>
						<tr>
							<!--수정 불가 -->
							<th><span class="required_content">*</span><label
								for="security">주민등록번호</label></th>
							<td><input type="text" name="c1" value="<%=c1 %>" placeholder="<%=c1%>"
								required="required" size="10" maxlength="6" class="security_no"
								readonly> - <input type="password" name="c2"
								value="<%=c2%>" placeholder="*******" required="required"
								size="10" maxlength="7" class="security_no" readonly></td>
						</tr>
					</thead>
				</table>
				<table>
					<thead>
						<tr>
							<!--누구든지 수정 가능 -->
							<th><span class="required_content">*</span><label for="tel">핸드폰</label></th>
							<td><input type="text" name="tel" size="20" maxlength="20"
								required="required" value="<%=empDTO.getEmpTel()%>"></td>
						</tr>
					</thead>
				</table>
				<table>
					<thead>
						<tr>
							<!--누구든지 수정 가능 -->
							<th><span class="required_content">*</span><label for="addr">주소</label></th>
							<td><input type="text" name="addr" size="20" maxlength="100"
								required="required" value="<%=empDTO.getEmpAddr()%>"></td>
						</tr>
					</thead>
				</table>
				<div class="search_area">
					<ul style="justify-content: center;">
						<li><input type="submit" value="수정하기"></li>
					</ul>
				</div>
			</form>
		</div>

	</div>
</body>
</html>