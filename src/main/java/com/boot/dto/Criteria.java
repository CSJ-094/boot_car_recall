package com.boot.dto;

import lombok.Data;

@Data
public class Criteria {

    private int pageNum;  // 현재 페이지 번호
    private int amount;   // 페이지당 보여줄 데이터 수

    // (검색 기능)
    private String type;
    private String keyword;

    public Criteria() {

        this(1, 10);
    }

    public Criteria(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
    }

    public int getOffset() {
        return (this.pageNum - 1) * this.amount;
    }
}