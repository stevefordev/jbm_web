<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	/*
	HTTP 프로토콜은 무상태(stateless)
	프로토콜입니다.
	
	그럼에도 각 브라우저별 다른 유저임을 알기 위해서 HttpSession 객체가 필요합니다
	(로그인 처리, 페이지간의 데이터 이동)
	
	첫 요청때 HttpSession 객체가 만들어지고 해당 id가 생성되며 응답때 sessionid 가 브라우저로 넘어갑니다.
	
	다음 요청때부터는 프로토콜에 sessionid 가 넘어옵니다.
	*/
	//세션아이디
	System.out.println(session.getId());
	//세션생성시간
	System.out.println(session.getCreationTime());
	// 세션마지막 접속시간
	System.out.println(session.getLastAccessedTime());
	//세션만료기한
	System.out.println(session.getMaxInactiveInterval());
%>
<h1>Ses</h1>