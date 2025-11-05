<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!-- 공통 헤더 -->
<jsp:include page="/WEB-INF/views/fragment/header.jsp"/>

<!-- 페이지 전용 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/centers-about.css" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>자주 묻는 질문 (FAQ)</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body { background-color: #f8f9fa; }
        .container { max-width: 1000px; margin-top: 50px; }
        .card-header-faq { background-color: #ffffff; cursor: pointer; border-bottom: 1px solid #dee2e6; }
        .card-header-faq h5 { margin-bottom: 0; }
        .faq-category { font-size: 0.8em; }
        .card-body-faq { background-color: #f1f1f1; }
        .pagination { justify-content: center; }
    </style>
</head>
<body>
<div class="container">
    <h3 class="mt-5 mb-4 text-center">자주 묻는 질문 (FAQ)</h3>
    
    <div id="faqAccordion">
        <c:forEach var="item" items="${list}" varStatus="status">
            <div class="card mb-1">
                <div class="card-header-faq" id="heading-${item.faq_id}" data-toggle="collapse" data-target="#collapse-${item.faq_id}" aria-expanded="false" aria-controls="collapse-${item.faq_id}">
                    <h5 class="mb-0 d-flex justify-content-between align-items-center py-2">
                        <span class="faq-category badge badge-info mr-3">${item.category}</span>
                        <span class="text-dark font-weight-bold flex-grow-1 text-left">${item.question}</span>
                        <span class="text-muted"><i class="fas fa-chevron-down"></i></span>
                    </h5>
                </div>
                
                <div id="collapse-${item.faq_id}" class="collapse" aria-labelledby="heading-${item.faq_id}" data-parent="#faqAccordion">
                    <div class="card-body-faq p-4">
                        <p style="white-space: pre-wrap;">${item.answer}</p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    <div class="pull-right mt-4">
        <ul class="pagination">
            <c:if test="${pageMaker.prev}">
                <li class="page-item">
                    <a class="page-link" href="${pageContext.request.contextPath}/faq/list?pageNum=${pageMaker.startPage - 1}">이전</a>
                </li>
            </c:if>
            <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                <li class="page-item ${pageMaker.cri.pageNum == num ? 'active' : ''}">
                    <a class="page-link" href="${pageContext.request.contextPath}/faq/list?pageNum=${num}">${num}</a>
                </li>
            </c:forEach>
            <c:if test="${pageMaker.next}">
                <li class="page-item">
                    <a class="page-link" href="${pageContext.request.contextPath}/faq/list?pageNum=${pageMaker.endPage + 1}">다음</a>
                </li>
            </c:if>
        </ul>
    </div>
</div>
</body>
</html>

<!-- 공통 푸터 -->
<jsp:include page="/WEB-INF/views/fragment/footer.jsp"/>

<!-- 페이지 전용 JS -->
<script src="${ctx}/resources/js/centers-about.js"></script>

