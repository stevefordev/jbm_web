<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>REST 연습</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.12/css/all.css"
	integrity="sha384-G0fIWCsCzJIMAVNQPfjH08cyYaUtMwjJwqiRKxxE/rx96Uroj1BtIQ6MLJuheaO9"
	crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Dokdo"
	rel="stylesheet">
<style>
h1 {
	font-size: 60px;
}

h1 .fa-java {
	font-weight: normal;
	color: #E91E63;
}

button {
	font-size: 24px;	
	font-family: 'Dokdo', cursive;
}
</style>
</head>
<body>
	<h1>
		<i class="fab fa-java"></i>REST 연습 메인 페이지
	</h1>
	<img src="/img/024532e1-2951-485d-aa50-ccb1e2ffc6a5bomi.jpg">

	<a href="/grandprix">grandprix</a>

	<button form="postForm">경기등록</button>
	<button form="putForm">경기수정</button>
	<button form="deleteForm">경기삭제</button>
	<form id="postForm" action="grandprix" method="post"></form>
	<form id="putForm" action="grandprix" method="post">
		<input type="hidden" name="_method" value="PUT" />
	</form>
	<form id="deleteForm" action="grandprix" method="post">
		<input type="hidden" name="_method" value="DELETE" />
	</form>
</body>
</html>