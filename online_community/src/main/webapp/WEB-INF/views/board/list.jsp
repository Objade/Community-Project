<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>



<div class="join">
<div class="title"><h3>게시글 목록</h3></div>

<ul>
	<li><a href="${cpath }/board/list">글 목록</a></li>
	<li><a href="${cpath }/board/write">글 쓰기</a></li>
</ul>

<div class="title">
<form method="POST">
	<p> 검색창 <input type="text" placeholder="검색어 입력" name="search">
		<input type="submit" value="검색">
	</p>
</form>
</div>
</div>



<table id="boardList">
	<thead>
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>아이피</th>
			<th>제목</th>
			<th>작성날짜</th>
			<th>조회수</th>
		</tr>
	</thead>

	<tbody>
		<c:forEach var="dto" items="${list }">
		<tr>
			<td>${dto.idx }</td>
			<td>${dto.writer }</td>
			<td>${dto.ipaddr }</td>
			<td><a href="${cpath }/board/view/${dto.idx}">${dto.title }</a></td>
			<td>${dto.writeDate }</td>
			<td>${dto.viewCount }</td>
		</tr>
		</c:forEach>
	</tbody>


</table>


<div class="pageNumber">
	
	<c:if test="${paging.prev }">
	<a class="prev" href="${cpath }/board/list?page=${paging.begin - 1}">이전</a>
	</c:if>
	
	<c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
	<div class="pageNum">
	
		<a class="${param.page == i ? 'bold' : '' }"
			href="${cpath }/board/list?page=${i }">${i }</a>
	
	</div>	
	</c:forEach>

	<c:if test="${paging.next }">
	<a class="prev" href="${cpath }/board/list?page=${paging.end + 1 }">다음</a>	
	</c:if>
</div>


</body>
</html>

</body>
</html>