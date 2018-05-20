<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1"%>
<header id="header">
    <h1><a href="/">
        <i class="fab fa-java"></i> 아이돌 관리 애플리케이션
    </a>
    </h1>
    <nav id="gnb">
        <h2 class="screen_out">주요 메뉴</h2>
        <ul>
            <li><a href="/group">
                <i class="fab fa-grav"></i>
                그룹 목록</a>
            <li><a href="/idol/page/1">
            <i class="fas fa-user-astronaut"></i>
            아이돌 목록</a>
        </ul>
    </nav>
    <c:if test="${loginAdmin!=null}">
    <form action="/session" method="post">
    <input type="hidden" name="_method" value="DELETE" />
    <button class="btn logout"><i class="fas fa-sign-out-alt"></i> 로그아웃</button>
    </form>
    </c:if>
</header>
<main id="main">
<div class="aux">

