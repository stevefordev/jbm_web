<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!/* 선언문 사용 / 로그인 해야만 해당 페이지 호출 가능합니다. */
	int visitCount = 0;%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>방문자수 조사 페이지</title>
<%@ include file="WEB-INF/templates/link.jsp"%>
<style>
#content h2 {
	line-height: 400px;
	font-size: 60px;
	font-weight: 900;
}
</style>
</head>
<body>
	<%@ include file="WEB-INF/templates/header.jsp"%>
	<h2><%=++visitCount%>
		번째 방문입니다.
	</h2>
	<%@ include file="WEB-INF/templates/footer.jsp"%>
</body>
</html>