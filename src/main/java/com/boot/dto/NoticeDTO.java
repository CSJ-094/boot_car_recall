package com.boot.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NoticeDTO {
	private Long noticeId;
	private String title;
	private String content;
	private String isUrgent;
	private Timestamp createdAt; 
	private Timestamp updatedAt; 
	private Long views;
	
	private String formattedDate;
}
