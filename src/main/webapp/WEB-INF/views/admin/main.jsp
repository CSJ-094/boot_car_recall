<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .admin-container {
            max-width: 1200px;
            margin: 50px auto;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
        }
        .chart-container {
            margin-top: 40px;
        }
        .table-container {
            margin-top: 40px;
        }
        .table-hover tbody tr:hover {
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="admin-container">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2>관리자 페이지</h2>
            <a href="${pageContext.request.contextPath}/admin/logout" class="btn btn-secondary">로그아웃</a>
        </div>

        <div class="text-center p-4 mb-4 bg-light rounded">
            <p class="lead mb-3">관리자님, 환영합니다! 원하시는 관리 메뉴를 선택하세요.</p>
            <div>
                <a href="#" class="btn btn-primary mx-2">신고 목록 관리</a>
                <a href="${pageContext.request.contextPath}/admin/notice/list" class="btn btn-info mx-2">공지사항 관리</a>
                <a href="${pageContext.request.contextPath}/admin/press/list" class="btn btn-info mx-2">보도자료 관리</a>
                <a href="${pageContext.request.contextPath}/admin/faq/list" class="btn btn-info mx-2">FAQ 관리</a>
            </div>
        </div>


        <div class="chart-container text-center">
            <h4>최근 7일간 결함 신고 건수</h4>
            <canvas id="dailyReportChart"></canvas>
        </div>

        <div class="table-container">
            <h4>최근 7일간 신고 목록</h4>
            <table class="table table-hover text-left">
                <thead class="thead-light text-center">
                <tr>
                    <th>#</th>
                    <th>신고인</th>
                    <th>차량 모델</th>
                    <th>차대번호(VIN)</th>
                    <th>접수일</th>
                </tr>
                </thead>
                <tbody>
                <c:choose>
                    <c:when test="${not empty recentReports}">
                        <c:forEach var="report" items="${recentReports}">
                            <tr onclick="location.href='${pageContext.request.contextPath}/admin/defect_report/${report.id}'">
                                <td><c:out value="${report.id}"/></td>
                                <td><c:out value="${report.reporterName}"/></td>
                                <td><c:out value="${report.carModel}"/></td>
                                <td><c:out value="${report.vin}"/></td>
                                <td><fmt:formatDate value="${report.reportDate}" pattern="yyyy-MM-dd HH:mm"/></td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="5" class="text-center">최근 7일간 접수된 결함 신고가 없습니다.</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        const dailyStatsData = [
            <c:forEach var="stat" items="${dailyStats}" varStatus="status">
            {
                report_day: "${stat.report_day}",
                count: ${stat.count}
            }
            <c:if test="${not status.last}">,</c:if>
            </c:forEach>
        ];

        const labels = dailyStatsData.map(item => item.report_day);
        const data = dailyStatsData.map(item => item.count);


        const suggestedMax = data.length > 0 ? Math.max(...data) + 2 : 10;

        const ctx = document.getElementById('dailyReportChart').getContext('2d');
        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: labels,
                datasets: [{
                    label: '일일 신고 건수',
                    data: data,
                    backgroundColor: 'rgba(54, 162, 235, 0.5)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true,
                        max: suggestedMax,
                        ticks: {
                            stepSize: 5
                        }
                    }
                }
            }
        });
    });
</script>
</body>
</html>