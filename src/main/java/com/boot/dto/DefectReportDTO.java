package com.boot.dto;

import lombok.Data;
import java.util.Date; // LocalDateTime 대신 Date를 임포트

@Data
public class DefectReportDTO {
    private Long id;
    private String reporterName;
    private String contact;
    private String carModel;
    private String vin;
    private String defectDetails;
    private Date reportDate; // 타입을 Date로 변경
}
