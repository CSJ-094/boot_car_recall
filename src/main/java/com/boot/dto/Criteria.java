package com.boot.dto;

import lombok.Data;

@Data
public class Criteria {
    private int pageNum;
    private int amount;
    private String type;
    private String keyword;
    public Criteria() {
        this(1, 4);
    }

    public Criteria(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
    }
}
