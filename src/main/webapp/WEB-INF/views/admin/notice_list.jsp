<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 관리</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body { background-color: #f8f9fa; }
        .container { max-width: 1000px; margin-top: 50px; }
        .table-hover tbody tr:hover { cursor: pointer; }
        .pagination { justify-content: center; }
    </style>
</head>
<body>
<div class="container">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h3>공지사항 관리</h3>
        <div>
            <a href="${pageContext.request.contextPath}/admin/main" class="btn btn-outline-secondary">관리자 홈</a>
            <a href="${pageContext.request.contextPath}/admin/notice/write" class="btn btn-primary">글쓰기</a>
        </div>
    </div>

    <table class="table table-hover text-center">
        <thead class="thead-light">
        <tr>
            <th>번호</th>
            <th style="width: 50%;">제목</th>
            <th>조회수</th>
            <th>작성일</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${list}">
            <tr onclick="location.href='${pageContext.request.contextPath}/admin/notice/detail?notice_id=${item.notice_id}&pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}'" style="cursor: pointer;">
                <td>${item.notice_id}</td>
                <td class="text-left">
                    <c:if test="${item.is_urgent == 'Y'}"><span class="badge badge-danger mr-2">긴급</span></c:if>
                    ${item.title}
                </td>
                <td>${item.views}</td>
                <td>${item.created_at}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <!-- Pagination -->
    <div class="pull-right">
        <ul class="pagination">
            <c:if test="${pageMaker.prev}">
                <li class="page-item">
                    <a class="page-link" href="${pageContext.request.contextPath}/admin/notice/list?pageNum=${pageMaker.startPage - 1}">Previous</a>
                </li>
            </c:if>

            <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                <li class="page-item ${pageMaker.cri.pageNum == num ? 'active' : ''}">
                    <a class="page-link" href="${pageContext.request.contextPath}/admin/notice/list?pageNum=${num}">${num}</a>
                </li>
            </c:forEach>

            <c:if test="${pageMaker.next}">
                <li class="page-item">
                    <a class="page-link" href="${pageContext.request.contextPath}/admin/notice/list?pageNum=${pageMaker.endPage + 1}">Next</a>
                </li>
            </c:if>
        </ul>
    </div>
    <!-- /Pagination -->
</div>
</body>
</html>