<%@page import="util.PaginateUtil"%>
<%@page import="vo.PageVO"%>
<%@page import="dao.GenresDAO"%>
<%@page import="vo.Genre"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	String pageStr = 
	request.getParameter("page");

	int pageNo = 1;
	
	//page 파라미터가 있으면
	if(pageStr!=null) {
		//해당하는 번호로 변경
		pageNo = Integer.parseInt(pageStr);
	}//if end
	
	//페이지에서 보여질 컨텐츠 갯수
	int numPage = 5;
	
	PageVO pageVO = 
			new PageVO(pageNo,numPage);

	List<Genre> genres = 
	GenresDAO.selectList(pageVO);
	
	//페이지블록에 보여질 페이지수
	int numBlock = 4;
	
	//전체 장르수 
	int total = GenresDAO.selectTotal();
	
	//주소
	String url = "genres.jsp";
	//파라미터명 
	String param = "page=";
	
	String paginate = 
			PaginateUtil.getPaginate(pageNo, total, numPage, numBlock, url, param);
			
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장르 목록</title>
<link rel="stylesheet" href="css/reset.css"/>
<link rel="stylesheet" href="css/fontawesome-all.css"/>
<link rel="stylesheet" href="css/paginate.css"/>
<style>
	h1 {
		font-size:40px;
		margin:20px;
	}
	td, th {
		border:1px solid #424242;
		padding:10px 12px;
		text-align: center;
	}
</style>
</head>
<body>
	<h1>장르 목록</h1>
	<table border="1">
		<thead>
			<tr>
				<th>번 호</th>
				<th>장르명</th>
			</tr>
		</thead>
		<tbody>
		<%for(Genre genre : genres) { %>
			<tr>
				<td><%=genre.getNo() %></td>
				<th><%=genre.getName() %></th>
			</tr>
		<%} %>	
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
				<%=paginate %>
				</td>
			</tr>
		</tfoot>
	</table>
</body>
</html>




