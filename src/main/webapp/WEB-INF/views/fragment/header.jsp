<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${ctx}/css/header.css" />

<header class="site-header">
  <div class="header-inner">
    <a class="brand" href="${pageContext.request.contextPath}/">
		<img src="${pageContext.request.contextPath}/img/car.png" class="brand-logo">
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
          <a href="${pageContext.request.contextPath}/report" class="menu-link">결함신고</a>
          <ul class="submenu">
            <li><a href="${pageContext.request.contextPath}/report/write">신고</a></li>
            <li><a href="${pageContext.request.contextPath}/report/history">신고내역</a></li>
          </ul>
        </li>

        <!-- 리콜정보 -->
        <li class="menu-item has-sub">
          <a href="${pageContext.request.contextPath}/info" class="menu-link">리콜정보</a>
          <ul class="submenu">
            <li><a href="${pageContext.request.contextPath}/info/status">리콜현황</a></li>
          </ul>
        </li>

        <!-- 리콜센터 -->
        <li class="menu-item has-sub">
          <a href="${pageContext.request.contextPath}/centers" class="menu-link">리콜센터</a>
          <ul class="submenu">
            <li><a href="${pageContext.request.contextPath}/notice/list">공지사항</a></li>
            <li><a href="${pageContext.request.contextPath}/faq/list">FAQ</a></li>
            <li><a href="${pageContext.request.contextPath}/centers/about">리콜센터 소개</a></li>
          </ul>
        </li>

        <!-- 관리자 -->
        <li class="menu-item has-sub">
          <a href="${pageContext.request.contextPath}/admin" class="menu-link">관리자</a>
          <ul class="submenu">
            <li><a href="${pageContext.request.contextPath}/admin/notice/list">공지사항</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/review">결함신고 검수</a></li>
          </ul>
        </li>
      </ul>
    </nav>
  </div>
</header>
<script src="${ctx}/js/header.js"></script>
