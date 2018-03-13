<%@page import="util.PaginateUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String pageStr = 
request.getParameter("pageNo");
int pageNo = 1;

if(pageStr!=null) 
	pageNo = Integer.parseInt(pageStr);

//인자 6개
// pageNo(int) : 페이지번호
// total(int) : 전체게시물 수 
// numPage(int) : 한 페이지에 출력하는 게시물수  
// numBlock(int) : 페이지블록에 출력하는 페이지수
// url(String) : 주소
// param(String) : 파라미터이름

String paginate = 
PaginateUtil.getPaginate(pageNo, 234, 7, 5, "paginate.jsp", "pageNo=");

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이징 처리</title>
<link rel="stylesheet" href="css/reset.css"/>
<link rel="stylesheet" href="css/fontawesome-all.css"/>
<link rel="stylesheet" href="css/paginate.css"/>
</head>
<body>
<h1>페이징 처리</h1>
<%=paginate %>
</body>
</html>


