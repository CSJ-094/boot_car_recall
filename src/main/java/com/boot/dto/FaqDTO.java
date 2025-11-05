package com.boot.dto;

<<<<<<< HEAD
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
=======
import lombok.Data;

@Data
public class FaqDTO {
    private long faq_id;
    private String category;
    private String question;
    private String answer;
    private String created_at;
>>>>>>> ea43a775c9b39041c2c846933da45c1acbc879e0
}
