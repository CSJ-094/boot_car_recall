<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h2>온라인 상담</h2>
    <table>
        <form action="complain_write" method="post">
            <tr>
                <td>신청인</td>
                <td><input type="text" name="reporter_name"></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="password"></td>
            </tr>
            <tr>
                <td>전화번호</td>
                <td><input type="text" name="phone"></td>
            </tr>
            <tr>
                <td>제목</td>
                <td><input type="text" name="title"></td>
            </tr>
            <tr>
                <td>상담 구분</td>
                <td><input type="radio" name="complain_type" value="제작결함">제작결함</td>
                <td><input type="radio" name="complain_type" value="기타">기타</td>
            </tr>
            <tr>
                <td>자동차 등록 번호</td>
                <td><input type="text" name="carNum">기타</td>
            </tr>
            <tr>
                <td>공개여부</td>
                <td><input type="radio" name="is_public" value="Y">공개여부</td>
                <td><input type="radio" name="is_public" value="N">비공개</td>
            </tr>
            <tr>
                <td>내용</td>
                <td><textarea name="content" cols="30" rows="10"></textarea></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="작성완료"></td>
            </tr>
        </form>
    </table>
</body>
</html>