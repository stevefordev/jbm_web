<%@page import="util.PaginateUtil"%>
<%@page import="dao.BooksDAO"%>
<%@page import="dao.GenresDAO"%>
<%@page import="vo.Book"%>
<%@page import="java.util.List"%>
<%@page import="vo.PageVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String pageStr = 
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

List<Book> books = 
BooksDAO.selectList(pageVO);

//페이지블록에 보여질 페이지수
int numBlock = 4;

//전체 장르수 
int total = BooksDAO.selectTotal();

//주소
String url = "books.jsp";
//파라미터명 
String param = "page=";

String paginate = 
		PaginateUtil.getPaginate(pageNo, total, numPage, numBlock, url, param);
		
%>        
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 목록</title>
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
	<h1>책 목록</h1>
	<table border="1">
		<thead>
			<tr>
				<th>번 호</th>
				<th>책제목</th>
				<th>출판사</th>
				<th>출판일</th>
				<th>저자번호</th>
			</tr>
		</thead>
		<tbody>
		<%for(Book book : books) { %>
			<tr>
				<td><%=book.getNo() %></td>
				<th><%=book.getTitle() %></th>
				<td><%=book.getPublisher() %></td>
				<td><%=book.getPublicationDate() %></td>
				<td><%=book.getAuthorNo() %></td>
			</tr>
		<%} %>	
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5">
				<%=paginate %>
				</td>
			</tr>
		</tfoot>
	</table>
</body>
</html>