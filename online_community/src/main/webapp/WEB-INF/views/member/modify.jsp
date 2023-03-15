<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<h3>회원 정보 수정</h3>

<div class="join">
<form method="POST">
	<p><input type="text" name="userid" placeholder="ID" value="${login.userid }" required readonly></p>
	<p><input type="password" name="userpw" placeholder="변경할 비밀번호 입력"></p>
	<p><input type="text" name="username" value="${login.username }" required></p>
	<p><input type="date" name="birth" value="${login.birth }" required></p>
	<p>
		<label><input type="radio" name="gender" ${login.gender == '남성' ? 'checked' : '' } value="남성" required >남성</label>
		<label><input type="radio" name="gender" ${login.gender == '여성' ? 'checked' : '' } value="여성" required>여성</label>
	</p>
	<div class="button"><input type="submit" value="수정"></div>
</form>
</div>

</body>
</html>