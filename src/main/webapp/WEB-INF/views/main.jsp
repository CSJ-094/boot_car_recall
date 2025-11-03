<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>차량 리콜 조회 시스템</title>
  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
      font-family: "Noto Sans KR", sans-serif;
    }

    body {
      background-color: #f7f8fa;
      color: #333;
    }

    header {
      background-color: #0d47a1;
      color: white;
      padding: 15px 60px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    header h1 {
      font-size: 1.5rem;
    }

    nav a {
      color: white;
      margin-left: 20px;
      text-decoration: none;
      font-weight: 500;
    }

    nav a:hover {
      text-decoration: underline;
    }

    .hero {
      background: linear-gradient(to right, #1565c0, #1e88e5);
      color: white;
      text-align: center;
      padding: 80px 20px;
    }

    .hero h2 {
      font-size: 2rem;
      margin-bottom: 20px;
    }

    .search-box {
      background-color: white;
      color: #333;
      display: inline-flex;
      border-radius: 10px;
      overflow: hidden;
      max-width: 600px;
      width: 100%;
    }

    .search-box input {
      flex: 1;
      padding: 15px;
      border: none;
      font-size: 1rem;
      outline: none;
    }

    .search-box button {
      background-color: #0d47a1;
      color: white;
      border: none;
      padding: 15px 30px;
      cursor: pointer;
      font-weight: 600;
      transition: background 0.3s;
    }

    .search-box button:hover {
      background-color: #1565c0;
    }

    section {
      padding: 60px 20px;
      text-align: center;
    }

    .features {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      gap: 30px;
      max-width: 1000px;
      margin: 0 auto;
    }

    .feature {
      background-color: white;
      border-radius: 10px;
      padding: 30px;
      width: 280px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      transition: transform 0.3s;
    }

    .feature:hover {
      transform: translateY(-5px);
    }

    footer {
      background-color: #263238;
      color: #ccc;
      text-align: center;
      padding: 30px;
      font-size: 0.9rem;
    }
  </style>
</head>
<body>
  <header>
    <h1>🚗 차량 리콜 조회</h1>
    <nav>
      <a href="#">홈</a>
      <a href="#">리콜 안내</a>
      <a href="#">고객 지원</a>
      <a href="#">문의하기</a>
    </nav>
  </header>

  <div class="hero">
    <h2>내 차량이 리콜 대상인지 확인하세요</h2>
    <p>차량번호나 VIN(차대번호)를 입력하세요</p>
    <br />
    <div class="search-box">
      <input type="text" id="vinInput" placeholder="예: 12가3456 또는 KMHAB81...">
      <button onclick="searchRecall()">조회하기</button>
    </div>
    <p id="result" style="margin-top: 20px; font-size: 1.1rem;"></p>
  </div>

  <section>
    <h3>리콜 절차 및 서비스 안내</h3>
    <div class="features">
      <div class="feature">
        <h4>1️⃣ 리콜 조회</h4>
        <p>차량 번호나 VIN을 입력하면 리콜 여부를 즉시 확인할 수 있습니다.</p>
      </div>
      <div class="feature">
        <h4>2️⃣ 서비스 예약</h4>
        <p>리콜 대상일 경우 근처 서비스센터에서 무료 수리 예약이 가능합니다.</p>
      </div>
      <div class="feature">
        <h4>3️⃣ 안전 보장</h4>
        <p>정부 인증 리콜 시스템으로 차량 안전과 신뢰를 보장합니다.</p>
      </div>
    </div>
  </section>

  <footer>
    <p>© 2025 차량 리콜 조회 시스템 | 고객센터: 1234-5678 | 이메일: support@recall.co.kr</p>
  </footer>

  <script>
    function searchRecall() {
      const vin = document.getElementById('vinInput').value.trim();
      const result = document.getElementById('result');
      
      if (!vin) {
        result.textContent = "⚠️ 차량번호나 VIN을 입력해주세요.";
        return;
      }

      // 예시 로직 (실제 서비스에서는 API 연동 필요)
      if (vin.includes("123") || vin.startsWith("KMH")) {
        result.textContent = "🔴 리콜 대상 차량입니다. 가까운 서비스센터를 방문하세요.";
      } else {
        result.textContent = "✅ 해당 차량은 리콜 대상이 아닙니다.";
      }
    }
  </script>
</body>
</html>
