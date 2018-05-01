<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>아이돌 목록</title>
</head>
<body>
	<h1>아이돌 목록</h1>
	<ul>
		<c:forEach items="${list }" var="idol">
			<li>번호: ${idol.no }/ 이름: ${idol.name } / 생일 : <fmt:formatDate  pattern="YYYY년 M월 d일" value="${idol.birthDate }"/> <a href="/deleteIdol.ims?no=${idol.no }">삭제</a></li>
		</c:forEach>
	</ul>
	
	<a href="/insertIdol.ims">아이돌등록</a>
	<a href="/index.ims">메인 페이지로 이동</a>
	
</body>
</html>