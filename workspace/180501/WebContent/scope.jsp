<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Attribute 의 scope(범위)</title>
</head>
<body>

	<%-- localhost/scope.jsp?no=3 --%>
	<h1>번호 : ${param.no }</h1>
	<h1>이름 : ${name }</h1>
	<a href="/el.jsp">el.jsp 로 이동</a>

</body>
</html>