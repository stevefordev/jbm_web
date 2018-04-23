<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>원하는 페이지를 찾을 수 없습니다.</title>
	<%@ include file="/WEB-INF/template/link.jsp" %>
	<style>
		#content {
			text-align: center;
		}

		#content a {
			font-size:22px;
		}
	</style>
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
<h2>죄송합니다.<br/>
요청하신 페이지를 찾을 수 없습니다.</h2>
<a href="/index.jsp">메인 페이지로 이동</a>
<%@ include file="/WEB-INF/template/footer.jsp" %>
</body>
</html>
    