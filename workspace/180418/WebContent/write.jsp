<%@page import="org.jbm.board.vo.Member"%>
<%@page import="org.jbm.board.vo.Board"%>
<%@page import="org.jbm.board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

//post방식의 한글처리
request.setCharacterEncoding("UTF-8");

String title = request.getParameter("title");
String contents =request.getParameter("contents");  

//2018년 4월 16일 10시37분 김필구 작성
//out.println(title);
//out.println(contents);

Board board = new Board();

board.setTitle(title);
board.setContents(contents);

//로그인된 멤버정보를 담은 객체를
//세션에서 얻어옴
Member loginMember = 
(Member)session.getAttribute("loginMember");

board.setProfile(loginMember.getProfile());
board.setWriter(loginMember.getNickname());
board.setWriterNo(loginMember.getNo());

System.out.println("insert전:"+board.getNo());

BoardDAO.insert(board);

System.out.println("insert후:"+board.getNo());

response.sendRedirect("article.jsp?no="+board.getNo());

%>


 