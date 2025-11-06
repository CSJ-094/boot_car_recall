<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>신고 상세 정보</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body { background-color: #f8f9fa; }
        .detail-container {
            max-width: 800px;
            margin: 50px auto;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
        }
        .detail-item {
            margin-bottom: 1rem;
        }
        .detail-label {
            font-weight: bold;
            color: #495057;
        }
        .defect-detail-box {
            white-space: pre-wrap;
            background-color: #e9ecef;
            padding: 15px;
            border-radius: 5px;
            min-height: 150px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="detail-container">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h3>신고 상세 정보 #${report.report_id}</h3>
            <a href="${pageContext.request.contextPath}/admin/main" class="btn btn-outline-secondary">목록으로</a>
        </div>

        <div class="row detail-item">
            <div class="col-md-3 detail-label">신고인</div>
            <div class="col-md-9">${report.reporter_name}</div>
        </div>
        <div class="row detail-item">
            <div class="col-md-3 detail-label">연락처</div>
            <div class="col-md-9">${report.reporter_phone}</div>
        </div>
        <div class="row detail-item">
            <div class="col-md-3 detail-label">차량 등록번호</div>
            <div class="col-md-9">${report.car_reg_num}</div>
        </div>
        <div class="row detail-item">
            <div class="col-md-3 detail-label">차량 모델</div>
            <div class="col-md-9">${report.car_model}</div>
        </div>
        <div class="row detail-item">
            <div class="col-md-3 detail-label">신고 시간</div>
            <div class="col-md-9">${report.reported_at}</div>
        </div>
        <div class="detail-item">
            <div class="detail-label mb-2">상세 결함 내용</div>
            <div class="defect-detail-box">${report.defect_detail}</div>
        </div>
        <hr>
        <div class="text-right">
            <c:choose>
                <c:when test="${report.reviewed}">
                    <%-- 검수 완료 상태일 때 '검수 취소' 버튼을 표시 --%>
                    <form action="${pageContext.request.contextPath}/admin/report/updateStatus" method="post" style="display: inline;">
                        <input type="hidden" name="report_id" value="${report.report_id}">
                        <input type="hidden" name="reviewed" value="false">
                        <button type="submit" class="btn btn-warning">검수 취소</button>
                    </form>
                </c:when>
                <c:otherwise>
                    <%-- 검수 대기 상태일 때 '검수 완료' 버튼을 표시 --%>
                    <form action="${pageContext.request.contextPath}/admin/report/updateStatus" method="post" style="display: inline;">
                        <input type="hidden" name="report_id" value="${report.report_id}">
                        <input type="hidden" name="reviewed" value="true">
                        <button type="submit" class="btn btn-success">검수 완료</button>
                    </form>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>
</body>
</html>