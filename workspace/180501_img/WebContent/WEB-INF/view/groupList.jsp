<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>그룹 목록</title>
</head>
<body>
	<h1>그룹 목록</h1>
	<ul>
		<c:forEach items="${list }" var="group">
			<li>번호: ${group.no }/ 이름: ${group.name } / 데뷔일 : <fmt:formatDate  pattern="YYYY년 M월 d일" value="${group.debutDate }"/> <a href="/deleteGroup.ims?no=${group.no }">삭제</a></li>
		</c:forEach>
	</ul>
</body>
</html>