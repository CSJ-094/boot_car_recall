<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 작성</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body { background-color: #f8f9fa; }
        .container { max-width: 800px; margin-top: 50px; }
    </style>
</head>
<body>
<div class="container">
    <h3>공지사항 작성</h3>
    <hr>
    <form action="${pageContext.request.contextPath}/admin/notice/write" method="post">
        <div class="form-group">
            <label for="title">제목</label>
            <input type="text" class="form-control" id="title" name="title" required>
        </div>
        <div class="form-group">
            <label for="content">내용</label>
            <textarea class="form-control" id="content" name="content" rows="15" required></textarea>
        </div>
        <div class="text-right">
            <a href="${pageContext.request.contextPath}/admin/notice/list" class="btn btn-secondary">취소</a>
            <button type="submit" class="btn btn-primary">등록</button>
        </div>
    </form>
</div>
</body>
</html>