<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/views/fragment/header.jsp"/>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/centers-about.css" />

<style>
    /* 전체 콘텐츠 영역의 최대 너비 및 중앙 정렬 */
    .content-wrapper {
        max-width: 1200px; 
        margin: 50px auto; 
        padding: 0 15px; 
    }
    /* 테이블 행에 마우스 오버 시 커서 변경 */
    .table-hover tbody tr:hover { 
        cursor: pointer; 
        background-color: #f5f5f5; /* 마우스 오버 시 배경색 변경 */
    }
    /* 테이블 제목 (<th>) 텍스트를 가운데로 정렬 */
    .notice-table thead th {
        text-align: center;
        vertical-align: middle;
    }
    /* 번호, 작성일, 조회수 컬럼은 가운데 정렬 */
    .notice-table tbody td:nth-child(1), /* 번호 */
    .notice-table tbody td:nth-child(3), /* 작성일 */
    .notice-table tbody td:nth-child(4) { /* 조회수 */
        text-align: center;
        vertical-align: middle;
    }
    /* 제목 컬럼은 왼쪽 정렬 */
    .notice-table tbody td:nth-child(2) {
        text-align: left;
    }
    /* 페이지네이션 중앙 정렬 */
    .pagination-container {
        display: flex;
        justify-content: center;
        margin-top: 20px;
    }
    /* 사이드바 스타일 (기존 CSS 사용 시 이 부분은 삭제 가능) */
    .sidebar .list-group-item.active {
        background-color: #007bff;
        border-color: #007bff;
        color: white;
    }
</style>

<div class="container">
    <h3 class="mt-5 mb-4 text-center">공지사항</h3>

    <table class="table table-hover text-center">
        <thead class="thead-light">
            <tr origin="center">
                <th style="width: 10%;">번호</th>
                <th style="width: 50%;">제목</th>
                <th style="width: 20%;">작성일</th>
                <th style="width: 10%;">조회수</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${list}">
            <tr onclick="location.href='${pageContext.request.contextPath}/notice/${item.notice_id}'" style="cursor: pointer;">
                <td>${item.notice_id}</td>
                <td class="text-left">
                    <c:if test="${item.is_urgent == 'Y'}"><span class="badge badge-danger mr-2">필독</span></c:if>
                    ${item.title}
                </td>
                <td>${item.created_at}</td>
                <td>${item.views}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    
    <div class="d-flex justify-content-center">
        <ul class="pagination">
            <c:if test="${pageMaker.prev}">
                <li class="page-item">
                    <a class="page-link" href="${pageContext.request.contextPath}/notice/list?pageNum=${pageMaker.startPage - 1}">이전</a>
                </li>
            </c:if>
            <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                <li class="page-item ${pageMaker.cri.pageNum == num ? 'active' : ''}">
                    <a class="page-link" href="${pageContext.request.contextPath}/notice/list?pageNum=${num}">${num}</a>
                </li>
            </c:forEach>
            <c:if test="${pageMaker.next}">
                <li class="page-item">
                    <a class="page-link" href="${pageContext.request.contextPath}/notice/list?pageNum=${pageMaker.endPage + 1}">다음</a>
                </li>
            </c:if>
        </ul>
    </div>
</div>

<jsp:include page="/WEB-INF/views/fragment/footer.jsp"/>

<script src="${ctx}/resources/js/centers-about.js"></script>