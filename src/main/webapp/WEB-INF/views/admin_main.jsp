<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            max-width: 800px;
            margin: 50px auto;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="admin-container">
        <h2>관리자 페이지</h2>
        <hr>
        <p class="lead">${sessionScope.admin.admin_id}님, 환영합니다!</p>
    </div>
    <a href="/admin/logout">로그아웃</a>
</div>
</body>
</html>