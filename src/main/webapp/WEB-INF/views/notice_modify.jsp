<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 수정</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body { background-color: #f8f9fa; }
        .container { max-width: 800px; margin-top: 50px; }
    </style>
</head>
<body>
<div class="container">
    <h3>공지사항 수정</h3>
    <hr>
    <form action="${pageContext.request.contextPath}/admin/notice/modify" method="post">
        <input type="hidden" name="notice_id" value="${notice.notice_id}">
        <div class="form-group">
            <label for="title">제목</label>
            <input type="text" class="form-control" id="title" name="title" value="${notice.title}" required>
        </div>
        <div class="form-group">
            <label for="content">내용</label>
            <textarea class="form-control" id="content" name="content" rows="15" required>${notice.content}</textarea>
        </div>
        <div class="form-group form-check">
            <input type="checkbox" class="form-check-input" id="is_urgent" name="is_urgent" value="Y" ${notice.is_urgent == 'Y' ? 'checked' : ''}>
            <label class="form-check-label" for="is_urgent">긴급 공지</label>
        </div>
        <input type="hidden" name="is_urgent" value="N" /> <%-- 체크 안됐을 때 'N' 전송 --%>

        <div class="text-right">
            <a href="${pageContext.request.contextPath}/admin/notice/${notice.notice_id}" class="btn btn-secondary">취소</a>
            <button type="submit" class="btn btn-primary">저장</button>
        </div>
    </form>
</div>
</body>
</html>