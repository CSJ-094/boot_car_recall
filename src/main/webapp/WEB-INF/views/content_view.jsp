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
		<div class="post-title">${content_view.boardTitle}</div>
		<div class="post-content">${content_view.boardContent}</div>
		<div class="post-info">
			작성자: ${content_view.boardName} | 날짜: ${content_view.boardDate} | 조회수: ${content_view.boardHit}
		</div>
	</div>

	<div>
		<a href="recallInfo?pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}">목록으로 돌아가기</a>
	</div>
</div>
</body>
</html>













