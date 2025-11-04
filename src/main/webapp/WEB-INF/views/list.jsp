<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>자동차 리콜 현황</title>
	<style>
		.div_page ul {
			display: flex;
			list-style: none;
			padding: 0;
		}
		.paginate_button {
			margin: 0 5px;
		}
	</style>
</head>
<body>
<h2> 자동차 리콜 현황</h2>
<table width="800" border="1" cellspacing="0" cellpadding="5">
	<tr style="background-color:#f2f2f2;">
		<th>번호</th>
		<th>제조사</th>
		<th>모델명</th>
		<th>제작 시작</th>
		<th>제작 종료</th>
		<th>리콜 날짜</th>
	</tr>

	<!-- list는 PageController에서 전달된 ArrayList<RecallDTO> -->
	<c:forEach var="dto" items="${list}">
		<tr>
			<td>${dto.id}</td>
			<td>${dto.maker}</td>
			<td>${dto.model_Name}</td>
			<td>${dto.make_Start}</td>
			<td>${dto.make_End}</td>
			<td>${dto.recall_Date}</td>
		</tr>
	</c:forEach>

	<c:if test="${empty list}">
		<tr><td colspan="6" align="center">검색 결과가 없습니다.</td></tr>
	</c:if>
</table>

<br>

<!-- 검색 폼 -->
<form method="get" id="searchForm">
	<select name="type">
		<option value=""  <c:out value="${pageMaker.cri.type == null?'selected':''}"/>>-- 선택 --</option>
		<option value="M"  <c:out value="${pageMaker.cri.type eq 'M'?'selected':''}"/>>제조사</option>
		<option value="N"  <c:out value="${pageMaker.cri.type eq 'N'?'selected':''}"/>>모델명</option>
		<option value="D"  <c:out value="${pageMaker.cri.type eq 'D'?'selected':''}"/>>리콜 날짜</option>
		<option value="MN"  <c:out value="${pageMaker.cri.type eq 'MN'?'selected':''}"/>>제조사 + 모델명</option>
		<option value="MD"  <c:out value="${pageMaker.cri.type eq 'MD'?'selected':''}"/>>제조사 + 날짜</option>
		<option value="MND"  <c:out value="${pageMaker.cri.type eq 'MND'?'selected':''}"/>>제조사 + 모델명 + 날짜</option>
	</select>
	<input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"/>'>
	<button>검색</button>
</form>

<!-- 페이지 네비게이션 -->
<div class="div_page">
	<ul>
		<c:if test="${pageMaker.prev}">
			<li class="paginate_button">
				<a href="${pageMaker.startPage - 1}">[이전]</a>
			</li>
		</c:if>

		<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
			<li class="paginate_button" ${pageMaker.cri.pageNum == num ? "style='background-color:yellow'" : ""}>
				<a href="${num}">[${num}]</a>
			</li>
		</c:forEach>

		<c:if test="${pageMaker.next}">
			<li class="paginate_button">
				<a href="${pageMaker.endPage + 1}">[다음]</a>
			</li>
		</c:if>
	</ul>
</div>

<!-- 페이징용 form -->
<form method="get" id="actionForm">
	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
	<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
	<input type="hidden" name="type" value="${pageMaker.cri.type}">
	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
</form>

<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script>
	var actionForm = $("#actionForm");

	// 페이지 번호 클릭 시
	$(".paginate_button a").on("click", function (e) {
		e.preventDefault();
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.attr("action", "list").submit();
	});

	// 검색 버튼 클릭 시
	var searchForm = $("#searchForm");
	$("#searchForm button").on("click", function () {
		if (searchForm.find("option:selected").val() != "" &&
				!searchForm.find("input[name='keyword']").val()) {
			alert("키워드를 입력하세요.");
			return false;
		}
		searchForm.attr("action", "list").submit();
	});

	// 전체 선택 시 키워드 초기화
	$("#searchForm select").on("change", function () {
		if ($(this).val() == "") {
			searchForm.find("input[name='keyword']").val("");
		}
	});
</script>
</body>
</html>













