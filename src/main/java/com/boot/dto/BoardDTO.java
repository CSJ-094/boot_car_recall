package com.boot.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardDTO {
	private int boardNo;
	private String boardName;
	private String boardTitle;
	private String boardContent;
	private Timestamp boardDate;
	private String boardDate2;
	private int boardHit;

	private Long id;
	private String maker;
	private String modelName;
	private String recallDate;
}
