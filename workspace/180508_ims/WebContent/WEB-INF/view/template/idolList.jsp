<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>    

<h2>아이돌 목록</h2>
<ul id="idolList">
<c:forEach items="${idols}" var="idol">	
	<li> 
	    <a href="/idol/${idol.no}">
	    <img alt="${idol.name }"
	     src="/img/profile/${idol.image}" width="160" />
	    <h3>${idol.name }</h3>
	    </a>
	</li>
</c:forEach>	
</ul>
