<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>${noticeDto.title} - 공지사항 상세</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" />
    
    <style>
        .view-container {
            width: 80%;
            margin: 40px auto;
            padding: 30px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .notice-header {
            border-bottom: 2px solid #0d47a1;
            padding-bottom: 15px;
            margin-bottom: 25px;
        }
        .notice-header h2 {
            font-size: 1.8rem;
            color: #222;
            margin-bottom: 5px;
        }
        .notice-info {
            color: #666;
            font-size: 0.9em;
            display: flex;
            justify-content: space-between;
        }
        .notice-content {
            min-height: 200px;
            line-height: 1.8;
            padding: 20px 0;
            border-bottom: 1px dashed #ddd;
            white-space: pre-wrap; /* CLOB 내용을 줄바꿈 포함하여 표시 */
        }
        .notice-actions {
            margin-top: 20px;
            text-align: right;
        }
        .notice-actions a {
            padding: 8px 15px;
            background-color: #0d47a1;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            margin-left: 10px;
        }
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

    <div class="view-container">
        
        <div class="notice-header">
            <h2>${noticeDto.title}</h2>
            <div class="notice-info">
                <span>작성일: ${noticeDto.formattedDate}</span>
                <span>조회수: ${noticeDto.views}</span>
            </div>
        </div>
        
        <div class="notice-content">
            ${noticeDto.content}
        </div>

		<div class="notice-actions">
		            <a href="${pageContext.request.contextPath}/notice/modify?noticeId=${noticeDto.noticeId}">수정</a>
		            <a href="${pageContext.request.contextPath}/notice/delete?noticeId=${noticeDto.noticeId}" 
		               onclick="return confirm('정말로 [${noticeDto.title}] 공지사항을 삭제하시겠습니까?');">삭제</a>
		            <a href="${pageContext.request.contextPath}/notice/list">목록으로</a>
		</div>
        
    </div>

	<footer>
	        <p>© 2025 차량 리콜 조회 시스템 | 고객센터: 1234-5678 | 이메일: support@...</p>
	</footer>
</body>
</html>