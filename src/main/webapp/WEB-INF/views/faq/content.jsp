<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>FAQ 상세 내용</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" />
    <style>
        .container { width: 70%; max-width: 900px; margin: 50px auto; padding: 30px; background-color: white; border-radius: 10px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); }
        h2 { text-align: center; color: #0d47a1; margin-bottom: 20px; border-bottom: 3px solid #0d47a1; padding-bottom: 10px;}
        .faq-header { padding: 15px 0; border-bottom: 1px solid #ddd; margin-bottom: 25px; }
        .faq-header h3 { font-size: 1.8em; color: #333; margin: 0; }
        .faq-meta { display: flex; justify-content: space-between; font-size: 0.9em; color: #777; margin-top: 10px; }
        .faq-meta span { background-color: #e3f2fd; color: #1565c0; padding: 4px 10px; border-radius: 4px; font-weight: bold; }
        
        .faq-content { padding: 30px; background-color: #f9f9f9; border-radius: 6px; line-height: 1.8; min-height: 200px; white-space: pre-wrap; border: 1px solid #eee; }
        .faq-content p { margin: 0; font-size: 1.1em; color: #444; }
        
        .btn-group { text-align: center; margin-top: 30px; }
        .btn-group a { 
            padding: 10px 20px; 
            margin: 0 5px; 
            border: none; 
            border-radius: 5px; 
            cursor: pointer; 
            font-weight: bold;
            text-decoration: none;
            display: inline-block;
        }
        .btn-list { background-color: #607d8b; color: white; }
        .btn-modify { background-color: #ff9800; color: white; }
        .btn-delete { background-color: #f44336; color: white; }
    </style>
</head>
<body>

	<header>
		    <h1>차량 리콜 조회</h1>
		    <nav>
		      <a href="#">홈</a>
		      <a href="#">리콜 안내</a>
		      <a href="#">고객 지원</a>
		      <a href="#">문의하기</a>
		    </nav>
		  </header>

    <div class="container">
        <h2>자주 묻는 질문 상세</h2>

        <div class="faq-header">
            <h3>Q. ${faqDto.faqTitle}</h3>
            <div class="faq-meta">
                <span>카테고리: ${faqDto.faqCategory}</span>
                <span>FAQ 번호: ${faqDto.faqNo} | 등록일: ${faqDto.faqDate2}</span>
            </div>
        </div>
        
        <div class="faq-content">
            <p>A. ${faqDto.faqContent}</p>
        </div>

        <div class="btn-group">
            <a href="flist" class="btn-list">목록</a>
            <a href="modify_view?faqNo=${faqDto.faqNo}" class="btn-modify">수정</a>
            <a href="delete?faqNo=${faqDto.faqNo}" class="btn-delete" onclick="return confirm('정말 이 FAQ를 삭제하시겠습니까?');">삭제</a>
        </div>
    </div>
	<footer>
		        <p>© 2025 차량 리콜 조회 시스템 | 고객센터: 1234-5678 | 이메일: support@recall.co.kr</p>
		</footer>

</body>
</html>