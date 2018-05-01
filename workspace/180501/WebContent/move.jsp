<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//response.sendRedirect("scope.jsp");
	RequestDispatcher rd = request.getRequestDispatcher("scope.jsp");

	request.setAttribute("name", "김사랑");
	
	rd.forward(request, response);
	 
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>