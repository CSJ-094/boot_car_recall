<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>게시글 보기</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<style>
		.bigPicture {
			position: fixed;
			display: none;
			justify-content: center;
			align-items: center;
			top: 0; left: 0; right: 0; bottom: 0;
			background-color: rgba(0,0,0,0.8);
			z-index: 100;
		}
		.bigPic img {
			max-width: 80%;
			max-height: 80%;
			border-radius: 10px;
		}
	</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>

<div class="container">
	<h2>${content_view.boardTitle}</h2>
	<div class="uploadResult">
		<ul></ul>
	</div>

	<div class="bigPicture">
		<div class="bigPic"></div>
	</div>

	<p>${content_view.boardContent}</p>
	<p>작성자: ${content_view.boardName} | 날짜: ${content_view.boardDate} | 조회수: ${content_view.boardHit}</p>


	<div class="actions">
		<a href="report_recallInfo?pageNum=${pageNum}&amount=${amount}">목록으로</a>
		<a href="report_modify_view?boardNo=${content_view.boardNo}">수정</a>
		<a href="delete?boardNo=${content_view.boardNo}">삭제</a>
	</div>
</div>

<script>
	$(document).ready(function() {
		const boardNo = "${content_view.boardNo}";

		$.getJSON("/getFileList", { boardNo: boardNo }, function(arr) {
			let str = "";

			$(arr).each(function(i, obj) {
				const path = obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName;

				str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'>";
				str += "<span>" + obj.fileName + "</span>";

				if (obj.image) {
					str += "<img src='/display?fileName=" + path + "' width='100'>";
				} else {
					str += "<img src='${pageContext.request.contextPath}/img/attach.png' width='30'>";
				}

				str += "</li>";
			});

			$(".uploadResult ul").html(str);
		});

		$(".uploadResult").on("click", "li", function() {
			const liObj = $(this);
			const path = liObj.data("path") + "/" + liObj.data("uuid") + "_" + liObj.data("filename");

			if (liObj.data("type")) {
				showImage(path);
			} else {
				self.location = "/download?fileName=" + path;
			}
		});

		function showImage(fileCallPath) {
			$(".bigPicture").css("display", "flex").show();
			$(".bigPic").html("<img src='/display?fileName=" + fileCallPath + "'>")
					.animate({width: "100%", height: "100%"}, 400);
		}

		$(".bigPicture").on("click", function() {
			$(".bigPic").animate({width: "0%", height: "0%"}, 400);
			setTimeout(function() {
				$(".bigPicture").hide();
			}, 400);
		});
	});
</script>
</body>
</html>












