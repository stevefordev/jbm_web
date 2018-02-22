<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%!//멤버필드
	String name;%>
<%
	String n = request.getParameter("name");

	name = (n != null) ? n : null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>마이페이지</title>
</head>
<body>
	<h1><%=this.name%>님 환영합니다.
	</h1>
	<form method="get" action="hello.jsp">
		<input name="name" placeholder="이름을 입력하세요" />
		<button>입력</button>
	</form>
</body>
</html>