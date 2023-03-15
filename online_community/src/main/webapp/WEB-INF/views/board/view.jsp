<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<script>
	// JSP의 요소를 자바스크립트로 넘겨야 할 때 사용할 변수들

	const cpath = '${cpath}'
	const board_idx = '${dto.idx}'
	const login_userid = '${login.userid}'
	
</script>

<script src="${cpath }/resources/js/script.js"></script>

<table>
		<tr>
			<th>작성자</th>
			<td>${dto.writer }(${dto.ipaddr})</td>
			<th>작성날짜</th>
			<td>${dto.writeDate }</td>
		</tr>	
		
		<tr>
			<th colspan="3">제목</th>
			<td>${dto.title }</td>
		</tr>
	
		<tr><th colspan="5">글 내용</th></tr>
	
		<tr><td colspan="6"><pre>${dto.content }</pre>
		<c:if test="${not empty dto.uploadFile }"><img src="${cpath }/upload/${dto.uploadFile }"></c:if>
		</td></tr>
		
		<tr>
			<td colspan="4">
			<form id="replyWriteForm">
				<p> 
					<textarea class="replyWrite" name="content"
							  placeholder="${empty login ? '로그인 이후 작성 가능합니다.' : '댓글을 작성해주세요' }"
							  ${empty login ? 'readonly' : '' }></textarea>
				</p>
				
				<button>작성</button>
				<input type="hidden" name="parent_idx" value="0">
				<input type="hidden" name="reply_depth" value="0">
			</form>
			
			</td>
		</tr>
		
		<tr>
			<td colspan="4">
			<div id="reply">
				<img src="${cpath }/resources/image/loading.gif" 
					 style="margin: 100px auto" height="50">
			</div>
			</td>
		</tr>

		

</table>

	<div class="button">
		<a href="${cpath }/board/modify/${dto.idx}"><button>수정</button></a>
		<a href="${cpath }/board/delete/${dto.idx}"><button>삭제</button></a>
	</div>



<script>

// textarea에 포커스가 잡히면 실행하는 함수

	document.querySelector('textarea').onfocus = function(event) {
		
		if(login_userid == '') {		// 로그인이 안되어 있으면
			const move = confirm('댓글을 쓰려면 로그인 해야 합니다. 로그인 하시겠습니까?')		// 물어보고
			event.target.blur()			// 일단 포커스를 해제한 다음, (focus <=> blur)
			if(move) {					// 이동하겠다라고 하면 이동시킨다.
				const url = cpath + '/member/login?url=' + location.href
				location.href = url
			}
		}
		
	}
	
	document.body.onload = replyLoadHandler
	replyWriteForm.onsubmit = replyWriteHandler
	
</script>

</body>
</html>