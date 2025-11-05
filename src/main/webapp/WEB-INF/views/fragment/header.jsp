<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/css/header.css" />

<header class="site-header">
  <div class="header-inner">
    <a class="brand" href="/">
		<img src="/img/car.png" class="brand-logo">
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
          <a href="/defect_report" class="menu-link">결함신고</a>
          <ul class="submenu">
            <li><a href="/defect_report">신고</a></li>
            <li><a href="/defect_report_list">신고내역</a></li>
          </ul>
        </li>

        <!-- 리콜정보 -->
        <li class="menu-item has-sub">
          <a href="/recall-status" class="menu-link">리콜정보</a>
          <ul class="submenu">
            <li><a href="/recall-status">리콜현황</a></li>
          </ul>
        </li>

        <!-- 리콜센터 -->
        <li class="menu-item has-sub">
          <a href="/centers/notice" class="menu-link">리콜센터</a>
          <ul class="submenu">
            <li><a href="/centers/notice">공지사항</a></li>
            <li><a href="/centers/faq">FAQ</a></li>
            <li><a href="/centers/about">리콜센터 소개</a></li>
          </ul>
        </li>

        <!-- 관리자 -->
        <li class="menu-item has-sub">
          <a href="/admin/notice" class="menu-link">관리자</a>
          <ul class="submenu">
            <li><a href="/admin/notice">공지사항</a></li>
            <li><a href="/admin/review">결함신고 검수</a></li>
          </ul>
        </li>
      </ul>
    </nav>
  </div>
</header>
<script src="/js/header.js"></script>
