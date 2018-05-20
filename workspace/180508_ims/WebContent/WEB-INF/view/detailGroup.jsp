<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>${group.name} 상세 페이지</title>
<c:import url="/WEB-INF/view/template/link.jsp"></c:import>
<style>
	#main p {
		font-size:40px;
		font-weight:bold;
		color:#FF5722;
		line-height:160px;
		text-align:center;
	}
</style>
</head>
<body>
<c:import url="/WEB-INF/view/template/header.jsp"></c:import>
	<h2>
	<span>${group.no}번</span> 
	<strong>${group.name}</strong>
	</h2>
	<h3>데뷔일 : 
	<fmt:formatDate value="${group.debutDate }"
	pattern="YYYY년 M월 d일"/>
	</h3>
	
	<c:choose>
	<c:when test="${idols.isEmpty()}">
		<p>멤버가 없습니다.</p>
	</c:when>
	<c:otherwise>
		<c:import url="/WEB-INF/view/template/idolList.jsp"></c:import>
	</c:otherwise>
	</c:choose>
	
	<div class="box_btn">
	
	<a href="/group/${group.no}/update" class="btn">
	<i class="fas fa-wrench"></i>
	수정</a>
	
	<button form="deleteForm" class="btn">
	<i class="fas fa-trash-alt"></i>
	삭제
	</button>
	
	<a class="btn" href="/group">
	<i class="fas fa-external-link-alt"></i>
	그룹 목록으로</a>
	</div>
	
	<form id="deleteForm"
	action="/group/${group.no}" method="post">
	<input type="hidden"
	name="_method" value="DELETE"/>
	</form>
	
<c:import url="/WEB-INF/view/template/footer.jsp"></c:import>

<c:if test="${isError}">
<script>
	alert("${group.name}에는 아이돌이 존재하므로 삭제가 불가능합니다.");
</script>
</c:if>	

</body>
</html>