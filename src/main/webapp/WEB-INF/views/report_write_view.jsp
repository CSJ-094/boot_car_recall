<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>글쓰기</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp" />

<h2>글쓰기</h2>
<form method="post" action="${pageContext.request.contextPath}/write">
    <table>
        <tr>
            <td>이름</td>
            <td><input type="text" name="boardName" required></td>
        </tr>
        <tr>
            <td>제목</td>
            <td><input type="text" name="boardTitle" required></td>
        </tr>
        <tr>
            <td>내용</td>
            <td><textarea name="boardContent" rows="10" cols="60" required></textarea></td>
        </tr>
        <tr>
            <td colspan="2">
                <button type="submit">저장</button>
                <a href="${pageContext.request.contextPath}/recallInfo">목록</a>
            </td>
        </tr>
    </table>
</form>

<!-- 업로드 공간 자리(추후 구현) -->
<div class="uploadDiv">
    <label>파일 첨부 (추후 구현)</label>
    <input type="file" name="uploadFile" multiple disabled>
</div>
</body>