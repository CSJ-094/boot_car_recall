package com.boot.dto;

import lombok.Data;
// @AllArgsConstructor는 명시적 생성자와 충돌하므로 제거합니다.

@Data
public class Criteria {

    // --- 필드 ---
    private int pageNum;  // 현재 페이지 번호
    private int amount;   // 페이지당 보여줄 데이터 수

    // 다른사람꺼에서 추가된 검색 타입 필드
    private String type;

    // 양쪽에 존재하는 검색 키워드 필드
    private String keyword;

    // --- 생성자 ---
    public Criteria() {
        // 기본값: 1페이지, 10개씩. type과 keyword는 빈 문자열("")로 초기화
        this(1, 10, "", "");
    }

    // 다른사람꺼의 명시적 생성자에 type과 keyword를 추가
    public Criteria(int pageNum, int amount, String type, String keyword) {
        this.pageNum = pageNum;
        this.amount = amount;
        this.type = type;
        this.keyword = keyword;
    }

    // 다른사람꺼의 명시적 생성자 (pageNum, amount만 받음)를 오버로딩하여 유지
    public Criteria(int pageNum, int amount) {
        this(pageNum, amount, "", "");
    }


    // --- 메소드 ---
    // 데이터베이스 쿼리에서 사용할 offset 값을 계산하는 메소드 (양쪽 동일)
    public int getOffset() {
        return (this.pageNum - 1) * this.amount;
    }
}