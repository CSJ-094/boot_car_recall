<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>결함 신고 목록</title>
    <style>
        body { font-family: 'Noto Sans KR', sans-serif; margin: 0; background-color: #f4f4f4; color: #333; }
        .container { width: 80%; margin: auto; overflow: hidden; }
        header { background: #0d47a1; color: white; padding: 20px 0; text-align: center; }
        header h1 { margin: 0; font-size: 2rem; }
        nav { background: #1565c0; padding: 10px; text-align: center; }
        nav a { color: white; margin: 0 15px; text-decoration: none; font-weight: 500; }
        table { width: 100%; margin-top: 20px; border-collapse: collapse; background: #fff; box-shadow: 0 2px 4px rgba(0,0,0,0.1); table-layout: fixed; }
        th, td { padding: 8px; border-bottom: 1px solid #ddd; text-align: left; vertical-align: middle; word-wrap: break-word; }
        th { background-color: #1e88e5; color: white; }
        tr:hover { background-color: #f1f1f1; }
        .col-small { width: 10%; }
        .col-medium { width: 15%; }
        .pagination { text-align: center; margin-top: 20px; }
        .pagination a, .pagination strong { display: inline-block; padding: 5px 10px; margin: 0 2px; border: 1px solid #ddd; background-color: #fff; text-decoration: none; color: #337ab7; }
        .pagination strong { background-color: #337ab7; color: white; border-color: #337ab7; }
        footer { background: #263238; color: #ccc; text-align: center; padding: 20px; margin-top: 30px; }
    </style>
</head>
<body>
    <header>
        <h1>📋 결함 신고 목록</h1>
    </header>
    <nav>
        <a href="/">홈</a>
        <a href="/recall-status">리콜 현황</a>
        <a href="/defect-report">결함 신고</a>
        <a href="/defect-report-list">신고 목록</a>
    </nav>

    <div class="container">
        <table id="reportTable">
            <thead>
                <tr>
                    <th class="col-small">신고번호</th>
                    <th class="col-small">신고인</th>
                    <th class="col-medium">차량 모델</th>
                    <th class="col-medium">차대번호</th>
                    <th>결함 내용</th>
                    <th class="col-medium">신고일</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${reportList}" var="report">
                    <tr>
                        <td>${report.id}</td>
                        <td>${report.reporterName}</td>
                        <td>${report.carModel}</td>
                        <td>${report.vin}</td>
                        <td>${report.defectDetails}</td>
                        <td><fmt:formatDate value="${report.reportDate}" pattern="yyyy-MM-dd HH:mm"/></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- Pagination -->
        <div class="pagination">
            <c:if test="${pageMaker.prev}">
                <a href="/defect-report-list?pageNum=${pageMaker.startPage - 1}">&laquo;</a>
            </c:if>

            <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
                <c:choose>
                    <c:when test="${pageMaker.cri.pageNum == num}">
                        <strong>${num}</strong>
                    </c:when>
                    <c:otherwise>
                        <a href="/defect-report-list?pageNum=${num}">${num}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <c:if test="${pageMaker.next}">
                <a href="/defect-report-list?pageNum=${pageMaker.endPage + 1}">&raquo;</a>
            </c:if>
        </div>
    </div>

    <footer>
        <p>© 2025 차량 리콜 조회 시스템</p>
    </footer>
</body>
</html>
