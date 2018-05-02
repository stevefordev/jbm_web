<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>아이돌 목록</title>
</head>
<body>
<h1>아이돌 목록</h1>
<ul>
<c:forEach items="${xxx}" var="idol">	
	<li> 
	    <a href="/idolDetail.ims?no=${idol.no}">
	    ${idol.no}번
	    ${idol.name }
	    </a>
	</li>
</c:forEach>	
</ul>
<a href="/insertIdol.ims">아이돌 등록</a>
<a href="/index.ims">메인페이지로 이동</a>

</body>
</html>