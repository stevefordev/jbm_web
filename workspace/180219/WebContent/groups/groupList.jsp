<%@page import="vo.Group"%>
<%@page import="java.util.List"%>
<%@page import="dao.GroupsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<Group> list = GroupsDAO.selectList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>그룹목록</title>
</head>
<body>
	<h1>그룹목록</h1>
	<ul>
		<%
			for (Group group : list) {
		%>
		<li>번호 : <%=group.getNo()%> 
		/ 이름 :<%=group.getName()%> 
		/ 데뷔일 :<%=group.getDebutDate()%>
			<a href="updateGroupForm.jsp?no=<%=group.getNo()%>">수정</a>
			<a href="deleteGroup.jsp?no=<%=group.getNo()%>">삭제</a>
		</li>
		<%
			}
		%>
	</ul>
			<a href="groupForm.jsp">그룹입력</a>
</body>
</html>