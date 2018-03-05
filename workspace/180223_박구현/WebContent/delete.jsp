<%@page import="com.jbm.phonebook.dao.PhonebookDAO"%>
<%@page import="com.jbm.phonebook.vo.Phone"%>
<%@page import="com.jbm.phonebook.common.JConstants"%>
<%@page import="com.jbm.phonebook.vo.Host"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//1. 비로그인일때 index 로 이동
	//LoginCheckFilter 에서 처리

	// 로그인 상태에서 직접 delete.jsp 주소창에 파라메터 없이 직접 호출 한경우 
	// 파라미터들의 캐스팅 오류가 발생하고
	// 세션에 오류 속성을 저장하여 메인페이로 이동
	try {

		//2. 넘어온 파라미터 얻기
		String no = request.getParameter("no");

		Host host = (Host) session.getAttribute(JConstants.LOGIN_USER);

		//3. Phone객체 생성후 데이터 세팅
		Phone phone = new Phone();
		phone.setNo(Integer.parseInt(no));
		phone.setHostNo(host.getNo());

		System.out.println(phone);

		//4. delete 구문 수행
		PhonebookDAO.delete(phone);

	} catch (Exception ex) {
		//비정상 접근시 오류가 발생하고 세션 오류속성을 생성
		//메인페이지에서 세션의 요청 오류 속성 존재 여부에 따라서 메시지 처리
		session.setAttribute(JConstants.REQUEST_ERROR_MESSAGE, true);
	}

	//5. main 페이지로 리다이렉트
	response.sendRedirect("main.jsp");
%>