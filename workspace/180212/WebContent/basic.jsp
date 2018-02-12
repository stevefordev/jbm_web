<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- html 주석 -->
<%-- JSP 주석 : xxx_jsp.java 파일이 만들어질때 사라짐 --%>
<%-- 1. 스크립트릿 : <% %>
	      자바코드 삽입(_jspService 메서드안에)
	      2) 표현식 : <%= %>
	 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>Insert title here</title>
</head>
<body>
	<h1>안녕? JSP</h1>
	<h2>
		<%
			int i = 10;
			System.out.println("콘솔에 출력");
			out.println("HTML에 출력");
		%>
	</h2>
	<h3>
		<%
			out.print("후후후");
		%>
	</h3>
	<h3><%="후후후"%></h3>
</body>
</html>