package com.boot.dto;

import lombok.Data;

@Data
public class PageDTO {

    private int startPage;  // 화면에 보여지는 페이지 시작 번호
    private int endPage;    // 화면에 보여지는 페이지 끝 번호
    private boolean prev, next; // 이전, 다음 버튼 표시 여부

    private int total;      // 전체 데이터 수
    private Criteria cri;   // 현재 페이지, 페이지당 데이터 수

    public PageDTO(Criteria cri, int total) {
        this.cri = cri;
        this.total = total;

        // --- 10페이지 기준 로직 (Version 1) 채택 ---

        // 화면에 보여질 마지막 페이지 번호 (endPage) 계산
        // (ex: 1~10페이지는 10, 11~20페이지는 20)
        this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;

        // 화면에 보여질 시작 페이지 번호 (startPage) 계산
        this.startPage = this.endPage - 9; // 10개 단위이므로 10-1 = 9

        // 전체 마지막 페이지 번호 계산 (realEnd)
        int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));

        if (realEnd <= this.endPage) {
            this.endPage = realEnd;
        }

        // 이전(prev) 버튼 표시 여부
        this.prev = this.startPage > 1;

        // 다음(next) 버튼 표시 여부
        this.next = this.endPage < realEnd;
    }
}