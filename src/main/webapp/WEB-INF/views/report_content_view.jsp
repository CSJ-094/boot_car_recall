<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>리콜 보도자료 상세</title>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" />
	<script src="${pageContext.request.contextPath}/js/jquery.js"></script>

	<style>
		.container {
			width: 80%;
			margin: 40px auto;
		}

		.post-card {
			background: #fff;
			border-radius: 10px;
			box-shadow: 0 2px 6px rgba(0,0,0,0.1);
			padding: 20px;
			margin-bottom: 20px;
		}

		.post-title {
			font-size: 24px;
			font-weight: 600;
			margin-bottom: 15px;
		}

		.post-content {
			margin-bottom: 15px;
			font-size: 16px;
			line-height: 1.5;
		}

		.post-info {
			font-size: 14px;
			color: #888;
		}
	</style>
</head>

<body>
<jsp:include page="/WEB-INF/views/header.jsp" />

<div class="container">
	<div class="post-card">
		<form method="post" action="report_modify">
			<input type="hidden" name="boardNo" value="${content_view.boardNo}">
			<input type="hidden" name="pageNum" value="${pageNum}">
			<input type="hidden" name="amount" value="${amount}">

			<div class="post-title">
				<input type="text" name="boardTitle" value="${content_view.boardTitle}" class="input-title">
			</div>
			<div class="post-content">
				<textarea name="boardContent" class="input-content">${content_view.boardContent}</textarea>
			</div>
			<div class="post-info">
				작성자: <input type="text" name="boardName" value="${content_view.boardName}" class="input-name">
				| 날짜: ${content_view.boardDate} | 조회수: ${content_view.boardHit}
			</div>

			<div class="btn-group">
				<input type="submit" value="수정" class="btn btn-primary">
				<input type="submit" value="삭제" formaction="report_delete" class="btn btn-danger">
				<a href="report_recallInfo?pageNum=${pageNum}&amount=${amount}" class="btn btn-secondary">목록</a>
			</div>
		</form>
	</div>
</div>
</body>
</html>













