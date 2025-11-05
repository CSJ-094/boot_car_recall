<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 컨텍스트 경로를 변수 ctx에 저장하여 JSP 내 모든 경로에서 사용 --%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<link rel="stylesheet" href="${ctx}/css/header.css" />

<header class="site-header">
    <div class="header-inner">
        <a class="brand" href="${ctx}/">
            <img src="${ctx}/img/car.png" class="brand-logo" alt="자동차 아이콘">
            <span class="brand-text">자동차 리콜 통합센터</span>
        </a>

        <!-- 모바일 메뉴 토글 -->
        <button class="nav-toggle" aria-controls="global-nav" aria-expanded="false" aria-label="메뉴 열기">
            <span class="bar"></span><span class="bar"></span><span class="bar"></span>
        </button>

        <nav id="global-nav" class="nav" aria-label="주 메뉴">
            <ul class="menu">
                <!-- 결함신고 -->
                <li class="menu-item has-sub">
                    <a href="${ctx}/report" class="menu-link">결함신고</a>
                    <ul class="submenu">
                        <li><a href="${ctx}/report/write">신고</a></li>
                        <li><a href="${ctx}/report/history">신고내역</a></li>
                    </ul>
                </li>

                <!-- 리콜정보 -->
                <li class="menu-item has-sub">
                    <a href="${ctx}/info" class="menu-link">리콜정보</a>
                    <ul class="submenu">
                        <li><a href="${ctx}/info/status">리콜현황</a></li>
                    </ul>
                </li>

                <!-- 리콜센터 (공지사항 리스트를 메인으로) -->
                <li class="menu-item has-sub">
                    <a href="${ctx}/notice/list" class="menu-link">리콜센터</a>
                    <ul class="submenu">
                        <li><a href="${ctx}/notice/list">공지사항</a></li>
                        <li><a href="${ctx}/faq/list">FAQ</a></li>
                        <li><a href="${ctx}/centers/about">리콜센터 소개</a></li>
                    </ul>
                </li>

                <!-- 관리자 -->
                <li class="menu-item has-sub">
                    <a href="${ctx}/admin" class="menu-link">관리자</a>
                    <ul class="submenu">
                        <li><a href="${ctx}/admin/notice/list">공지사항 관리</a></li>
                        <li><a href="${ctx}/admin/review">결함신고 검수</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>
</header>
<script src="${ctx}/js/header.js"></script>