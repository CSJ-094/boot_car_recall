package com.boot.dto;

<<<<<<< HEAD
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
=======
import lombok.Data;

@Data
public class NoticeDTO {
    private long notice_id;
    private String title;
    private String content;
    private String is_urgent;
    private int views;
    private String created_at;
    private String updated_at;
}
>>>>>>> ea43a775c9b39041c2c846933da45c1acbc879e0
