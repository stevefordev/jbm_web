<%@page import="com.jbm.phonebook.vo.Host"%>
<%@page import="com.jbm.phonebook.dao.PhonebookDAO"%>
<%@page import="com.jbm.phonebook.vo.Phone"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>아주 멋진 전화번호부</title>
<%@ include file="WEB-INF/templates/link.jsp"%>
<style>
 #msgErrorRequest {
   width: 100%;
   height: 100%;
   background-color: rgba(0, 0, 0, 0.6);
   background-image: url("img/error_request.jpg");
   background-repeat: no-repeat;
   background-position: center;
   /* 브라우저에 고정되게 하는 속성 */
   position: fixed;   
   left: 0px;
   top: 0px;
 }
</style>
</head>
<body>
	<%@ include file="WEB-INF/templates/header.jsp"%>
	<h2>전화번호 목록</h2>
	<div id="phoneBox">
		<table border="1">
			<caption class="screen_out">전화번호표</caption>
			<colgroup>
				<col id="name" />
				<col id="phone" />
				<col id="gender" />
				<col id="age" />
				<col id="update" />
				<col id="delete" />
			</colgroup>
			<thead>
				<tr>
					<th>이 름</th>
					<th>전화번호</th>
					<th>성 별</th>
					<th>나 이</th>
					<th>수 정</th>
					<th>삭 제</th>
				</tr>
			</thead>
			<tbody>
				<%
					/* 현재 로그인한 주인의 전화번호 목록을 출력 */
					List<Phone> phonebook = PhonebookDAO.selectListByHostNo(host.getNo());
				%>
				<%
					if (phonebook.isEmpty()) {
				%>
				<tr>
					<td colspan="6" class="no_data">아직 전화번호가 없습니다.</td>
				</tr>
				<%
					} else {
						for (Phone phone : phonebook) {
				%>
					<tr>
					<th><%=phone.getName()%></th>
					<td><i class="fas fa-mobile"></i> <%=phone.getPhoneNumber()%></td>
					<td><i class="fa fa-<%=phone.getGenderEng()%>"></i> <%=phone.getGenderKor()%></td>
					<td title="<%=phone.getBirthDateKor()%>"><%=phone.getAge() %>살</td>
					<td><a href="updateForm.jsp?no=<%=phone.getNo() %>" class="btn update"><i
							class="fa fa-wrench"></i> 수정</a></td>
					<td><a data-name="<%=phone.getName() %>" href="delete.jsp?no=<%=phone.getNo() %>" class="btn delete"><i
							class="far fa-trash-alt" ></i> 삭제</a></td>
				</tr>

				<%
					}
					}
				%>
			</tbody>
			<tfoot>
				<tr>
					<td id="btnBox" colspan="7"><a href="registerForm.jsp"
						class="btn"><i class="fas fa-pencil-alt"></i> 전화번호 작성</a></td>
				</tr>
			</tfoot>
		</table>
	</div>
	<!-- //phoneBox -->
	
	<%@ include file="WEB-INF/templates/footer.jsp"%>
	
	<%
		/* 
			update.jsp, register.jsp, delete.jsp 같이 입력, 수정, 삭제의 넌뷰 페이지에
			비정상 접근일 경우 메인페이지로 이동되고 오류 메시지를 호출.
			판단 여부는 세션의 요청 오류 속성을 활용
		*/
		Object sessionAttribute = session.getAttribute(JConstants.REQUEST_ERROR_MESSAGE);
		if (sessionAttribute != null && (boolean)sessionAttribute == true) {
			/* 새로고침하면 메시지가 사라지기 위해서 세션의 해당 속성 삭제 */
			session.removeAttribute(JConstants.REQUEST_ERROR_MESSAGE);
	%>
	<div id="msgErrorRequest"></div>
	<% } %>

	<script src="js/jquery.js"></script>
	<script>
	
		/* 가산점 : 삭제버튼 클릭시, 확인/취소 다이얼로그창이 떠서 확인버튼 누를때만 삭제 수행 */
		$(".delete").click(function() {
			var name = $(this).attr("data-name");
			return confirm(name + "님을 정말로 삭제하시겠습니까?")
		});
		
		$("#msgErrorRequest").click(function () {
	        $("#msgErrorRequest").hide();
	    });
	</script>
</body>
</html>