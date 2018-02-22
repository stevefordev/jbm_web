<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>테스트용</title>
</head>
<body>
	<h1>안녕하세요?</h1>

	<%
		if (id != null) {
	%>
	<%-- 로그인 했을때 --%>
	<h2>XXX님 환영합니다.</h2>
	<a href="logout.jsp">로그아웃</a>
	<%
		} else {
	%>

	<%-- 로그인 안했을때 --%>
	<h2>로그인</h2>
	<form action="login.jsp" method="post">
		<fieldset>
			<legend>로그인폼</legend>
			<input name="id" placeholder="아이디" /> <input name="pwd"
				type="password" placeholder="비번" />
			<button>로그인</button>
		</fieldset>
	</form>

	<%
		}
	%>

</body>
</html>