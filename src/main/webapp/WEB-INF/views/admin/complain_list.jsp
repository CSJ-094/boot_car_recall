<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>고객 문의 목록</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .table-hover tbody tr:hover { cursor: pointer; }
    </style>
</head>
<body>
<div class="container mt-5">
    <h2>고객 문의 목록</h2>
    <table class="table table-hover mt-3">
        <thead class="thead-light">
        <tr>
            <th>문의번호</th>
            <th>제목</th>
            <th>신고인</th>
            <th>문의유형</th>
            <th>작성일</th>
            <th>답변상태</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${list}">
            <tr onclick="location.href='${pageContext.request.contextPath}/admin/complain/detail?report_id=${item.report_id}'">
                <td>${item.report_id}</td>
                <td>${item.title}</td>
                <td>${item.reporter_name}</td>
                <td>${item.complain_type}</td>
                <td>${item.complainDate}</td>
                <td>
                    <c:choose>
                        <c:when test="${not empty item.answer}">
                            <span class="badge badge-success">답변 완료</span>
                        </c:when>
                        <c:otherwise>
                            <span class="badge badge-warning">답변 대기</span>
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>