package com.boot.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Criteria {
    private int pageNum;
    private int amount;

    public Criteria() {
        this(1, 10);
    }

    public int getPageStart() {
        return (this.pageNum - 1) * this.amount;
    }
}
