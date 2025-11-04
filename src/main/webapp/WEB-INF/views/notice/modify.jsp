<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>공지사항 수정</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" />
    <style>
        .form-container { width: 60%; margin: 40px auto; padding: 30px; background-color: white; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
        .form-container h2 { border-bottom: 2px solid #0d47a1; padding-bottom: 10px; margin-bottom: 25px; }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; font-weight: bold; margin-bottom: 5px; }
        .form-group input[type="text"], .form-group textarea { width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px; box-sizing: border-box; }
        .form-group textarea { height: 250px; resize: vertical; }
        .form-actions { text-align: right; margin-top: 20px; }
        .btn-submit { padding: 10px 20px; background-color: #0d47a1; color: white; border: none; border-radius: 4px; cursor: pointer; }
        .btn-cancel { padding: 10px 20px; background-color: #6c757d; color: white; border: none; border-radius: 4px; text-decoration: none; margin-left: 10px; }
    </style>
</head>
<body>
    <header>
        <h1>차량 리콜 조회</h1>
        <nav>
            <a href="${pageContext.request.contextPath}/">홈</a>
            <a href="#">리콜 안내</a>
            <a href="${pageContext.request.contextPath}/notice/list">고객 지원</a> 
            <a href="#">문의하기</a>
        </nav>
    </header>

    <div class="form-container">
        <h2>공지사항 수정 (#${noticeDto.noticeId})</h2>
        
        <form action="${pageContext.request.contextPath}/notice/modify" method="post">
            
            <!-- noticeId는 Hidden 필드로 전송 -->
            <input type="hidden" name="noticeId" value="${noticeDto.noticeId}">
            
            <div class="form-group">
                <label for="title">제목</label>
                <input type="text" id="title" name="title" value="${noticeDto.title}" required>
            </div>
            
            <div class="form-group">
                <label for="content">내용</label>
                <textarea id="content" name="content" required>${noticeDto.content}</textarea>
            </div>
            
            <div class="form-group">
                <label for="isUrgent">긴급 공지 여부</label>
                <!-- 체크박스는 미체크 시 값이 전송되지 않으므로, 'N' 값을 위한 hidden 필드를 추가하여 
                     체크되지 않았을 때도 'N' 값이 확실히 전송되도록 합니다. -->
                <input type="hidden" name="isUrgent" value="N">
                <input type="checkbox" id="isUrgent" name="isUrgent" value="Y" 
                       <c:if test="${noticeDto.isUrgent eq 'Y'}">checked</c:if>> 긴급 공지로 표시
            </div>
            
            <div class="form-actions">
                <button type="submit" class="btn-submit">수정하기</button>
                <a href="${pageContext.request.contextPath}/notice/view?noticeId=${noticeDto.noticeId}" class="btn-cancel">취소</a>
            </div>
        </form>
    </div>

    <footer>
        <p>© 2025 차량 리콜 조회 시스템 | 고객센터: 1234-5678 | 이메일: support@...</p>
    </footer>
</body>
</html>