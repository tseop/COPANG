<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>
<script type="text/javascript">
   <!--뒤로가기기능-->
   function goBack() { 
      window.history.back();
   }

    
</script>
<style type="text/css">

</style>
<meta charset="UTF-8">
<title>COPANG</title>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/style.css">
<style type="text/css">
.write_area{width: 60%; margin: auto;}
.write_area h1{font-size: 1rem;font-weight: 700;}
.write_area input[type=text]{border: 1px solid #fff;padding: 0.3rem;width: 98%;margin-bottom: 0.5rem;}
.write_area input[type=button],[type=submit]{border: 0px; background: #366afe; color:white; padding: 0.8rem 1.5rem; font-size: 0.7rem;}
.write_area .btns {display: flex;justify-content: space-between;margin: 2rem 0;} 
</style>
</head>
<body>
<div class="customer">
<div class="write_area">
   <h1>게시글 쓰기</h1>
<hr>
   <form action="boardRegister.bo" method="get">
      <ul>
         <li><input type="hidden" name="readcount" value="0"></li>
         <li><input type="text" name="title" autofocus="autofocus"
            required="required" placeholder="제목을 입력하세요" size="50"
            mexlength="100"></li>
         <li><textarea name="content"
               placeholder="내용을 입력하세요" id="editor"></textarea></li>
      </ul>
      <ul class="btns">
	      <li><input type="submit"></li>
	      <li><input type="button" value="취소" onClick="goBack()"></li> <!--뒤로가기 삽입-->
      </ul>
   </form>
   
    <script>
       CKEDITOR.replace( 'content' );
    </script>
</div>
</div>
</body>
</html>