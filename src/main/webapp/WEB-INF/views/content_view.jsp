<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		.uploadResult {
			width: 100%;
			background-color: gray;
		}

		.uploadResult ul {
			display: flex;
			flex-flow: row;
		}

		.uploadResult ul li {
			list-style: none;
			padding: 10px;
		}

		.uploadResult ul li img {
			width: 100px;
		}
	</style>
	<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
</head>
<body>
	<table width="500" border="1">
		<form method="post" action="modify">
<%--			<input type="hidden" name="boardNo" value="${content_view.boardNo}">--%>
			<input type="hidden" name="id" value="${pageMaker.id}">
			<input type="hidden" name="pageNum" value="${pageMaker.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.amount}">

			<tr>
				<td>번호</td>
				<td>
					${content_view.id}
				</td>
			</tr>
			<tr>
				<td>제조사</td>
				<td>
<%-- 					${content_view.boardName} --%>
					<input type="text" name="maker" value="${content_view.maker}">
				</td>
			</tr>
			<tr>
				<td>모델명</td>
				<td>
<%-- 					${content_view.boardTitle} --%>
					<input type="text" name="model_name" value="${content_view.model_name}">
				</td>
			</tr>
			<tr>
				<td>리콜날짜</td>
				<td>
<%-- 					${content_view.boardContent} --%>
					<input type="text" name="recall_date" value="${content_view.recall_date}">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정">
<%--					&nbsp;&nbsp;<a href="list">목록보기</a>--%>
					&nbsp;&nbsp;<input type="submit" value="목록보기" formaction="list">
<%--					&nbsp;&nbsp;<a href="delete?boardNo=${content_view.boardNo}">삭제</a>--%>
					&nbsp;&nbsp;<input type="submit" value="삭제" formaction="delete">
				</td>
			</tr>
		</form>
	</table>

	<!-- 첨부파일 출력 -->
	<!-- 댓글 출력 -->


</body>
</html>













