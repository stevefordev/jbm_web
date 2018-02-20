<%@page import="java.util.Calendar"%>
<%@page import="vo.Group"%>
<%@page import="dao.GroupsDAO"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//1. 넘어온 파라미터 받음
	String noStr = request.getParameter("no");
	int no = Integer.parseInt(noStr);

	Group group = GroupsDAO.selectOne(no);
	//2. 한 개의 그룹 정보를 얻어옴
 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>그룹 수정 페이지</title>
</head>
<body>
	<h1>그룹 입력</h1>
	<form action="updateGroup.jsp" method="post">
		<%--
		유저에게 보여주는 데이터는 아님, 반드시 파라미터로 넘어가야 함
		input type=hidden
	 --%>
		<input type="hidden" name="no" value=<%=no%>>
		<fieldset>
			<legend>그룹 입력폼</legend>
			<div>
				<h2>이름</h2>
				<input name="name" placeholder="이름 입력"
					value="<%=group.getName()%>" />

			</div>
			<div>
				<h2>데뷔일</h2>
				<select name="year">
					<%
						for (int i = 2018; i > 1900; i--) {
					%>

					<option <%=(group.getYear() == i) ? "selected" : ""%>><%=i%></option>

					<%
						}
					%>
				</select>년 <select name="month">
					<%
						for (int i = 1; i < 13; i++) {
					%>

					<option <%=(group.getMonth() == i) ? "selected" : ""%>><%=i%></option>

					<%
						}
					%>
				</select>월 <select name="date">

					<%
						for (int i = 1; i < 32; i++) {
					%>

					<option <%=(group.getDate() == i) ? "selected" : ""%>><%=i%></option>

					<%
						}
					%>
				</select>일
			</div>
			<p>
				<button type="reset">리 셋</button>
				<button type="submit">수 정</button>
			</p>
		</fieldset>

	</form>
	<a href="groupList.jsp">목록으로</a>
</body>
</html>