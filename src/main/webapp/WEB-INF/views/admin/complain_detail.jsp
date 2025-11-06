<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>고객 문의 상세</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h2>고객 문의 상세 및 답변</h2>

    <div class="card mt-4">
        <div class="card-header">
            <strong>문의 정보</strong>
        </div>
        <div class="card-body">
            <p><strong>문의 번호:</strong> <c:out value="${complain.report_id}"/></p>
            <p><strong>제목:</strong> <c:out value="${complain.title}"/></p>
            <p><strong>신고인:</strong> <c:out value="${complain.reporter_name}"/></p>
            <p><strong>연락처:</strong> <c:out value="${complain.phone}"/></p>
            <p><strong>문의 유형:</strong> <c:out value="${complain.complain_type}"/></p>
            <p><strong>작성일:</strong> <c:out value="${complain.complainDate}"/></p>
            <hr>
            <p><strong>문의 내용:</strong></p>
            <pre><c:out value="${complain.content}"/></pre>
        </div>
    </div>

    <div class="card mt-4">
        <div class="card-header">
            <strong>답변 작성</strong>
        </div>
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/admin/complain/answer" method="post">
                <input type="hidden" name="report_id" value="${complain.report_id}">
                <div class="form-group">
                    <c:choose>
                        <c:when test="${not empty complain.answer}">
                            <label for="answer">등록된 답변</label>
                            <textarea class="form-control" id="answer" name="answer" rows="5" placeholder="새로운 답변을 입력하면 기존 답변이 덮어쓰여집니다.">${complain.answer}</textarea>
                        </c:when>
                        <c:otherwise>
                            <label for="answer">답변 내용</label>
                            <textarea class="form-control" id="answer" name="answer" rows="5" placeholder="답변을 입력하세요."></textarea>
                        </c:otherwise>
                    </c:choose>
                </div>
                <button type="submit" class="btn btn-primary">답변 등록/수정</button>
                <a href="${pageContext.request.contextPath}/admin/complain/list" class="btn btn-secondary">목록으로</a>
            </form>
        </div>
    </div>

    <c:if test="${not empty result and result == 'answer_success'}">
        <div class="alert alert-success mt-3" role="alert">
            답변이 성공적으로 등록되었습니다.
        </div>
    </c:if>

</div>
</body>
</html>