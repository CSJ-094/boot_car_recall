<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FAQ 수정</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body { background-color: #f8f9fa; }
        .container { max-width: 800px; margin-top: 50px; }
    </style>
</head>
<body>
<div class="container">
    <h3>FAQ 수정</h3>
    <hr>
    <form action="${pageContext.request.contextPath}/admin/faq/modify/${faq.faq_id}" method="post">
        <input type="hidden" name="faq_id" value="${faq.faq_id}">
        <div class="form-group">
            <label for="category">카테고리</label>
            <select class="form-control" id="category" name="category" required>
                <option value="일반" ${faq.category == '일반' ? 'selected' : ''}>일반</option>
                <option value="리콜" ${faq.category == '리콜' ? 'selected' : ''}>리콜</option>
                <option value="서비스" ${faq.category == '서비스' ? 'selected' : ''}>서비스</option>
                <option value="기타" ${faq.category == '기타' ? 'selected' : ''}>기타</option>
            </select>
        </div>
        <div class="form-group">
            <label for="question">질문</label>
            <input type="text" class="form-control" id="question" name="question" value="${faq.question}" required>
        </div>
        <div class="form-group">
            <label for="answer">답변</label>
            <textarea class="form-control" id="answer" name="answer" rows="15" required>${faq.answer}</textarea>
        </div>
        <div class="text-right">
            <a href="${pageContext.request.contextPath}/admin/faq/${faq.faq_id}" class="btn btn-secondary">취소</a>
            <button type="submit" class="btn btn-primary">저장</button>
        </div>
    </form>
</div>
</body>
</html>