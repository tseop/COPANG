<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
#employee {
   position: absolute;
   width: 800px;
   height: 400px;
   top: 200px;
   left: 600px;
   background-color: aqua;
}

.register, .login {
   width: 100px;
   height: 60px;
}

.reset {
   font-size: 20px;
}

h1 {
   text-align: center;
   color: purple;
}

ul {
   list-style-type: none;
}
</style>
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
         x.pw.value = "";
         x.pw.focus();
         return;
      }
      else{
         document.getElementById('check').innerHTML="사용가능한 비밀번호입니다.";
         document.getElementById('check').style.color='blue';
         return;
      }
   }
   function check_pw2(x){			//비밀번호 재확인 
      var pw = x.pw.value;
      var pw2 = x.pw2.value;
      if(pw == pw2){
         document.getElementById('check2').innerHTML='비밀번호가 일치합니다.'
         document.getElementById('check2').style.color='blue';
         return;
        }
        else{
           document.getElementById('check2').innerHTML='비밀번호가 일치하지 않습니다.';
           document.getElementById('check2').style.color='red';
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
</head>
<body>
   <div id="employee">
      <h1>회원가입</h1>
      <form action="employeeRegister.ep" method="get">
      <input type="hidden" name="rank" value="0">
         <ul>
            <li>   
               <select name="dep" required style="width:100px">
                  <option value="">부서선택</option>
                  <option value="1">물류팀</option>
                  <option value="2">경영지원</option>
                  <option value="3">인사관리</option>
               </select>
            </li>
            <li><label for="no">사원번호</label>
            <input type="text" name="no" onkeypress = "inNumber()" size="20"maxlength="10" 
            autofocus="autofocus" required="required" placeholder="사원번호를 입력하세요">
            <input type="button" required="required" value = "중복체크" onclick="win01(this.form)">
            </li>
            <li><label for="pw">비밀번호</label> 
            <input type="password" name="pw" id="pw" onchange="check_pw(this.form)" size="20" required="required" maxlength="10" placeholder="비밀번호 입력"> &nbsp;&nbsp; <span
               name="check" id="check"></span></li>
            <li><label for="pwc">비밀번호 확인</label> <input type="password" name="pw2" id="pw2" onchange="check_pw2(this.form)" size="20" required="required" maxlength="10" placeholder="비밀번호 확인"> &nbsp;&nbsp; <span
               name="check2" id="check2"></span></li>
            <li><label for="name" size="20">&nbsp;이&nbsp;&nbsp;름&nbsp;&nbsp;</label>
               <input type="text" name="name" size="20" maxlength="10" autofocus="autofocus" required="required" placeholder="이름을 입력하세요">
            </li>
            <label for="security">주민등록번호</label>
            <input type="text" name="c1" required="required" size="10" maxlength="6"> - <input type="password" name="c2" required="required" size="10" maxlength="7">
            <input type="button" required="required" value="조회" onclick="c_check(this.form)">
            
            <li><label for="tel" width="20">핸&nbsp;드&nbsp;폰</label> 
            	<input type="text" name="tel" size="20" maxlength="20" required="required" placeholder="010-3114-1041">
            </li>
               
            <li>
            	<label for="addr">주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</label>
        		<input type="text" name="addr" size="20" maxlength="100" required="required" placeholder="주소입력">
            </li>
            <li>
            	<input type="image" src="images/member.png" class="register"> 
            	<input type="reset" value="되돌리기" class="reset"> 
            	<a href="#"> <img src="images/login.jpg" class="login"></a>
            </li>
         </ul>
      </form>
   </div>
</body>
</html>