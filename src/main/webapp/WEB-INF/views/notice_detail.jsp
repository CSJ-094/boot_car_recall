<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 상세</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body { background-color: #f8f9fa; }
        .container { max-width: 900px; margin-top: 50px; }
        .card-header { background-color: #f1f1f1; }
        .card-body { min-height: 300px; white-space: pre-wrap; }
    </style>
</head>
<body>
<div class="container">
    <div class="card">
        <div class="card-header">
            <h4>
                <c:if test="${notice.is_urgent == 'Y'}"><span class="badge badge-danger mr-2">긴급</span></c:if>
                ${notice.title}
            </h4>
            <div class="d-flex justify-content-between text-muted small">
                <span>조회수: ${notice.views}</span>
                <span>작성일: ${notice.created_at}</span>
            </div>
        </div>
        <div class="card-body">
            ${notice.content}
        </div>
        <div class="card-footer text-right">
            <a href="${pageContext.request.contextPath}/admin/notice/list" class="btn btn-secondary">목록</a>
            <a href="${pageContext.request.contextPath}/admin/notice/modify/${notice.notice_id}" class="btn btn-primary">수정</a>
            <button type="button" class="btn btn-danger" onclick="deleteNotice()">삭제</button>
        </div>
    </div>
</div>

<form id="deleteForm" action="${pageContext.request.contextPath}/admin/notice/delete" method="post" style="display: none;">
    <input type="hidden" name="notice_id" value="${notice.notice_id}">
</form>

<script>
    function deleteNotice() {
        if (confirm("정말로 삭제하시겠습니까?")) {
            document.getElementById('deleteForm').submit();
        }
    }
</script>
</body>
</html>