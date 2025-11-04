<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>고객 지원 - 공지사항</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" />
    
    <style>
        .notice-container {
            width: 80%;
            margin: 40px auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .notice-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .notice-table th, .notice-table td {
            border-bottom: 1px solid #ddd;
            padding: 12px 15px;
            text-align: center;
        }
        .notice-table th {
            background-color: #f4f4f4;
            font-weight: 600;
        }
        .notice-table tr:hover {
            background-color: #f9f9f9;
        }
        .title-cell {
            text-align: left;
            padding-left: 30px;
        }
        .notice-table a {
            text-decoration: none;
            color: #333;
        }
        .notice-table a:hover {
            text-decoration: underline;
            color: #0d47a1;
        }
        .urgent-badge {
            display: inline-block;
            background-color: #e53935;
            color: white;
            padding: 3px 8px;
            border-radius: 4px;
            font-size: 0.8em;
            font-weight: bold;
            margin-right: 10px;
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

    <div class="notice-container">
        <h2>📢 공지사항</h2>
        
        <table class="notice-table">
            <thead>
                <tr>
                    <th style="width: 10%;">번호</th>
                    <th style="width: auto;">제목</th>
                    <th style="width: 15%;">작성일</th>
                    <th style="width: 10%;">조회수</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${not empty noticeList}">
                        <c:forEach var="dto" items="${noticeList}">
                            <tr>
                                <td>${dto.noticeId}</td>
                                <td class="title-cell">
                                    <c:if test="${dto.isUrgent == 'Y'}">
                                        <span class="urgent-badge">긴급</span>
                                    </c:if>
                                    <a href="${pageContext.request.contextPath}/notice/view?noticeId=${dto.noticeId}">
                                        ${dto.title}
                                    </a>
                                </td>
                                <td>${dto.formattedDate}</td>
                                <td>${dto.views}</td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="4">등록된 공지사항이 없습니다.</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
		<div style="text-align: right; margin-top: 15px;">
		            <a href="${pageContext.request.contextPath}/notice/write" class="btn-primary">공지 작성</a>
		</div>
        
        </div>

		<footer>
		        <p>© 2025 차량 리콜 조회 시스템 | 고객센터: 1234-5678 | 이메일: support@recall.co.kr</p>
		</footer>
</body>
</html>