package com.boot.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RecallDTO {
    private Long id;
    private String maker;
    private String model_Name;
    private String make_Start;
    private String make_End;
    private String recall_Date;
    private String recall_Reason;
}
