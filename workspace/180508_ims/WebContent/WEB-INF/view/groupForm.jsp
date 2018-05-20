<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>그룹 
<c:choose>
	<c:when test="${group!=null}">
		수정
	</c:when>
	<c:otherwise>
		입력
	</c:otherwise>
</c:choose>
폼</title>
<c:import url="/WEB-INF/view/template/link.jsp"/>
<link rel="stylesheet" 
href="/css/tui-date-picker.css"/>
<style>
 #wrapper .tui-datepicker {
      font-family:"맑은 고딕",sans-serif;
  }

  .tui-calendar td, .tui-calendar th {
      vertical-align: middle;
  }
</style>
</head>
<body>
<c:import url="/WEB-INF/view/template/header.jsp"/>
	<h2>그룹 
	<c:choose>
	<c:when test="${group!=null}">
		수정
	</c:when>
	<c:otherwise>
		입력
	</c:otherwise>
</c:choose>
	 페이지</h2>
	
	<form id="form" 
	action="/group" method="post">
	<c:if test="${group!=null}">
		<input type="hidden"
		name="_method" value="PUT" />
		<input type="hidden"
		name="no" value="${group.no }" />
	</c:if>
		<fieldset>
			<legend class="screen_out">그룹 
<c:choose>
	<c:when test="${group!=null}">
		수정
	</c:when>
	<c:otherwise>
		입력
	</c:otherwise>
</c:choose>
폼</legend>
			<p>
			<label>이름
			<input value="${group.name }"
			name="name"/>
			</label>
			</p>
			<div>
			<label>데뷔년월일</label>
			<div class="tui-datepicker-input tui-datetime-input tui-has-focus">
		        <input type="text"
		         id="datepicker-input" name="debutDate" autocomplete="off" aria-label="Date-Time">
		        <span class="tui-ico-date"></span>
		    </div>
		    <div id="wrapper" style="margin-top: -1px;"></div>
			</div>
		</fieldset>
	</form>
	
	<div class="box_btn">
	<button form="form" class="btn">
	<i class="far fa-edit"></i>
	<c:choose>
	<c:when test="${group!=null}">
		수정
	</c:when>
	<c:otherwise>
		입력
	</c:otherwise>
</c:choose>
	</button>
	<a class="btn" href="/group">
	<i class="fas fa-external-link-alt"></i>
	그룹 목록으로 이동</a>
	</div>
	
<c:import url="/WEB-INF/view/template/footer.jsp"/>
<script src="/js/jquery.js"></script>
<script src="/js/tui-code-snippet.min.js"></script>
<script src="/js/tui-date-picker.min.js"></script>
<script>
    var datepicker = new tui.DatePicker('#wrapper', {
       
    	date: new Date(
    		<c:if test="${group!=null}">
    		"${group.debutDate}"
    		</c:if>	
    	),
    	
        input: {
            element: '#datepicker-input',
            format: 'yyyy-MM-dd'
        },
        language:'ko'
    });

</script>
	
</body>
</html>