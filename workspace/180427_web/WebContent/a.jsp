<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	//redirect
	response.sendRedirect("b.jsp");

	// 포워드 방식
	RequestDispatcher rd = request.getRequestDispatcher("b.jsp");
	rd.forward(request, response);
%>
<html lang="ko">
<head>
<meta charset=UTF-8">
<title>a</title>
</head>
<body>
	<h1>a.jsp 입니다
</body>
</html>