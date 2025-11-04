<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>결함 신고 수정</title>
    <style>
        body { font-family: 'Noto Sans KR', sans-serif; margin: 0; background-color: #f4f4f4; color: #333; }
        .container { width: 60%; margin: auto; padding: 20px; background-color: #fff; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); margin-top: 30px; }
        header { background: #0d47a1; color: white; padding: 20px 0; text-align: center; }
        header h1 { margin: 0; font-size: 2rem; }
        nav { background: #1565c0; padding: 10px; text-align: center; }
        nav a { color: white; margin: 0 15px; text-decoration: none; font-weight: 500; }
        h2 { text-align: center; color: #0d47a1; margin-bottom: 20px; }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; margin-bottom: 5px; font-weight: bold; }
        .form-group input, .form-group textarea { width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px; box-sizing: border-box; }
        .form-group textarea { resize: vertical; height: 150px; }
        .btn-group { text-align: center; margin-top: 20px; }
        .btn-group button, .btn-group a { display: inline-block; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; font-size: 1.1em; font-weight: 600; margin: 0 5px; text-decoration: none; }
        .btn-group .submit-btn { background-color: #0d47a1; color: white; }
        .btn-group .submit-btn:hover { background-color: #1565c0; }
        .btn-group .cancel-btn { background-color: #6c757d; color: white; }
        .btn-group .cancel-btn:hover { background-color: #5a6268; }
        footer { background: #263238; color: #ccc; text-align: center; padding: 20px; margin-top: 30px; }
    </style>
</head>
<body>
    <header>
        <h1>📋 결함 신고 수정</h1>
    </header>
    <nav>
        <a href="/">홈</a>
        <a href="/recall-status">리콜 현황</a>
        <a href="/defect-report">결함 신고</a>
        <a href="/defect-report-list">신고 목록</a>
        <a href="#">고객 지원</a>
    </nav>

    <div class="container">
        <h2>결함 신고 수정</h2>
        <c:if test="${empty report}">
            <p style="text-align:center; color: red;">수정할 신고를 찾을 수 없습니다.</p>
        </c:if>
        <c:if test="${not empty report}">
            <form action="/defect-report-edit" method="post">
                <input type="hidden" name="id" value="${report.id}">
                <div class="form-group">
                    <label for="reporterName">신고인 성명</label>
                    <input type="text" id="reporterName" name="reporterName" value="${report.reporterName}" required>
                </div>
                <div class="form-group">
                    <label for="contact">연락처</label>
                    <input type="text" id="contact" name="contact" value="${report.contact}" required>
                </div>
                <div class="form-group">
                    <label for="carModel">차량 모델</label>
                    <input type="text" id="carModel" name="carModel" value="${report.carModel}" required>
                </div>
                <div class="form-group">
                    <label for="vin">차대번호 (VIN)</label>
                    <input type="text" id="vin" name="vin" value="${report.vin}">
                </div>
                <div class="form-group">
                    <label for="defectDetails">결함 내용</label>
                    <textarea id="defectDetails" name="defectDetails" required>${report.defectDetails}</textarea>
                </div>
                <div class="btn-group">
                    <button type="submit" class="submit-btn">수정 완료</button>
                    <a href="/defect-report-detail?id=${report.id}" class="cancel-btn">취소</a>
                </div>
            </form>
        </c:if>
    </div>

    <footer>
        <p>© 2025 차량 리콜 조회 시스템</p>
    </footer>
</body>
</html>
