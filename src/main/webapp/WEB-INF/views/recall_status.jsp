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
        .search-container { padding: 20px; background: #fff; margin-top: 20px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); }
        .search-container input[type="text"] { width: 80%; padding: 10px; border: 1px solid #ddd; border-radius: 4px; }
        .search-container button { padding: 10px 20px; background: #0d47a1; color: white; border: none; cursor: pointer; border-radius: 4px; }
        table { width: 100%; margin-top: 20px; border-collapse: collapse; background: #fff; box-shadow: 0 2px 4px rgba(0,0,0,0.1); }
        th, td { padding: 12px; border-bottom: 1px solid #ddd; text-align: left; }
        th { background-color: #1e88e5; color: white; }
        tr:hover { background-color: #f1f1f1; }
        .error-message { color: red; text-align: center; padding: 20px; background-color: #ffebee; border: 1px solid #e57373; border-radius: 8px; margin-top: 20px; }
        footer { background: #263238; color: #ccc; text-align: center; padding: 20px; margin-top: 30px; }
    </style>
</head>
<body>
    <header>
        <h1>🚗 차량 리콜 현황</h1>
    </header>
    <nav>
        <a href="/">홈</a>
        <a href="/recall-status">리콜 현황</a>
        <a href="#">고객 지원</a>
        <a href="#">문의하기</a>
    </nav>
    <div class="container">
        <c:if test="${not empty errorMessage}">
            <div class="error-message">
                <p>${errorMessage}</p>
            </div>
        </c:if>

        <div class="search-container">
            <input type="text" id="searchInput" onkeyup="filterTable()" placeholder="제조사 또는 차종으로 검색...">
            <button onclick="filterTable()">검색</button>
        </div>

        <c:choose>
            <c:when test="${not empty recallList}">
                <table id="recallTable">
                    <thead>
                        <tr>
                            <th>제조사</th>
                            <th>차종</th>
                            <th>리콜 날짜</th>
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
    function filterTable() {
        var input, filter, table, tr, td, i, j;
        input = document.getElementById("searchInput");
        filter = input.value.toUpperCase();
        table = document.getElementById("recallTable");
        tr = table.getElementsByTagName("tr");

        for (i = 1; i < tr.length; i++) { // i=1 to skip header row
            tr[i].style.display = "none";
            td = tr[i].getElementsByTagName("td");
            for (j = 0; j < 2; j++) { // j=0 for MAKER, j=1 for MODEL_NAME
                if (td[j]) {
                    if (td[j].innerHTML.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                        break;
                    }
                }
            }
        }
    }
    </script>
</body>
</html>
