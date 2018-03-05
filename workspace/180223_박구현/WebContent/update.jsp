<%@page import="com.jbm.phonebook.dao.PhonebookDAO"%>
<%@page import="com.jbm.phonebook.vo.Phone"%>
<%@page import="com.jbm.phonebook.common.JConstants"%>
<%@page import="com.jbm.phonebook.vo.Host"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//0. 비로그인일때 index 로 이동
	//LoginCheckFilter 에서 처리

	//1. post 방식 한글 처리
	//EncodingFilter 에서 처리

	// 페이지내 하이퍼링크 이외의 동작으로 비정상 접근하여 
	// 유효한 파라메터를 입력하지 않는 경우
	// 파라미터들의 캐스팅 오류가 발생하고
	// 세션에 오류 속성을 저장하여 메인페이로 이동
	try {

		//2. 넘어온 파라미터 얻기
		String no = request.getParameter("no");
		String name = request.getParameter("name");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");

		String phoneNumber = phone1 + phone2 + phone3;

		String gender = request.getParameter("gender");

		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String date = request.getParameter("date");

		Date birthDate = Date.valueOf(year + "-" + month + "-" + date);

		Host host = (Host) session.getAttribute(JConstants.LOGIN_USER);

		//3. Phone객체 생성후 데이터 세팅
		Phone phone = new Phone(host.getNo(), name, phoneNumber, gender.charAt(0), birthDate);
		phone.setNo(Integer.parseInt(no));

		System.out.println(phone);

		//4. update 구문 수행
		PhonebookDAO.update(phone);		

	} catch (Exception ex) {
		//비정상 접근시 오류가 발생하고 세션 오류속성을 생성
		//메인페이지에서 세션의 요청 오류 속성 존재 여부에 따라서 메시지 처리
		session.setAttribute(JConstants.REQUEST_ERROR_MESSAGE, true);
	}

	//5. main 페이지로 리다이렉트
	response.sendRedirect("main.jsp");
%>