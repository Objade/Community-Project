<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>


<div class="title"><h3>로그인</h3></div>

<div class="join">
<form method="POST">
	<p><input type="text" name="userid" placeholder="ID" required autofocus></p>
	<p><input type="password" name="userpw" placeholder="Password" required></p>
	<div class="button"><p><input type="submit" value="가입"></p></div>
</form>
</div>

</body>
</html>