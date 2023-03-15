<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<h3>게시글 수정</h3>

<div class="join">
<form method="POST" enctype="multipart/form-data">
	<p>제목 <input type="text" name="title" value="${dto.title }" required></p>
	<p>작성자 <input type="text" name="writer" value="${dto.writer }" readonly></p>
	<p>아이피 <input type="text" name="ipaddr" value="${dto.ipaddr }" readonly></p>
	<p><textarea name="content" placeholder="내용" required>${dto.content }</textarea></p>
	<p>파일 <input type="file" name="newfile"></p>
	<p>현재 파일<input type="text" name="uploadFile" value="${dto.uploadFile }" readonly></p>
	
	<div class="button"><p><input type="submit" value="작성"></p></div>
</form>
</div>

</body>
</html>