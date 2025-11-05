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
		<form action="complain_modify" method="post">
			<input type="hidden" name="report_id" value="${modify.report_id}">
			<tr>
				<td>번호</td>
				<td>
					${modify.report_id}
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>
				<input type="text" name="reporter_name" value="${modify.reporter_name}">
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" name="title" value="${modify.title}">
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<input type="text" name="content" value="${modify.content}">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					&nbsp;&nbsp;<a href="complain_list">목록보기</a>
					&nbsp;&nbsp;<input type="submit" value="수정하기">
				</td>
			</tr>
		</form>
	</table>
</body>
</html>