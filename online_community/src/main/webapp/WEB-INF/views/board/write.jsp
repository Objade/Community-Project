<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="title"><h3>글쓰기</h3></div>


<div class="join">

<form method="POST" enctype="multipart/form-data">
	<p>제목 <input type="text" name="title" placeholder="제목" required></p>
	<p>작성자 <input type="text" name="writer" value="${login.userid }" readonly></p>
	<p>아이피 <input type="text" name="ipaddr" value="${ip }" readonly></p>
	<p><textarea name="content" placeholder="내용" required></textarea></p>
	<p>파일 <input type="file" name="newfile"></p>
	<div class="button"><p><input type="submit" value="작성"></p></div>
</form>

</div>


</body>
</html>