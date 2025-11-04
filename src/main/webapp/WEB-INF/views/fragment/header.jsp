<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<header class="site-header">
  <div class="header-inner">
    <a class="brand" href="${pageContext.request.contextPath}/">
      자동차 리콜 통합센터
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
            <li><a href="${pageContext.request.contextPath}/centers/notice">공지사항</a></li>
            <li><a href="${pageContext.request.contextPath}/centers/faq">FAQ</a></li>
            <li><a href="${pageContext.request.contextPath}/centers/about">리콜센터 소개</a></li>
          </ul>
        </li>

        <!-- 관리자 -->
        <li class="menu-item has-sub">
          <a href="${pageContext.request.contextPath}/admin" class="menu-link">관리자</a>
          <ul class="submenu">
            <li><a href="${pageContext.request.contextPath}/admin/notice">공지사항</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/review">결함신고 검수</a></li>
          </ul>
        </li>
      </ul>
    </nav>
  </div>
</header>

<script>
  // 모바일 햄버거 토글
  (function () {
    const btn = document.querySelector('.nav-toggle');
    const nav = document.getElementById('global-nav');

    if (btn && nav) {
      btn.addEventListener('click', () => {
        const expanded = btn.getAttribute('aria-expanded') === 'true';
        btn.setAttribute('aria-expanded', String(!expanded));
        nav.classList.toggle('open');
        document.body.classList.toggle('nav-open');
      });
    }

	 // 서브메뉴 키보드 접근성 + 모바일 아코디언
	    const mq = window.matchMedia('(max-width: 992px)');
	    document.querySelectorAll('.menu-item.has-sub > .menu-link').forEach(link => {
	      link.addEventListener('keydown', e => {
	        if (e.key === 'Enter' || e.key === ' ') {
	          e.preventDefault();
	          link.parentElement.classList.toggle('sub-open');
	        }
	      });
	      link.addEventListener('click', e => {
	        if (mq.matches) {            // 모바일에서만 링크 이동 막고 토글
	          e.preventDefault();
	          link.parentElement.classList.toggle('sub-open');
	        }
	      });
	    });
	  })();
	</script>