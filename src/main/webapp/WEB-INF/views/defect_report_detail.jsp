<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>결함 신고 상세</title>
    <style>
        body { font-family: 'Noto Sans KR', sans-serif; margin: 0; background-color: #f4f4f4; color: #333; }
        .container { width: 60%; margin: auto; padding: 20px; background-color: #fff; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); margin-top: 30px; }
        header { background: #0d47a1; color: white; padding: 20px 0; text-align: center; }
        header h1 { margin: 0; font-size: 2rem; }
        nav { background: #1565c0; padding: 10px; text-align: center; }
        nav a { color: white; margin: 0 15px; text-decoration: none; font-weight: 500; }
        h2 { text-align: center; color: #0d47a1; margin-bottom: 20px; }
        .detail-item { margin-bottom: 10px; padding-bottom: 10px; border-bottom: 1px solid #eee; }
        .detail-item:last-child { border-bottom: none; }
        .detail-item label { font-weight: bold; display: inline-block; width: 120px; color: #555; }
        .detail-item span { color: #333; }
        .defect-details-box { border: 1px solid #ddd; padding: 15px; border-radius: 4px; background-color: #f9f9f9; margin-top: 10px; line-height: 1.6; white-space: pre-wrap; word-wrap: break-word; }
        .back-btn { display: inline-block; margin-top: 20px; padding: 10px 20px; background-color: #6c757d; color: white; text-decoration: none; border-radius: 4px; }
        .back-btn:hover { background-color: #5a6268; }
        footer { background: #263238; color: #ccc; text-align: center; padding: 20px; margin-top: 30px; }
    </style>
</head>
<body>
    <header>
        <h1>📋 결함 신고 상세</h1>
    </header>
    <nav>
        <a href="/">홈</a>
        <a href="/recall-status">리콜 현황</a>
        <a href="/defect-report">결함 신고</a>
        <a href="/defect-report-list">신고 목록</a>
        <a href="#">고객 문의</a>
    </nav>

    <div class="container">
        <h2>신고 상세 내용</h2>
        <c:if test="${empty report}">
            <p style="text-align:center; color: red;">해당 신고를 찾을 수 없습니다.</p>
        </c:if>
        <c:if test="${not empty report}">
            <div class="detail-item">
                <label>신고번호:</label><span>${report.id}</span>
            </div>
            <div class="detail-item">
                <label>신고인 성명:</label><span>${report.reporterName}</span>
            </div>
            <div class="detail-item">
                <label>연락처:</label><span>${report.contact}</span>
            </div>
            <div class="detail-item">
                <label>차량 모델:</label><span>${report.carModel}</span>
            </div>
            <div class="detail-item">
                <label>차대번호 (VIN):</label><span>${report.vin}</span>
            </div>
            <div class="detail-item">
                <label>신고일:</label><span><fmt:formatDate value="${report.reportDate}" pattern="yyyy-MM-dd HH:mm"/></span>
            </div>
            <div class="detail-item">
                <label>결함 내용:</label>
                <div class="defect-details-box">${report.defectDetails}</div>
            </div>
        </c:if>
        <a href="/defect-report-list" class="back-btn">목록으로 돌아가기</a>
    </div>

    <footer>
        <p>© 2025 차량 리콜 조회 시스템</p>
    </footer>
</body>
</html>
