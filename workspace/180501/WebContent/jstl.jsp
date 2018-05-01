<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1"%>
<%-- fmt(포맷) JSTL --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setAttribute("loginUser", "xxx");
	//request.setAttribute("gender", "F");

	String[] names = { "혜빈", "연우", "제인", "데이지", "낸시" };
	request.setAttribute("names", names);

	//점수
	request.setAttribute("score", 97);

	Date birthDate = Date.valueOf("2000-04-13");
	request.setAttribute("birth", birthDate);

	pageContext.setAttribute("price", 999870);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>jstl java standard tag library</title>
</head>
<body>
	<%-- 단순 if 문 --%>
	<c:if test="${loginUser!=null} }">
		<h1>당신은 로그인 되었군요!</h1>
	</c:if>

	<h2>모모랜드 목록</h2>
	<ul>
		<%-- forEach --%>
		<c:forEach items="${names }" var="name">
			<li>이름 : ${name }</li>
		</c:forEach>
	</ul>
	<%-- if~else if~else 구분이 바로
	choose when~~~ other wise --%>
	<c:choose>
		<c:when test="${score>90 }">A학점입니다.</c:when>
		<c:when test="${score>80 }">B학점입니다.</c:when>
		<c:when test="${score>70 }">C학점입니다.</c:when>
		<c:when test="${score>60 }">D학점입니다.</c:when>
		<c:otherwise>F학점입니다.</c:otherwise>
	</c:choose>

	<hr />

	<fmt:formatDate pattern="YYYY년 M월 d일" value="${birth }" />

	<h2>
		가격 :
		<fmt:formatNumber type="currency" value="${price }" />
	</h2>
</body>
</html>