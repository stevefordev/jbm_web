<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>    
<c:if test="${idols.isEmpty()}">
	<c:redirect url="/idol/page/1"/>
</c:if>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>아이돌 목록</title>
<c:import url="/WEB-INF/view/template/link.jsp"></c:import>
<link rel="stylesheet" 
href="/css/paginate.css" />
</head>
<body>
<c:import url="/WEB-INF/view/template/header.jsp"></c:import>
<c:import url="/WEB-INF/view/template/idolList.jsp"></c:import>
${paginate}
<div class="box_btn">
<a class="btn" href="/idol/register">
<i class="fas fa-pencil-alt"></i>
아이돌 등록</a>
<a class="btn" href="/index">
<i class="fas fa-external-link-square-alt"></i>
메인페이지로 이동</a>
</div>
<c:import url="/WEB-INF/view/template/footer.jsp"></c:import>
</body>
</html>