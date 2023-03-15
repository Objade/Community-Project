<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="title"><h3>마이페이지</h3></div>

<div class="wrap">
	<table id="mypage">
		<tr>
			<th>아이디</th>
			<td>${login.userid }</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${login.username }</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>${login.birth }</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>${login.gender }</td>
		</tr>
	</table>
	<div class="button">
		<div>
			<a href="${cpath }/member/modify"><button>수정</button></a>
		</div>
		<div>
			<button id="withdraw">탈퇴</button>
		</div>
	</div>
</div>

<script>
	const withdraw = document.getElementById('withdraw')
	withdraw.onclick = function(event) {
		const promptText = '정말 탈퇴하시겠습니까?\n탈퇴를 원하시면 [지금탈퇴] 라고 입력하세요'
		const inputText = prompt(promptText)
		
		if(inputText == '지금탈퇴') {
			location.href = '${cpath}/member/withdraw'
		}
	}
	
</script>



</body>
</html>