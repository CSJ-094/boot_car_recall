<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>글쓰기</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>

<div class="container">
    <h2>게시글 작성</h2>
    <form id="frm">
        <div>
            <label>작성자</label>
            <input type="text" name="boardName" required>
        </div>
        <div>
            <label>제목</label>
            <input type="text" name="boardTitle" required>
        </div>
        <div>
            <label>내용</label><br>
            <textarea name="boardContent" rows="6" cols="60" required></textarea>
        </div>

        <div class="uploadDiv">
            <label>파일 첨부</label>
            <input type="file" name="uploadFile" multiple>
        </div>

        <div class="uploadResult">
            <ul></ul>
        </div>

        <button type="submit">등록</button>
        <button type="button" onclick="location.href='report_recallInfo'">목록으로</button>
    </form>
</div>

<script>
    $(document).ready(function() {
        // 업로드 확장자 및 용량 제한
        const regex = new RegExp("(.*?)\.(exe|sh|js|alz)$");
        const maxSize = 5242880; // 5MB

        function checkExtension(fileName, fileSize) {
            if (fileSize > maxSize) {
                alert("파일 사이즈 초과 (5MB 이하만 가능)");
                return false;
            }
            if (regex.test(fileName)) {
                alert("해당 종류의 파일은 업로드할 수 없습니다.");
                return false;
            }
            return true;
        }

        // 파일 선택 시 즉시 미리보기
        $("input[type='file']").change(function(e) {
            const uploadUL = $(".uploadResult ul");
            uploadUL.empty();

            const formData = new FormData();
            const files = this.files;

            for (let i = 0; i < files.length; i++) {
                if (!checkExtension(files[i].name, files[i].size)) return false;
                formData.append("uploadFile", files[i]);
            }

            $.ajax({
                type: "post",
                url: "uploadAjaxAction",
                data: formData,
                processData: false,
                contentType: false,
                success: function(result) {
                    showUploadResult(result);
                }
            });
        });

        function showUploadResult(uploadResultArr) {
            if (!uploadResultArr || uploadResultArr.length === 0) return;
            const uploadUL = $(".uploadResult ul");
            let str = "";

            $(uploadResultArr).each(function(i, obj) {
                const fileName = obj.fileName;
                if (obj.image) {
                    str += "<li>" +
                        "<img src='/display?fileName=" + obj.uuid + "_" + fileName + "' width='80'>" +
                        "<span>" + fileName + "</span></li>";
                } else {
                    str += "<li>" +
                        "<img src='${pageContext.request.contextPath}/img/attach.png' width='20'>" +
                        "<span>" + fileName + "</span></li>";
                }
            });
            uploadUL.append(str);
        }

        // 폼 제출 (DB에 게시글 저장 후 업로드)
        $("button[type='submit']").on("click", function(e) {
            e.preventDefault();

            const formData = $("#frm").serialize();

            $.ajax({
                type: "post",
                url: "write",
                data: formData,
                success: function(result) {
                    uploadFolder(); // 파일 저장
                },
                error: function() {
                    alert("게시글 저장 실패");
                }
            });
        });

        function uploadFolder() {
            const formData = new FormData();
            const inputFile = $("input[name='uploadFile']");
            const files = inputFile[0].files;

            for (let i = 0; i < files.length; i++) {
                formData.append("uploadFile", files[i]);
            }

            $.ajax({
                type: "post",
                url: "uploadFolder",
                data: formData,
                processData: false,
                contentType: false,
                success: function(result) {
                    alert("게시글 및 파일 업로드 완료!");
                    location.href = "report_recallInfo";
                },
                error: function() {
                    alert("파일 업로드 실패");
                }
            });
        }
    });
</script>
</body>
</html>