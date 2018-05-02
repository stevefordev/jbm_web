<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>그룹 목록</title>
</head>
<body>
<h1>그룹 목록</h1>
<ul>
<c:forEach items="${list }" var="group">	
	<li>번호 : ${group.no }
	    / 이름 : ${group.name }
	    / 데뷔일 : <fmt:formatDate 
	    pattern="YYYY년 M월 d일"
	    value="${group.debutDate }"/>
		<a href="/deleteGroup.ims?no=${group.no}">삭제</a>
	</li>
</c:forEach>	
</ul>
<a href="/insertGroup.ims">그룹 입력</a>
<a href="/index.ims">메인페이지로 이동</a>

<c:if test="${isError}">
<script>
alert("해당 그룹에는 아이돌이 있어서 삭제가 안됩니다.");
</script>
</c:if>

</body>
</html>



