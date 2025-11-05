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
	<h2>게시글 수정</h2>
	<form method="post" action="report_modify">
		<input type="hidden" name="boardNo" value="${content_view.boardNo}">
		<input type="hidden" name="pageNum" value="${pageNum}">
		<input type="hidden" name="amount" value="${amount}">

		<div class="form-group">
			<label>작성자</label>
			<input type="text" name="boardName" value="${content_view.boardName}" class="form-control">
		</div>

		<div class="form-group">
			<label>제목</label>
			<input type="text" name="boardTitle" value="${content_view.boardTitle}" class="form-control">
		</div>

		<div class="form-group">
			<label>내용</label>
			<textarea name="boardContent" class="form-control" rows="6">${content_view.boardContent}</textarea>
		</div>

		<div style="margin-top:10px;">
			<input type="submit" value="수정완료" class="btn btn-primary">
			<a href="report_content_view?boardNo=${content_view.boardNo}&pageNum=${pageNum}&amount=${amount}" class="btn btn-secondary">취소</a>
		</div>
	</form>
</div>
</body>
</html>













