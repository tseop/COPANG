<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.ckeditor.com/ckeditor5/24.0.0/decoupled-document/ckeditor.js"></script>
<script type="text/javascript">
	<!--뒤로가기기능-->
	function goBack() { 
		window.history.back();
	}

    
</script>
<style type="text/css">
li {
	list-style-type: none;
}
</style>
<meta charset="UTF-8">
<title>KHJSP</title>
</head>
<body>
	<h1>게시글 쓰기</h1>

	<form action="boardRegister.bo" method="get">
		<ul>
			<li><input type="hidden" name="readcount" value="0"></li>
			<li><input type="text" name="title" autofocus="autofocus"
				required="required" placeholder="제목을 입력하세요" size="50"
				mexlength="100"></li>
				<li>    <div id="toolbar-container"></div>

    <!-- This container will become the editable. -->
    <div id="editor" name = "content">
        <p>This is the initial editor content.</p>
    </div>
				</li>
				
<!-- 			<li><textarea rows="20" cols="60" name="content" -->
<!-- 					placeholder="내용을 입력하세요" id="editor"></textarea></li> -->
			<li><input type="submit"><input type="button" value="취소"
				onClick="goBack()"></li> <!--뒤로가기 삽입-->
		</ul>
	</form>
	
    <script>
        DecoupledEditor
            .create( document.querySelector( '#editor' ) )
            .then( editor => {
                const toolbarContainer = document.querySelector( '#toolbar-container' );

                toolbarContainer.appendChild( editor.ui.view.toolbar.element );
            } )
            .catch( error => {
                console.error( error );
            } );
    </script>
	
</body>
</html>