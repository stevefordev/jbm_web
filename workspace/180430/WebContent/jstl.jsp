<%@page import="java.util.ArrayList"%>
<%@page import="vo.Group"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- tablib 지시어로 jstl을 등록 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %> 
<%

	List<Group> list = new ArrayList();
	
	list.add(new Group(1,"트와이스"));
	list.add(new Group(2,"워너원"));
	list.add(new Group(3,"모모랜드"));
	list.add(new Group(4,"위너"));
	list.add(new Group(5,"블랙핑크"));
	list.add(new Group(6,"여자친구"));
	
	request.setAttribute("list", list);
	
	/*
	
	EL은 표현언어지,
	for~each, if~else등은
	JSTL을 활용합니다.
	
	1) JSTL은 taglib 등록
	
	*/
	
	
	%>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>JSTL의 사용</title>
</head>
<body>
<h1>그룹목록</h1>

<ul>
<c:forEach items="${list }" var="group">	
	<li>번호 : ${group.no } 
	    / 이름 : ${group.name }</li>
</c:forEach>


</ul>
</body>
</html>


