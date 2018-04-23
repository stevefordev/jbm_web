<%@page import="java.util.concurrent.ConcurrentHashMap"%>
<%@page import="java.util.Map"%>
<%@page import="org.jbm.board.util.PaginateUtil"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="org.apache.ibatis.ognl.ObjectMethodAccessor"%>
<%@page import="org.jbm.board.vo.PageVO"%>
<%@page import="org.jbm.board.dao.BoardDAO"%>
<%@page import="org.jbm.board.vo.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" 
contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pageNoStr = request.getParameter("pageNo");
	
	int pageNo = Integer.parseInt(pageNoStr);

	int numPage = 5;
	
	PageVO pageVO = new PageVO(pageNo,numPage);	

	//자바의 java.util.List를
	List<Board> list = 
	BoardDAO.selectList(pageVO);
	

 	int total = BoardDAO.selectTotal();
 	
 	String paginate = 
		PaginateUtil.getPaginate(pageNo, total, numPage, 5, "아무거나상관없음", "pageNo=");
 	
 	
 	//게시글 리스트와 페이징 문자열을
 	//둘 다 보내야 하기 때문에 Map을 이용
 	Map<String,Object> modelMap = new ConcurrentHashMap();
 	
 	//map에 각각 list, paginate라는 이름으로 put
 	modelMap.put("list",list);
 	modelMap.put("paginate",paginate);
 	
 	
 	//javascript의 json으로
	ObjectMapper om = new ObjectMapper();
 		
 	String json = om.writeValueAsString(modelMap);
	out.print(json);

%>

