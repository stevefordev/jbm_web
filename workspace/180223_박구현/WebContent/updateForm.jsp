<%@page import="com.jbm.phonebook.dao.PhonebookDAO"%>
<%@page import="com.jbm.phonebook.vo.Phone"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String noStr = request.getParameter("no");
	Phone param = new Phone();
	Phone phoneInfo = null;
	try	{
			Host host = (Host)session.getAttribute(JConstants.LOGIN_USER);
			
			param.setNo(Integer.parseInt(noStr));
			param.setHostNo(host.getNo());
		
			phoneInfo = PhonebookDAO.selectOne(param);
			
			// 로그인한 유저가 정상적으로 수정 버튼 클릭시 해당 전화목록은 반드시 존재한다
			// phoneInfo 가 null 이라면 비정상 접근으로 판단하고 메인 페이지로 이동
			if (phoneInfo == null) {
				throw new Exception();	
			}
		} catch (Exception ex) {
			//비정상 접근시 오류가 발생하고 세션 오류속성을 생성
			//메인페이지에서 세션의 요청 오류 속성 존재 여부에 따라서 메시지 처리
			session.setAttribute(JConstants.REQUEST_ERROR_MESSAGE, true);
			response.sendRedirect("main.jsp");
			return;
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>전화번호 수정페이지</title>
<%@ include file="WEB-INF/templates/link.jsp"%>
<style>
</style>
</head>
<body>
	<%@ include file="WEB-INF/templates/header.jsp"%>
	<h2>전화번호 수정</h2>
	<div id="formBox">
		<form id="form" method="post" action="update.jsp">
		<input type="hidden" name="no" value=<%=phoneInfo.getNo() %> />		
			<fieldset>
				<legend class="screen_out">전화번호 수정폼</legend>
				<div class="row">
					<label for="name">이 름</label> <input id="name" name="name"
						title="1~10글자 한글로만 입력해주세요." placeholder="이름입력"  value="<%=phoneInfo.getName()%>"/>
				</div>
				<div class="row">
					<label for="phone">전화번호</label> <span id="phone"> <select
						title="반드시 선택해주세요." id="phone1" name="phone1">
							<option <%=phoneInfo.getPhone1().equals("010")?"selected":"" %>>010</option>
							<option <%=phoneInfo.getPhone1().equals("011")?"selected":"" %>>011</option>
							<option <%=phoneInfo.getPhone1().equals("016")?"selected":"" %>>016</option>
							<option <%=phoneInfo.getPhone1().equals("017")?"selected":"" %>>017</option>
							<option <%=phoneInfo.getPhone1().equals("019")?"selected":"" %>>019</option>
					</select> - <input id="phone2" name="phone2" title="3~4글자 숫자만 입력해주세요."
						class="digit4" placeholder="숫자입력" size="4" maxlength="4" value="<%= phoneInfo.getPhone2() %>"/> - <input
						id="phone3" name="phone3" title="4글자 숫자만 입력해주세요." class="digit4"
						placeholder="숫자입력" size="4" maxlength="4" value="<%= phoneInfo.getPhone3() %>"/>
					</span>
				</div>
				<div class="row">
					<label for="age">생년월일</label><span id="age"> <select
						id="year" name="year" value="<%=phoneInfo.getYear() %>" >
							<%
								for (int i = 2018; i > 1900; i--) {
							%>
							<option value="<%=i%>" <%=phoneInfo.getYear() == i ? "selected" : ""%>><%=i%></option>
							<%
								}
							%>

					</select><em>년</em> <select id="month" name="month">
							<%
								for (int i = 1; i < 13; i++) {
							%>
							<option value="<%=i%>" <%=phoneInfo.getMonth() == i?"selected":"" %>><%=i%></option>
							<%
								}
							%>

					</select><em>월</em> <select id="date" name="date">
					</select><em>일</em>
					</span>
				</div>
				<div class="row">
					<label for="gender">성 별</label> <span id="gender"> 
						<input type="radio" id="female" name="gender" value="F" <%=phoneInfo.getGender() == 'F'? "checked":"" %>/>
						<label for="female"><i class="fa fa-female"></i> 여 자</label> 
						<input type="radio" id="male" name="gender" value="M" <%=phoneInfo.getGender() == 'M'? "checked":"" %> />
						<label for="male"><i class="fa fa-male"></i> 남 자</label>
					</span>
				</div>
				<div id="btnBox">
					<button type="submit" class="btn">
						<i class="fas fa-pencil-alt"></i> 전화번호 수정
					</button>
					<button type="reset" class="btn">
						<i class="fas fa-redo-alt"></i> 리 셋
					</button>
					<a href="main.jsp" class="btn"><i class="fa fa-arrow-left"></i>
						전화번호부로</a>
				</div>
			</fieldset>
		</form>
	</div>
	<!-- //formBox  -->
	<%@ include file="WEB-INF/templates/footer.jsp"%>
	<script src="js/jquery.js"></script>
	<script src="js/moment.js"></script>
	<script src="js/validation.js"></script>
	<script src="js/utils.js"></script>
	<script>		
		utils.nowDate = <%=phoneInfo.getDate() %>;
		utils.createDate(true);
	</script>
</body>
</html>