<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>그룹 입력 페이지</title>
</head>
<body>
	<h1>그룹 입력</h1>
	<form action="insertGroup.jsp" method="post">
		<fieldset>
			<legend>그룹 입력폼</legend>
			<div>
				<h2>이름</h2>
				<input name="name" placeholder="이름 입력" />

			</div>
			<div>
				<h2>데뷔일</h2>
				<select name="year">
					<%
						for (int i = 2018; i > 1900; i--) {
					%>

					<option><%=i%></option>

					<%
						}
					%>
				</select>년 <select name="month">
					<%
						for (int i = 1; i < 13; i++) {
					%>

					<option><%=i%></option>

					<%
						}
					%>
				</select>월 <select name="date">
				
				<%
						for (int i = 1; i < 32; i++) {
					%>

					<option><%=i%></option>

					<%
						}
					%>
				</select>일
			</div>
			<p>
				<button type="reset">리 셋</button>
				<button type="submit">입 력</button>
			</p>
		</fieldset>

	</form>
	<a href="groupList.jsp">목록으로</a>
</body>
</html>