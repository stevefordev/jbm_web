<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>${group.name }상세페이지</title>
</head>
<body>
	<h1>${group.no }번${group.name }</h1>
	<h2>데뷔일 :
	<fmt:formatDate pattern="YYYY년 M월 d일" value="${group.debutDate }" />
	</h2>
	<h2>멤버</h2>
	<ul>
		<c:forEach items="${list }" var="member">
			<li><a href='/idolDetail.ims?no=${member.no}'>${member.name}</a></li>
		</c:forEach>
	</ul>
	<a href="/groupList.ims">그룹목록으로</a>
</body>
</html>