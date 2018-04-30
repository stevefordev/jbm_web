<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Date"%>
<%@page import="vo.Group"%>
<%@ page language="java"
 contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		EL은 Expression Language로
		_jspService의 지역변수를 출력하는
		것이 아님
		
		page, request, 
		session, application에
		attribute를 출력하는 문법이
		el입니다.
		
		attribute의 범위
		
		1) page : 한 페이지 내부
		2) request : 하나의 요청에서
		3) session : 세션에서
		4) application : 서버 켜있는 동안
		
	*/
	
	request.setAttribute("name", "손예진");
	request.setAttribute("age", 37);
	
	Group group = new Group();
	group.setNo(1);
	group.setName("트와이스");
	Date debutDate = Date.valueOf("2015-10-25");
	group.setDebutDate(debutDate);
	
	
	List<Group> list = new ArrayList();
	
	list.add(group);
	list.add(new Group(2,"듀스"));
	list.add(new Group(3,"레드벨벳"));
	list.add(new Group(4,"모모랜드"));
	list.add(new Group(5,"마마무"));
	list.add(new Group(6,"블랙핑크"));
	list.add(new Group(7,"여자친구"));
	
	session.setAttribute("g1", group);
	
	request.setAttribute("list", list);

%>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>EL(Expression Language)</title>
</head>
<body>
<h1>EL의 활용</h1>
<h2>이름 : ${name }</h2>
<h2>나이 : ${age }</h2>
<hr/>
<h2>그룹번호 : ${g1.no }</h2>
<h2>그룹이름 : ${g1.name }</h2>
<h2>그룹데뷔일 : ${g1.debutDate }</h2>
<hr/>
<h1>그룹목록</h1>
<ul>
	<li>${list[0].name }</li>
	<li>${list[1].name }</li>
	<li>${list[2].name }</li>
	<li>${list[3].name }</li>
	<li>${list[4].name }</li>
	<li>${list[5].name }</li>
	<li>${list[6].name }</li>
</ul>
</body>
</html>










