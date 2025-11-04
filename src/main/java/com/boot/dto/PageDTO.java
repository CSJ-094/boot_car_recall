package com.boot.dto;

import lombok.Data;

@Data

public class PageDTO {
	private int startPage;
	private int endPage;
	private boolean prev, next;
	private int total;
	private Criteria cri;
	
	public PageDTO(int total, Criteria cri) {
		this.total = total;
		this.cri = cri;
		

		this.endPage = (int)(Math.ceil(cri.getPageNum() / 4.0)) * 4;
		

		this.startPage = this.endPage - 3;
		
//	    ex>total: 300, 현재 페이지: 3 -> endPage: 10 => 300*1.0 / 10 => 30페이지
//	    ex>total: 70, 현재 페이지: 3 -> endPage: 10 => 70*1.0 / 10 => 7페이지
		int realEnd = (int)Math.ceil((total * 1.0) / cri.getAmount());
		
//	    ex>7페이지 <= 10페이지 : endPage: 7페이지
//	    ex>30페이지 <= 10페이지 : endPage: 10페이지
		if (realEnd <= this.endPage) {
			this.endPage = realEnd;
		}
		
//	    1페이지보다 크면 존재 -> 참이고 아님 거짓으로 없음
		this.prev = this.startPage > 1;
		
//	    ex>10페이지 < 30페이지
		this.next = this.endPage < realEnd;

		System.out.println("=== PageDTO Debug ===");
		System.out.println("pageNum: " + cri.getPageNum());
		System.out.println("amount: " + cri.getAmount());
		System.out.println("total: " + total);
		System.out.println("startPage: " + startPage);
		System.out.println("endPage: " + endPage);
		System.out.println("realEnd: " + realEnd);
		System.out.println("=====================");
	}
}












