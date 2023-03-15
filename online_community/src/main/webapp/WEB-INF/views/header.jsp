<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="cpath" value="${pageContext.request.contextPath }" />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<link type="text/css" rel="stylesheet" href="${cpath }/resources/css/style.css">
<style>
	body {
		background-color: #F6E1FD;
	}
	
	a {
		text-decoration: none;
		color: inherit;
	}
	a:hover {
		text-decoration: underline;
	}

	ul, li {
			list-style: none;
			display: flex;
			padding: 0 10px;
			justify-content: center;
			align-items: center;
		}
		
	.title {
		display: flex;
		justify-content: center;
		align-items: center;
		text-align: center;
		margin-top: 50px;
	}
	
	.greeting {
		display: flex;
		justify-content: flex-end;
		text-align: right;
		height: 50px;
		
	}
	
	table {
		border-collapse: collapse;
		margin: auto;
	}
	
	th, td {
		border: 1px solid white;
		padding: 10px;
		text-align: center;
	}
	
	thead {
		background-color: #EDAFFF;
	}
	
	th {
		background-color: #EDAFFF;
	}
	
	td {
		background-color: white;
	}
	
	.button {
		display: flex;
		justify-content: center;
		align-items: center;
		margin: 20px;
	
	}

	button {
		margin: 10px;
		background-color: #EDAFFF;
		padding: 10px;
		border: 0px;
	}
	
	input[type="submit"] {
		margin: 10px;
		background-color: #EDAFFF;
		padding: 10px;
		border: 0px;
	}
	
	input[type="text"], input[type="password"], input[type="date"] {
		padding: 12px;
		border: 0px;
		width: 300px;
	}
	
	button:hover, input[type="submit"]:hover {
		cursor: pointer;
		background-color: #CCB7D1;
	}
	
	.join {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
	}
	
	textarea {
		height: 400px;
		width: 300px;
	}
	
	.pageNumber {
		display: flex;
		justify-content: center;
		align-items: center;
		margin: 10px;
	}
	
	.pageNum {
		padding: 0 5px;
		color: gray;
	}
	
	.bold {
		color: black;
		font-weight: bold;
	}
	
	.prev {
		margin: 0 10px;
	}

	table#view {
		width: 800px;
	}
	
	#replyWriteForm textarea {
		height: 100px;
		min-height: auto;
		width: 80%;
	}
	
	div.reply {
		border: 1px solid grey;
		margin-top: -1px;
		padding: 5px;
	}
	
	div.reply.selected {
		background-color: white;
	}
	
	.mainImage {
		display : flex;
		justify-content: center;
		align-items: center;
	}
</style>


</head>
<body>

<div class="title">
<a href="${cpath }/"><img src="${cpath }/resources/image/게시판 로고.png"></a>
</div>

<c:if test="${not empty login }">
<div class="greeting"><h4>${login.username }(${ip }) 님 환영합니다. </h4></div>
</c:if>

<ul>
		<c:if test="${empty login }">
		<li><a href="${cpath }/member/login">로그인</a></li>
		<li><a href="${cpath }/member/join">회원가입</a></li>
		</c:if>

		<c:if test="${not empty login }">
		<li><a href="${cpath }/member/logout">로그아웃</a></li>
		<li><a href="${cpath }/member/mypage">마이페이지</a></li>
		</c:if>		
		
		<li><a href="${cpath }/board/list">게시판</a></li>
</ul>