<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<c:if test="${idol==null }">
<%--
<c:redirect url="/idolList.ims"/>
 --%>
<script>
	alert("${param.no}(은)는 잘못된 아이돌번호입니다.");
	location.href="/idolList.ims";
</script>
</c:if>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>${idol.name }의 상세 페이지</title>
<c:import url="/WEB-INF/view/template/link.jsp"></c:import>
<style>
	#profileBox {
		width:500px;
		margin:10px auto;
		overflow: hidden;
	}
	
	#profileImage {
		width:160px;
		border:5px solid #424242;
		float: left;	
	} 
	#profileData {
		width:310px;
		margin-left:20px;
		float: left;
		font-size:30px;
	}
	#profileData dt {
		width:120px;
		float:left;
		margin:10px 0;
		color:#666;
	}
	
	#profileData dd {
		width:190px;
		float:left;
		margin:10px 0;
		font-weight:bold;
	}
	
</style>
</head>
<body>
<c:import url="/WEB-INF/view/template/header.jsp"></c:import>
<h2>
<strong>${idol.name }</strong><span>의 상세정보</span>
</h2>
<div id="profileBox">
<img id="profileImage" width="160"
 src="/img/profile/${idol.image }"/>
<dl id="profileData">
	<dt>이름</dt>
	<dd>${idol.name }</dd>
	<dt>키</dt>
	<dd>${idol.height }cm</dd>
	<dt>몸무게</dt>
	<dd>${idol.weight }kg</dd>
	<dt>생년월일</dt>
	<dd>
	<fmt:formatDate value="${idol.birthDate }"
	pattern="YYYY년 M월 d일"/>
	</dd>
	<dt>그룹</dt>
	<dd>${idol.groupName }</dd>
</dl>
</div>

<div class="box_btn">
<a class="btn" href="">
<i class="fas fa-wrench"></i>
수정</a>
<button form="deleteForm" class="btn">
<i class="fas fa-trash-alt"></i>
삭제</button>
<a class="btn" 
href="/idol/page/1">
<i class="fas fa-external-link-alt"></i>
목록으로</a>
</div>

<form id="deleteForm"
 action="/idol/${idol.no}" method="post">
	<input type="hidden" name="_method"
	value="DELETE">
	<input type="hidden"
	name="referer" value="${referer}" />
</form>

<c:import url="/WEB-INF/view/template/footer.jsp"></c:import>
</body>
</html>