<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="org.jbm.board.util.PaginateUtil"%>
<%@page import="org.jbm.board.vo.PageVO"%>
<%@page import="org.jbm.board.vo.Board"%>
<%@page import="java.util.List"%>
<%@page import="org.jbm.board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//pageNo  현재 페이지 번호
	int pageNo = 1;

	String pageNoStr = 
			request.getParameter("pageNo");

	//System.out.println(pageNoStr);
	
	if(pageNoStr!=null) {
		pageNo = Integer.valueOf(pageNoStr);
	}//if end
	

	//한페이지당 보여질 게시물 수 
	int numPage = 5;
	
	PageVO pageVO = new PageVO(pageNo,numPage);
	
	//Map<String,Object> map = new HashMap();
	
	//map.put("start",pageVO.getStart());
	//map.put("end",pageVO.getEnd());
			
	//List<Board> list = BoardDAO.selectList(map);
			
 	List<Board> list = BoardDAO.selectList(pageVO);
 	
 	//System.out.println(list.size());
 	
 	//int total = 17;
 	
 	int total = BoardDAO.selectTotal();
 	
 	String paginate = 
		PaginateUtil.getPaginate(pageNo, total, numPage, 5, "index.jsp", "pageNo=");
 	
 	//System.out.println(paginate);
 	
%>    
    
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>MODEL1 게시판</title>
	<%@ include file="/WEB-INF/template/link.jsp" %>
	<style>
		#content #articleList {
			width:1000px;
			margin:10px auto;
		}
		.article {
			border-bottom:1px solid #e6e7e7;
			margin:10px 0;
		}

		.article a {
			display: block;
			height:140px;
			position: relative;
		}
		.article a:hover {
			background: #e6e7e7;
		}

		.article .title {
			position: absolute;
			left:150px;
			line-height: 140px;
			font-size:24px;
			color:#676767;
			width:820px;
			white-space: nowrap;
			word-break: break-all;
			text-overflow: ellipsis;
			overflow: hidden;
		}

		.article a:hover .title {
			color:#14bab6;
			font-size:28px;
			font-weight:bold;
		}
		.article time {
			position: absolute;
			bottom:20px;
			right:20px;
			font-size:20px;
		}
		.article .hit {
			position: absolute;
			color:#9E9E9E;
			bottom:22px;
			left:150px;
		}
		.article .comment {
			position: absolute;
			right:20px;
			top:20px;
			font-size:20px;
			color:#14bab6;
		}
		.article .title span {
			vertical-align: middle;
		}
		.box_btn {
			width:1100px;
		}

		.no_article {
			text-align:center;
			font-size:28px;
			height:200px;
			line-height:200px;
		}
		.btn_like {
			position: absolute;
			left:200px;
			bottom:17px;
			width:90px;
			height: 30px;
			border:none;
			font-size:20px;
			background:transparent;
			cursor:pointer;
			border:none;
			color:#9E9E9E;
			line-height:30px;
			text-align: center;
		}
		.btn_like i {
			color:red;
			vertical-align:middle;
		}
		.btn_like .far {
			display:inline;
		}

		.btn_like.like .far {
			display:none;
		}
		.btn_like .fas {
			display:none;
		}

		.btn_like.like .fas {
			display:inline;
		}

		.num_like{
			font-size:18px;
			vertical-align:middle;
		}

	</style>
</head>
<body>
	<%@ include file="/WEB-INF/template/header.jsp" %>
	<h2>게시글 목록</h2>
	<% if (list.isEmpty()) {%>
	<p class="no_article">
	아직 게시글이 없습니다.
	</p>
	<%} %>
	<ul id="articleList">
	
	<%for(Board board : list) { %>
<li class="article">
	<a href="article.jsp?no=<%=board.getNo()%>">
		<div class="card_user">
			<img src="profile/<%=board.getProfile() %>" width="100" height="100"/>
			<strong><%=board.getWriter() %></strong>
		</div>
		<h3 class="title">
			<%=board.getTitle() %>
		</h3>
		<time><%=board.getRegdate() %></time>
		<strong class="comment"><i class="fa fa-comment"></i> 0</strong>
		<span class="hit"><i class="fa fa-eye"></i>
		<%=board.getHit() %>
		</span>
		<div class="btn_like like">
			<i class="fas fa-heart"></i>
			<i class="far fa-heart"></i>
			<span class="screen_out">좋아요</span>
			<strong class="num_like">
			<%=board.getLikes() %>
			</strong>
		</div>
	</a>
</li>
	<%} %>	
	</ul>
	<%-- paginate --%>
	<%=paginate %>
	<%-- //paginate --%>
	
	<%if(loginMember!=null) { %>
		<div class="box_btn">
			<a href="articleForm.jsp" class="btn">글쓰기</a>
		</div>
	<%} %>	
	<%@ include file="/WEB-INF/template/footer.jsp" %>
</body>
</html>
 