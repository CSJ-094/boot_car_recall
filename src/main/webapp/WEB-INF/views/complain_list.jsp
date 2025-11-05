<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
</body>
</html><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="500" border="1">
		<tr>
			<td>신청인</td>
			<td>제목</td>
			<td>상담구분</td>
			<td>문의날짜</td>
		</tr>
<!-- 		조회결과 -->
<!-- 		list : 모델객체에서 보낸 이름 -->
		<c:forEach var="dto" items="${complain_list}">
			<tr>
				<td>${dto.reporter_name}</td>
				<td>
					<!--<a class="move_link" href="${dto.report_id}">${dto.title}</a>-->
					<a href="complain_content_view?report_id=${dto.report_id}">${dto.title}</a>
				</td>
                <td>${dto.complain_type}</td>
				<td>${dto.complainDate}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5">
			<!-- 			write_view : 컨트롤러단 호출 -->
				<a href="complain_write_view">글작성</a>
			</td>
		</tr>
	</table>
</body>
</html>















