<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .login-container {
            max-width: 400px;
            margin: 100px auto;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
        }
        .login-container h2 {
            margin-bottom: 30px;
            text-align: center;
            color: #343a40;
        }
        .form-group label {
            font-weight: bold;
        }
        .btn-primary {
            width: 100%;
            padding: 10px;
            font-size: 1.1em;
        }
        .alert {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="login-container">
            <h2>Admin Login</h2>
            <c:if test="${not empty error}">
                <div class="alert alert-danger">${error}</div>
            </c:if>
            <form action="${pageContext.request.contextPath}/admin/login" method="post">
                <div class="form-group">
                    <label for="admin_id">Admin ID:</label>
                    <input type="text" class="form-control" id="admin_id" name="admin_id" required>
                </div>
                <div class="form-group">
                    <label for="admin_pw">Password:</label>
                    <input type="password" class="form-control" id="admin_pw" name="admin_pw" required>
                </div>
                <button type="submit" class="btn btn-primary">Login</button>
            </form>
        </div>
    </div>