<%@page import="vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	User loginUser = (User) session.getAttribute("loginUser");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멋진 웹서비스</title>
<style>
h2 span {
	color:red;
	font-size:40px;
}
</style>
</head>
<body>
	<h1>멋진 웹서비스</h1>
	<%
		if (loginUser != null) {
	%>

	<%-- 로그인 했을때 --%>
	<h2>
		<span><%=loginUser.getNickname()%></span>님 환영합니다.
	</h2>
	<a href="logout.jsp">로그아웃</a>
	<%
		} else {
	%>
	<%-- 로그인 안했을때 --%>
	<h2>로그인</h2>
	<form action="login.jsp" method="post">
		<fieldset>
			<legend>로그인폼</legend>
			<input name="id" placeholder="아이디" /> <input type="password"
				name="pwd" placeholder="비밀번호" />
			<button>로그인</button>
		</fieldset>
	</form>
	<%
		}
	%>
</body>
</html>