<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>차량 리콜 조회 시스템</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" />

    <style>
        /* 메인 페이지에만 필요한 스타일이나, 외부 CSS가 아닌 내부에 있던 스타일 중 필수적인 것들을 남김 */

        /* 참고: 기존 <style> 태그 안의 대부분의 공통 스타일은 외부 CSS 파일로 분리되었다고 가정하고 제거합니다.
           만약 해당 스타일이 외부에 없다면, header.css, main.css 등에 추가해야 합니다.
           여기서는 검색 결과 스타일만 남깁니다. */

        /* 검색 결과 스타일 (새로 추가된 기능이므로 포함) */
        .search-results {
            margin-top: 40px;
            text-align: left;
            max-width: 800px;
            margin-left: auto;
            margin-right: auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            color: #333;
        }
        .search-results h3 { color: #0d47a1; margin-bottom: 20px; text-align: center; }
        .search-results ul { list-style: none; padding: 0; }
        .search-results li { border-bottom: 1px solid #eee; padding: 15px 0; }
        .search-results li:last-child { border-bottom: none; }
        .search-results li strong { color: #1565c0; }
        .search-results p { margin: 5px 0; }
        .no-results { text-align: center; color: #dc3545; font-weight: bold; padding: 20px; }
    </style>
</head>
<body>

<jsp:include page="/WEB-INF/views/header.jsp" />

<div class="hero">
    <h2>내 차량이 리콜 대상인지 확인하세요</h2>
    <p>차량 모델명이나 VIN(차대번호)를 입력하세요</p>
    <br />

    <form action="/" method="get" class="search-box">
        <input type="text" id="vinInput" name="query" placeholder="예: 쏘나타, 포터2..." value="${searchQuery}">
        <button type="submit">조회하기</button>
    </form>

    <c:if test="${not empty searchResults}">
        <div class="search-results">
            <h3>'${searchQuery}' 검색 결과</h3>
            <c:if test="${empty searchResults.recallList}">
                <p class="no-results">'${searchQuery}'에 대한 리콜 정보가 없습니다.</p>
            </c:if>
            <c:if test="${not empty searchResults.recallList}">
                <ul>
                    <c:forEach items="${searchResults.recallList}" var="recall">
                        <li>
                            <p><strong>제조사:</strong> ${recall.maker}</p>
                            <p><strong>차종:</strong> ${recall.modelName}</p>
                            <p><strong>리콜 날짜:</strong> ${recall.recallDate}</p>
                            <p><strong>리콜 사유:</strong> ${recall.recallReason}</p>
                        </li>
                    </c:forEach>
                </ul>
            </c:if>
        </div>
    </c:if>

</div>

<section>
    <h3>리콜 절차 및 서비스 안내</h3>
    <div class="features">
        <div class="feature">
            <h4>1️⃣ 리콜 조회</h4>
            <p>차량 번호나 VIN을 입력하면 리콜 여부를 즉시 확인할 수 있습니다.</p>
        </div>
        <div class="feature">
            <h4>2️⃣ 서비스 예약</h4>
            <p>리콜 대상일 경우 근처 서비스센터에서 무료 수리 예약이 가능합니다.</p>
        </div>
        <div class="feature">
            <h4>3️⃣ 안전 보장</h4>
            <p>정부 인증 리콜 시스템으로 차량 안전과 신뢰를 보장합니다.</p>
        </div>
    </div>
</section>

<footer>
    <p>© 2025 차량 리콜 조회 시스템 | 고객센터: 1234-5678 | 이메일: support@recall.co.kr</p>
</footer>

<script>
    // 서버 사이드 검색으로 변경되었으므로 클라이언트 스크립트는 제거합니다.
</script>
</body>
</html>