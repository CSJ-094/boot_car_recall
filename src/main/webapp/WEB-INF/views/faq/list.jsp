<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>FAQ 자주 묻는 질문</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" />
    <style>
        .container { width: 80%; max-width: 1000px; margin: 50px auto; padding: 20px; background-color: white; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); }
        h2 { text-align: center; color: #0d47a1; margin-bottom: 30px; }
        .faq-header { display: flex; justify-content: flex-end; align-items: center; margin-bottom: 20px; }
        
        /* FAQ 아이템 스타일 */
        .faq-item { border: 1px solid #e0e0e0; margin-bottom: 10px; border-radius: 5px; overflow: hidden; }
        
        /* 질문 (헤더) 스타일 */
        .faq-question { padding: 15px; display: flex; justify-content: space-between; align-items: center; font-weight: bold; background-color: #f7f7f7; cursor: pointer; color: #333; }
        .faq-question:hover { background-color: #eee; }
        
        /* 답변 (내용) 스타일: 아코디언 애니메이션을 위해 max-height 사용 */
        .faq-answer { 
            padding: 0 30px; /* 초기 패딩은 0으로 설정하여 닫힐 때 높이 계산을 쉽게 함 */
            background-color: #ffffff; 
            border-top: 1px solid #eee; 
            max-height: 0; /* 초기에는 닫힌 상태 */
            overflow: hidden; /* 내용이 넘치지 않도록 */
            transition: max-height 0.3s ease-in-out, padding 0.3s ease-in-out; /* max-height와 padding에 트랜지션 적용 */
        }
        /* 답변 내용 내부 스타일 (실제 텍스트) */
        .faq-content-wrapper {
            padding: 20px 0; /* 실제 내용 패딩 */
        }

        /* 답변이 열렸을 때 스타일 */
        .faq-item.active .faq-answer {
            max-height: 500px; /* 충분히 큰 값으로 설정하여 내용을 모두 표시 (스크롤바 없이) */
            padding: 0; /* max-height로 조절하므로 padding-top/bottom은 내용 wrapper에 적용 */
        }

        .faq-answer p { white-space: pre-wrap; margin: 0; line-height: 1.6; color: #555; }
        
        /* 화살표 스타일 */
        .arrow { font-size: 1.2em; transition: transform 0.3s; margin-left: 10px; color: #0d47a1; }
        .faq-item.active .arrow { transform: rotate(180deg); } /* faq-item.active에 따라 회전 */
        
        /* 관리자 액션 버튼 스타일 */
        .admin-actions { display: flex; align-items: center; }
        .admin-link { font-size: 0.9em; margin-left: 15px; color: #1565c0; text-decoration: none; padding: 5px 8px; border: 1px solid #1565c0; border-radius: 4px; }
        .admin-link.delete-link { color: #d32f2f; border-color: #d32f2f; }
        .admin-link:hover { background-color: #1565c0; color: white; }
        .admin-link.delete-link:hover { background-color: #d32f2f; color: white; }
    </style>
</head>
<body>
	<header>
			    <h1>차량 리콜 조회</h1>
			    <nav>
			      <a href="${pageContext.request.contextPath}/">홈</a>
			      <a href="#">리콜 안내</a>
				  <a href="/notice/list">고객 지원</a>
				  <a href="/faq/list">문의하기</a>
			    </nav>
			  </header> 

    <div class="container">
        <h2>자주 묻는 질문 (FAQ)</h2>

        <div class="faq-header">
            <!-- FAQ 작성(Create) 페이지로 이동 버튼: write_view로 변경 -->
            <a href="write_view" class="btn btn-primary" style="background-color:#1565c0; color:white; padding:8px 15px; text-decoration:none; border-radius:5px;">FAQ 작성</a>
        </div>
        
        <c:choose>
            <c:when test="${not empty faqList}">
                <c:forEach var="faq" items="${faqList}">
                    <!-- faq-item이 active 클래스를 가짐으로써 답변이 열림/닫힘 상태를 제어 -->
                    <div class="faq-item">
                        <!-- 아코디언 토글을 위한 질문 영역 -->
                        <div class="faq-question">
                            <span>[${faq.faqCategory}] ${faq.faqTitle}</span>
                            <div class="admin-actions">
                                <!-- 수정(Update) 링크: modify_view로 변경 -->
                                <a href="modify_view?faqNo=${faq.faqNo}" class="admin-link" onclick="event.stopPropagation();">수정</a>
                                <!-- 삭제(Delete) 링크: delete로 변경 -->
                                <a href="delete?faqNo=${faq.faqNo}" class="admin-link delete-link" onclick="event.stopPropagation(); return confirm('정말 FAQ를 삭제하시겠습니까?');">삭제</a>
                                <span class="arrow">▼</span>
                            </div>
                        </div>
                        <!-- 답변 내용 -->
                        <div class="faq-answer">
                            <div class="faq-content-wrapper">
                                <p>A. ${faq.faqContent}</p>
                                <p style="margin-top: 15px; font-size: 0.85em; color: #999;">작성일: ${faq.faqDate2}</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <p style="text-align: center; padding: 30px; border: 1px solid #ddd; border-radius: 5px;">등록된 FAQ가 없습니다.</p>
            </c:otherwise>
        </c:choose>
    </div>
    
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const faqQuestions = document.querySelectorAll('.faq-question');

            faqQuestions.forEach(question => {
                question.addEventListener('click', function() {
                    const faqItem = this.closest('.faq-item'); // 가장 가까운 faq-item 부모 찾기
                    const answer = faqItem.querySelector('.faq-answer'); // 해당 항목의 답변 영역
                    
                    // 현재 faq-item에 'active' 클래스 토글
                    // 이 클래스가 CSS의 max-height와 transform을 제어합니다.
                    faqItem.classList.toggle('active');

                    // 답변 영역을 펼치거나 닫기
                    if (faqItem.classList.contains('active')) {
                        // 답변이 열릴 때: content-wrapper의 실제 높이로 max-height 설정
                        // answer.scrollHeight를 사용하면 max-height: 500px 대신 실제 높이로 설정되어 애니메이션이 더 부드럽지만,
                        // 단순화를 위해 CSS에서 지정한 max-height: 500px로 제어하도록 변경했습니다.
                        // (CSS의 .faq-item.active .faq-answer { max-height: 500px; } 가 대신 처리)
                    } else {
                        // 답변이 닫힐 때: max-height: 0 설정
                        // (CSS의 .faq-answer { max-height: 0; } 가 대신 처리)
                    }
                });
            });
        });
    </script>
	<footer>
			        <p>© 2025 차량 리콜 조회 시스템 | 고객센터: 1234-5678 | 이메일: support@recall.co.kr</p>
			</footer>
    
</body>
</html>