package com.boot.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FaqDTO {
	private int faqNo;
    private String faqTitle;
    private String faqContent;
    private Timestamp faqDate;
    private String faqDate2; // 화면 표시용 날짜 (예: 2025-11-04 11:49)
    private String faqCategory; // 카테고리
}
