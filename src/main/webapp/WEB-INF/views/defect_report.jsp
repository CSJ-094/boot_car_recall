<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>차량 결함 신고</title>
    <style>
        body { font-family: 'Noto Sans KR', sans-serif; margin: 0; background-color: #f4f4f4; color: #333; }
        .container { width: 60%; margin: auto; padding: 20px; background-color: #fff; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); margin-top: 30px; }
        header { background: #0d47a1; color: white; padding: 20px 0; text-align: center; }
        header h1 { margin: 0; font-size: 2rem; }
        nav { background: #1565c0; padding: 10px; text-align: center; }
        nav a { color: white; margin: 0 15px; text-decoration: none; font-weight: 500; }
        h2 { text-align: center; color: #0d47a1; margin-bottom: 20px; }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; margin-bottom: 5px; font-weight: bold; }
        .form-group input, .form-group textarea { width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px; box-sizing: border-box; }
        .form-group input[type="password"] { width: auto; display: inline-block; } /* 비밀번호 필드 너비 조정 */
        .form-group input[type="file"] { border: none; padding: 5px 0; }
        .form-group textarea { resize: vertical; height: 150px; }
        .submit-btn { display: block; width: 100%; padding: 12px; background-color: #0d47a1; color: white; border: none; border-radius: 4px; cursor: pointer; font-size: 1.1em; font-weight: 600; }
        .submit-btn:hover { background-color: #1565c0; }
        footer { background: #263238; color: #ccc; text-align: center; padding: 20px; margin-top: 30px; }
        .image-preview-container { display: flex; flex-wrap: wrap; gap: 10px; margin-top: 10px; }
        .image-preview { width: 100px; height: 100px; border: 1px solid #ddd; display: flex; justify-content: center; align-items: center; overflow: hidden; position: relative; }
        .image-preview img { max-width: 100%; max-height: 100%; object-fit: cover; }
    </style>
</head>
<body>
    <header>
        <h1>📋 차량 결함 신고</h1>
    </header>
    <nav>
        <a href="/">홈</a>
        <a href="/recall-status">리콜 현황</a>
        <a href="/defect-report">결함 신고</a>
        <a href="/defect-report-list">신고 목록</a>
        <a href="#">고객 지원</a>
    </nav>

    <div class="container">
        <h2>결함 신고 접수</h2>
        <form action="/defect-report" method="post" enctype="multipart/form-data"> <!-- enctype 추가 -->
            <div class="form-group">
                <label for="reporterName">신고인 성명</label>
                <input type="text" id="reporterName" name="reporterName" required>
            </div>
            <div class="form-group">
                <label for="contact">연락처</label>
                <input type="text" id="contact" name="contact" placeholder="예: 010-1234-5678" required>
            </div>
            <div class="form-group">
                <label for="carModel">차량 모델</label>
                <input type="text" id="carModel" name="carModel" placeholder="예: 현대 쏘나타 2023년식" required>
            </div>
            <div class="form-group">
                <label for="vin">차대번호 (VIN)</label>
                <input type="text" id="vin" name="vin" placeholder="17자리 차대번호를 입력하세요">
            </div>
            <div class="form-group">
                <label for="password">비밀번호 (4자리 숫자)</label>
                <input type="password" id="password" name="password" maxlength="4" pattern="[0-9]{4}" title="4자리 숫자를 입력하세요" required>
            </div>
            <div class="form-group">
                <label for="defectImages">결함 이미지 (여러 개 선택 가능)</label>
                <input type="file" id="defectImages" name="defectImages" accept="image/*" multiple onchange="previewImages(event)">
                <div class="image-preview-container" id="imagePreviewContainer"></div>
            </div>
            <div class="form-group">
                <label for="defectDetails">결함 내용</label>
                <textarea id="defectDetails" name="defectDetails" placeholder="발견하신 결함에 대해 구체적으로 작성해주세요." required></textarea>
            </div>
            <button type="submit" class="submit-btn">신고 접수하기</button>
        </form>
    </div>

    <footer>
        <p>© 2025 차량 리콜 조회 시스템</p>
    </footer>

    <script>
        function previewImages(event) {
            const previewContainer = document.getElementById('imagePreviewContainer');
            previewContainer.innerHTML = ''; // 기존 미리보기 초기화

            if (event.target.files) {
                Array.from(event.target.files).forEach(file => {
                    const reader = new FileReader();
                    reader.onload = (e) => {
                        const imgDiv = document.createElement('div');
                        imgDiv.className = 'image-preview';
                        const img = document.createElement('img');
                        img.src = e.target.result;
                        imgDiv.appendChild(img);
                        previewContainer.appendChild(imgDiv);
                    };
                    reader.readAsDataURL(file);
                });
            }
        }
    </script>
</body>
</html>
