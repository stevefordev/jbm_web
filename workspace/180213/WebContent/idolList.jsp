<%@page import="vo.Idol"%>
<%@page import="java.util.List"%>
<%@page import="dao.IdolsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<Idol> list = IdolsDAO.selectList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>아이돌 목록</title>
</head>
<body>
	<h1>아이돌 목록</h1>
	<ul>
		<%
			for (Idol idol : list) {
		%>
		<li>번호 : <%=idol.getNo()%> 
		/ 이름 :<%=idol.getName()%> 
		/ 키 :<%=idol.getHeight()%>
		/ 몸무게 :<%=idol.getWeight()%> 
		/ 생년월일 :<%=idol.getBirthDate()%> 
		/ 그룹번호 :<%=idol.getGroupNo()%>
		<a href="deleteIdol.jsp?no=<%=idol.getNo()%>">삭제</a>
		</li>
		<%
			}
		%>
	</ul>
	<a href="idolForm.jsp">아이돌 입력</a>
</body>
</html>