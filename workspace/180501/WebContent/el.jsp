<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setAttribute("movie", "어벤져스 인피니티 워");

%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>EL (Expression Language) 의 문법</title>
</head>
<body>
	<h1>EL의 문법</h1>
	<h2>영화 이름 : ${movie }</h2>
	<h3>name 파라미터 값 : ${param.name }</h3>
	<h3>heder.Referer : ${header.Referer}</h3>
	 ${header.referer}
</body>
</html>