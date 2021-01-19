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