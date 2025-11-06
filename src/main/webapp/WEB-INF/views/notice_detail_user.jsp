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
            <%-- ✅ 관리자 링크 /admin/notice/list 를 유저용 링크 /notice/list 로 변경합니다. --%>
            <a href="${pageContext.request.contextPath}/notice/list" class="btn btn-secondary">목록으로</a>
            
            <%-- ⚠️ 수정, 삭제 버튼 및 관련 스크립트 제거됨 --%>
        </div>
    </div>
</div>

</body>
</html>