<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>영화 리스트</title>
</head>
<body>
<h1>영화 리스트</h1>
<ul>
	<c:forEach varStatus="status"
	 items="${movies }" var="movie">
	<li>${status.index } / ${movie.no } / ${movie.title }</li>
	</c:forEach>
	
</ul>
<a href="/movie/register">영화등록</a>
</body>
</html>