<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <table width="500" border="1">
		<form action="complain_content_modify" method="post">
			<input type="hidden" name="report_id" value="${content_view.report_id}">
			<input type="hidden" name="reporter_name" value="${content_view.reporter_name}">
			<input type="hidden" name="title" value="${content_view.title}">
			<input type="hidden" name="content" value="${content_view.content}">
			<tr>
				<td>이름</td>
				<td>
					${content_view.reporter_name}
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>
 					${content_view.title}
				</td>
			</tr>
			<tr>
				<td>상담구분</td>
				<td>
					${content_view.complain_type}
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
 					${content_view.content}
				</td>
			</tr>
			<tr>
				<td colspan="2">
					&nbsp;&nbsp;<input type="submit" value="목록보기" formaction="complain_list">
					&nbsp;&nbsp;<input type="submit" value="삭제" formaction="complain_delete">
					&nbsp;&nbsp;<input type="submit" value="수정하기">
				</td>
			</tr>
		</form>
	</table>
</body>
</html>