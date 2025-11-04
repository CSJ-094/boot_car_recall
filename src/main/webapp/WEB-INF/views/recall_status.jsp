<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>차량 리콜 현황</title>
    <style>
        body { font-family: 'Noto Sans KR', sans-serif; margin: 0; background-color: #f4f4f4; color: #333; }
        .container { width: 80%; margin: auto; overflow: hidden; }
        header { background: #0d47a1; color: white; padding: 20px 0; text-align: center; }
        header h1 { margin: 0; font-size: 2rem; }
        nav { background: #1565c0; padding: 10px; text-align: center; }
        nav a { color: white; margin: 0 15px; text-decoration: none; font-weight: 500; }
        .search-container { 
            padding: 20px; 
            background: #fff; 
            margin-top: 20px; 
            border-radius: 8px; 
            box-shadow: 0 2px 4px rgba(0,0,0,0.1); 
            text-align: center; /* 폼 자체를 중앙 정렬하기 위함 */
        }
        .search-container form { 
            display: flex; /* flexbox를 사용하여 내부 요소 정렬 */
            justify-content: center; /* 가로 중앙 정렬 */
            align-items: center; /* 세로 중앙 정렬 */
            max-width: 500px; /* 폼의 최대 너비 제한 */
            margin: 0 auto; /* 폼 자체를 부모 요소 내에서 중앙 정렬 */
        }
        .search-container input[type="text"] { 
            flex-grow: 1; /* 남은 공간을 채우도록 설정 */
            padding: 10px; 
            border: 1px solid #ddd; 
            border-radius: 4px; 
            margin-right: 10px; /* 입력 필드와 버튼 사이 간격 */
            min-width: 150px; /* 최소 너비 지정 */
        }
        .search-container button { 
            padding: 10px 20px; 
            background: #0d47a1; 
            color: white; 
            border: none; 
            cursor: pointer; 
            border-radius: 4px; 
        }
        table { 
            width: 100%; 
            margin-top: 20px; 
            border-collapse: collapse; 
            background: #fff; 
            box-shadow: 0 2px 4px rgba(0,0,0,0.1); 
            table-layout: fixed; /* 테이블 레이아웃 고정 */
        }
        th, td { 
            padding: 8px; 
            border-bottom: 1px solid #ddd; 
            text-align: left; 
            vertical-align: middle; 
            word-wrap: break-word; /* 긴 텍스트 자동 줄바꿈 */
        }
        th { background-color: #1e88e5; color: white; }
        tr:hover { background-color: #f1f1f1; }
        .error-message { color: red; text-align: center; padding: 20px; background-color: #ffebee; border: 1px solid #e57373; border-radius: 8px; margin-top: 20px; }
        footer { background: #263238; color: #ccc; text-align: center; padding: 20px; margin-top: 30px; }
        .pagination { text-align: center; margin-top: 20px; }
        .pagination a, .pagination strong { display: inline-block; padding: 5px 10px; margin: 0 2px; border: 1px solid #ddd; background-color: #fff; text-decoration: none; color: #337ab7; }
        .pagination strong { background-color: #337ab7; color: white; border-color: #337ab7; }
        
        /* 컬럼 너비 설정 */
        .col-maker { width: 12%; }
        .col-model { width: 18%; }
        .col-date { width: 12%; }

    </style>
</head>
<body>
    <header>
        <h1>🚗 차량 리콜 현황</h1>
    </header>
    <nav>
        <a href="/">홈</a>
        <a href="/recall-status">리콜 현황</a>
        <a href="/defect-report">결함 신고</a>
        <a href="/defect-report-list">신고 목록</a>
    </nav>
    <div class="container">
        <c:if test="${not empty errorMessage}">
            <div class="error-message">
                <p>${errorMessage}</p>
            </div>
        </c:if>

        <div class="search-container">
            <form action="/recall-status" method="get">
                <input type="text" id="searchInput" name="keyword" placeholder="제조사 또는 차종으로 검색..." value="${pageMaker.cri.keyword}">
                <button type="submit">검색</button>
            </form>
        </div>

        <c:choose>
            <c:when test="${not empty recallList}">
                <table id="recallTable">
                    <thead>
                        <tr>
                            <th class="col-maker">제조사</th>
                            <th class="col-model">차종</th>
                            <th class="col-date">리콜 날짜</th>
                            <th>리콜 사유</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${recallList}" var="recall">
                            <tr>
                                <td>${recall.maker}</td>
                                <td>${recall.modelName}</td>
                                <td>${recall.recallDate}</td>
                                <td>${recall.recallReason}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <!-- Pagination -->
                <div class="pagination">
                    <c:if test="${pageMaker.prev}">
                        <a href="/recall-status?pageNum=${pageMaker.startPage - 1}&keyword=${pageMaker.cri.keyword}">&laquo;</a>
                    </c:if>

                    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
                        <c:choose>
                            <c:when test="${pageMaker.cri.pageNum == num}">
                                <strong>${num}</strong>
                            </c:when>
                            <c:otherwise>
                                <a href="/recall-status?pageNum=${num}&keyword=${pageMaker.cri.keyword}">${num}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <c:if test="${pageMaker.next}">
                        <a href="/recall-status?pageNum=${pageMaker.endPage + 1}&keyword=${pageMaker.cri.keyword}">&raquo;</a>
                    </c:if>
                </div>

            </c:when>
            <c:otherwise>
                <c:if test="${empty errorMessage}">
                    <p style="text-align:center; padding-top: 20px;">표시할 리콜 데이터가 없습니다.</p>
                </c:if>
            </c:otherwise>
        </c:choose>
    </div>
    <footer>
        <p>© 2025 차량 리콜 조회 시스템</p>
    </footer>

    <script>
    // 클라이언트 사이드 검색 기능은 서버 사이드 검색으로 대체되었으므로 제거합니다.
    </script>
</body>
</html>
