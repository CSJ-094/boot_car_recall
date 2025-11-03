<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		#btn_logout{
			text-align: right;
		}
		.div_page ul{
			display: flex;
			list-style: none;
		}
	</style>
</head>
<body>
	<table width="500" border="1">
		<tr>
			<td colspan="5">
				<div id="btn_logout">
					<a href="logout">로그아웃</a>
				</div>
			</td>
		</tr>
		<tr>
			<td>번호</td>
			<td>제조사</td>
			<td>모델명</td>
			<td>리콜날짜</td>
		</tr>
<!-- 		조회결과 -->
<!-- 		list : 모델객체에서 보낸 이름 -->
		<c:forEach var="dto" items="${list}">
			<tr>
				<td>${dto.id}</td>
				<td>${dto.boardName}</td>
				<td>

					<!-- <a href="content_view?boardNo=${dto.boardNo}">${dto.boardTitle}</a> -->
					<a class="move_link" href="${dto.boardNo}">${dto.boardTitle}</a>
				</td>
<!--				<td>${dto.boardDate}</td>-->
				<td>${dto.boardDate2}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5">
			<!-- 			write_view : 컨트롤러단 호출 -->
				<a href="write_view">글작성</a>
			</td>
		</tr>
	</table>

	<form method="get" id="searchForm">
		<select name="type">
			<option value=""  <c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
			<option value="T"  <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
			<option value="C"  <c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
			<option value="W"  <c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
			<option value="TC"  <c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목 or 내용</option>
			<option value="TW"  <c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목 or 작성자</option>
			<option value="TCW"  <c:out value="${pageMaker.cri.type eq 'TCW'?'selected':''}"/>>제목 or 내용 or 작성자</option>
		</select>
<!-- 	Criteria 를 이용해서 키워드 값을 넘김 -->
		<input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"/>'>
		<button>Search</button>
	</form>

	<h3>${pageMaker}</h3>
	<div class="div_page">
		<ul>
			<c:if test="${pageMaker.prev}">
				<!-- <li>[Previous]</li> -->
				<!-- <li class="paginate_button">[Previous]</li> -->
				<li class="paginate_button">
					<a href="${pageMaker.startPage - 1}">
						[Previous]
					</a>
				</li>
			</c:if>
			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				<!-- <li>[${num}]</li> -->
				<!-- <li ${pageMaker.cri.pageNum == num ? "style='color: red'" : ""}> -->
				<!-- <li class="paginate_button" ${pageMaker.cri.pageNum == num ? "style='color: red'" : ""}> -->
				<li class="paginate_button" ${pageMaker.cri.pageNum == num ? "style='background-color: yellow'" : ""}>
					<a href="${num}">
						[${num}]
					</a>
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next}">
				<!-- <li>[Next]</li> -->
				<!-- <li class="paginate_button">[Next]</li> -->
				<li class="paginate_button">
					<a href="${pageMaker.endPage + 1}">
						[Next]
					</a>
				</li>
			</c:if>
		</ul>
	</div>

	<!-- <form method="get" id="actionForm" action="list"> -->
	<form method="get" id="actionForm">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		<!-- 페이징 검색시 페이지번호를 클릭할때 필요한 파라미터 -->
		<input type="hidden" name="type" value="${pageMaker.cri.type}">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
	</form>
	</form>

</body>
</html>
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script>
	var actionForm = $("#actionForm");

	// 페이지번호 처리
	$(".paginate_button a").on("click", function (e) {
		e.preventDefault();
		console.log("click~!!!");
		console.log("@# href=>"+$(this).attr("href"));

		// actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.find("input[name='pageNum']").val($(this).attr('href'));
		// actionForm.submit();
		// 버그 처리(게시글 클릭후 뒤로가기 누른후 다른 페이지 클릭할때 content_view 가 작동되는 것을 해결)
		actionForm.attr("action","list").submit();
	});//end of paginate_button click

	// 게시글 처리
	$(".move_link").on("click", function (e) {
		e.preventDefault();
		console.log("move_link click~!!!");
		console.log("@# href=>"+$(this).attr("href"));

		var targetBno = $(this).attr("href");

		// 버그 처리(게시글 클릭후 뒤로가기 누른후 다른 게시글 클릭할때 &boardNo=번호 계속 누적되는거 방지)
		var bno = actionForm.find("input[name='boardNo']").val();
		if (bno != "") {
			actionForm.find("input[name='boardNo']").remove();
			// bno = actionForm.find("input[name='boardNo']").remove();
		}

		// "content_view?boardNo=${dto.boardNo}" 를 actionForm 로 처리
		actionForm.append("<input type='hidden' name='boardNo' value='"+targetBno+"'>");
		// actionForm.append("<input type='hidden' name='boardNo' value='"+bno+"'>");
		// 컨트롤러에 content_view 로 찾아감
		actionForm.attr("action","content_view").submit();
	});//end of paginate_button click

	var searchForm = $("#searchForm");

	// 	Search 버튼 클릭
	$("#searchForm button").on("click", function () {

		// 키워드 입력 받을 조건
		if (searchForm.find("option:selected").val() != "" && !searchForm.find("input[name='keyword']").val()) {
			alert("키워드를 입력하세요.");
			return false;
		}

		searchForm.attr("action","list").submit();
	});

	// 	type 콤보박스 변경
	$("#searchForm select").on("change", function () {
		// 전체일때
		if (searchForm.find("option:selected").val() == "") {
			// 키워드를 널값으로 변경
			searchForm.find("input[name='keyword']").val("")
		}
	});

</script>














