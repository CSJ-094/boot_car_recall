<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FAQ 상세</title>
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
                <span class="badge badge-info mr-2">${faq.category}</span>
                ${faq.question}
            </h4>
            <div class="d-flex justify-content-between text-muted small">
                <span>작성일: ${faq.created_at}</span>
            </div>
        </div>
        <div class="card-body">
            ${faq.answer}
        </div>
        <div class="card-footer text-right">
            <a href="${pageContext.request.contextPath}/faq/list" class="btn btn-secondary">목록으로</a>
        </div>
    </div>
</div>
</body>
</html>