package com.boot.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Criteria {

    private int pageNum;  // 현재 페이지 번호
    private int amount;   // 페이지당 보여줄 데이터 수
    private String keyword; // 검색 키워드 추가

    public Criteria() {
        this(1, 10, ""); // 기본값: 1페이지, 10개씩, 빈 키워드
    }

    // 데이터베이스 쿼리에서 사용할 offset 값을 계산하는 메소드
    public int getOffset() {
        return (this.pageNum - 1) * this.amount;
    }
}
