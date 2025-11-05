<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>FAQ 수정</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" />
    <style>
        .container { width: 60%; max-width: 800px; margin: 50px auto; padding: 30px; background-color: white; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); }
        h2 { text-align: center; color: #0d47a1; margin-bottom: 30px; }
        .form-group { margin-bottom: 20px; }
        label { display: block; margin-bottom: 8px; font-weight: bold; color: #333; }
        input[type="text"], select, textarea { width: 100%; padding: 12px; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; font-size: 1em; }
        textarea { resize: vertical; height: 200px; }
        .btn-group { text-align: right; }
        .btn-group button { padding: 10px 20px; margin-left: 10px; border: none; border-radius: 5px; cursor: pointer; font-weight: bold; }
        .btn-submit { background-color: #1565c0; color: white; }
        .btn-cancel { background-color: #ccc; color: #333; }
    </style>
</head>
<body>
	<header>
		    <h1>차량 리콜 조회</h1>
		    <nav>
		      <a href="${pageContext.request.contextPath}/">홈</a>
		      <a href="#">리콜 안내</a>
			  <a href="/notice/list">고객 지원</a>
			  <a href="/faq/list">문의하기</a>
		    </nav>
	</header>

    <div class="container">
        <h2>FAQ 수정</h2>
        <form action="modify" method="post">
            <input type="hidden" name="faqNo" value="${faqDto.faqNo}">
            
            <div class="form-group">
                <label for="faqCategory">카테고리</label>
                <select id="faqCategory" name="faqCategory" required>
                    <option value="일반" <c:if test="${faqDto.faqCategory == '일반'}">selected</c:if>>일반</option>
                    <option value="리콜" <c:if test="${faqDto.faqCategory == '리콜'}">selected</c:if>>리콜</option>
                    <option value="서비스" <c:if test="${faqDto.faqCategory == '서비스'}">selected</c:if>>서비스</option>
                    <option value="기타" <c:if test="${faqDto.faqCategory == '기타'}">selected</c:if>>기타</option>
                </select>
            </div>
            <div class="form-group">
                <label for="faqTitle">질문 제목</label>
                <input type="text" id="faqTitle" name="faqTitle" value="${faqDto.faqTitle}" required>
            </div>
            <div class="form-group">
                <label for="faqContent">답변 내용</label>
                <textarea id="faqContent" name="faqContent" required>${faqDto.faqContent}</textarea>
            </div>
            
            <p style="font-size: 0.9em; color: #666; text-align: right; margin-bottom: 15px;">
                작성일: ${faqDto.faqDate2}
            </p>

            <div class="btn-group">
                <button type="button" class="btn-cancel" onclick="location.href='list'">취소</button>
                <button type="submit" class="btn-submit">수정 완료</button>
            </div>
        </form>
    </div>
    
	<footer>
		        <p>© 2025 차량 리콜 조회 시스템 | 고객센터: 1234-5678 | 이메일: support@recall.co.kr</p>
		</footer> 
</body>
</html>